import 'package:fyta_assignment/fundation/languages/languages.dart';

class LanguageEn extends Languages {
  @override
  String get photoTitle => 'Photo Identification';
  @override
  String get notFoundResult => 'We didn’t find your plant?';

  @override
  String get notFoundButtonTitle => 'Retake Photo';

  @override
  String get notFoundDesc =>
      'Retake the photo or send us the picutre so that we can help you find it.';

  @override
  String get cameraNotFound => 'Camera Not initialized';

  @override
  String get imageTaken => 'Image taken and sent to server for analyze';
}
