import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  final CameraController cameraController;
  const CameraView({Key? key, required this.cameraController})
      : super(key: key);

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  Widget build(BuildContext context) {
    return CameraPreview(
      widget.cameraController,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onScaleStart: null,
          onScaleUpdate: null,
          onTapDown:
              null /*  (TapDownDetails details) =>
                onViewFinderTap(details, constraints) */
          ,
        );
      }),
    );
    
  }
}
