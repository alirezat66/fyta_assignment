import 'package:flutter/material.dart';

class CameraProblemWidget extends StatelessWidget {
  final  VoidCallback onInitialRequest;
  const CameraProblemWidget({Key? key,required this.onInitialRequest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>onInitialRequest ,
      child: const Text(
        'Camera Not initialized',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}