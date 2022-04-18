import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fyta_assignment/fundation/languages/languages.dart';
import 'package:fyta_assignment/view/pages/widgets/camera_buttons.dart';
import 'package:fyta_assignment/view/pages/widgets/camera_view.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../main.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? controller;
  XFile? imageFile;

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
      body: Stack(
        alignment: Alignment.center,
        children: [
          (controller == null || !controller!.value.isInitialized)
              ? TextButton(
                  onPressed: () => _initialize(),
                  child: const Text(
                    'Camera Not initialized',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                )
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
                onGallerySelect: () {},
                onTakePhoto: () {},
              )),
        ],
      ),
    );
  }

  void onTakePictureButtonPressed() {
    takePicture().then((XFile? file) {
      if (mounted) {
        setState(() {
          imageFile = file;
        });
        if (file != null) {
          MotionToast.success(description: const Text('Image take'))
              .show(context);
        }
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
}

T? _ambiguate<T>(T? value) => value;
