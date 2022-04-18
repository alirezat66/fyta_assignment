import 'package:flutter/material.dart';
import 'package:fyta_assignment/fundation/languages/languages.dart';

class CameraProblemWidget extends StatelessWidget {
  final VoidCallback onInitialRequest;
  const CameraProblemWidget({Key? key, required this.onInitialRequest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onInitialRequest,
      child: Text(
        Languages.of(context).cameraNotFound,
        style:  TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
