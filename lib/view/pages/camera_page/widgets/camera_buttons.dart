import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CameraButtons extends StatelessWidget {
  final VoidCallback onTakePhoto;
  final VoidCallback onGallerySelect;

  const CameraButtons(
      {Key? key, required this.onTakePhoto, required this.onGallerySelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight * 2,
      width: MediaQuery.of(context).size.width,
      color: Colors.black.withOpacity(0.5),
      child: Stack(
        alignment: Alignment.center,
        children: [
          InkWell(
              onTap: onTakePhoto,
              child: SvgPicture.asset('images/icons/camera_icon.svg')),
          Positioned(
              left: kToolbarHeight,
              child: InkWell(
                  onTap: onGallerySelect,
                  child: SvgPicture.asset('images/icons/gallery_icon.svg'))),
        ],
      ),
    );
  }
}
