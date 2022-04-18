import 'package:flutter/material.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages) as Languages;
  }

  String get photoTitle;
  String get notFoundResult;
  String get notFoundDesc;
  String get notFoundButtonTitle;
  String get cameraNotFound;
}
