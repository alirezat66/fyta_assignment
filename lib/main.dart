import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fyta_assignment/fundation/route/fyta_route.dart';
import 'package:fyta_assignment/fundation/route/general_route.dart';
import 'package:fyta_assignment/fundation/theme.dart';

import 'fundation/languages/app_localization_delegate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    debugPrint(e.description);
  }
  runApp(const MyApp());
}

List<CameraDescription> cameras = <CameraDescription>[];

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: fytaTheme,
      locale: _locale,
      supportedLocales: const [
        Locale('en', ''),
        Locale('gr', ''),
      ],
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routes: GeneralRouter.pages,
      initialRoute: FytaRoute.cameraScreen,
    );
  }
}
