import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fyta_assignment/bloc/fyta_bloc.dart';
import 'package:fyta_assignment/data/argument/result_argument.dart';
import 'package:fyta_assignment/fundation/languages/languages.dart';
import 'package:fyta_assignment/fundation/route/fyta_route.dart';
import 'package:fyta_assignment/view/pages/camera_page/widgets/camera_buttons.dart';
import 'package:fyta_assignment/view/pages/camera_page/widgets/camera_view.dart';
import 'package:fyta_assignment/view/widgets/loading_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../main.dart';
import 'widgets/camera_problem_widget.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? controller;
  late File imageFile;
  @override
  void initState() {
    _ambiguate(WidgetsBinding.instance)?.addObserver(this);

    _initialize();
    super.initState();
  }

  @override
  void dispose() {
    _ambiguate(WidgetsBinding.instance)?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // !!!: this line is import for re initialized when we back from background
      _initialize();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state is SearchLoaded) {
            Navigator.pushNamed(context, FytaRoute.resultScreen,
                arguments:
                    ResultArgument(results: state.results, file: imageFile));
          }
        },
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchLoading) {
              return const LoadingWidget();
            } else {
              return Stack(
                alignment: Alignment.center,
                children: [
                  (controller == null || !controller!.value.isInitialized)
                      ? CameraProblemWidget(
                          onInitialRequest: () => _initialize())
                      : CameraView(
                          cameraController: controller!,
                        ),
                  Positioned(
                    top: 0,
                    child: Container(
                      height: kToolbarHeight * 2,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black.withOpacity(0.5),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(Languages.of(context).photoTitle),
                          )),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: CameraButtons(
                        onGallerySelect: () {
                          _selectImage();
                        },
                        onTakePhoto: () {
                          _onTakePictureButtonPressed();
                        },
                      )),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  void _onTakePictureButtonPressed() {
    context.read<SearchCubit>().takePhoto();
    takePicture().then((XFile? file) async {
      if (mounted) {
        debugPrint(file!.path);
        imageFile = File(file.path);
        debugPrint(imageFile.path);
        context.read<SearchCubit>().searchByImage(imageFile);

        MotionToast.success(description: const Text('Image take'))
            .show(context);
      }
    });
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      MotionToast.error(
        description: const Text('Error: select a camera first.'),
      ).show(context);
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    MotionToast.error(
      description: Text('Error: ${e.code}\n${e.description}'),
    ).show(context);
  }

  _initialize() {
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  void _selectImage() async{
   final file=  await ImagePicker().pickImage(source: ImageSource.gallery);
   if (file == null) {
      return;
    }
    imageFile = File(file.path);
    debugPrint(imageFile.path);
    context.read<SearchCubit>().searchByImage(imageFile);
  }
}

T? _ambiguate<T>(T? value) => value;
