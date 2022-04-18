import 'package:flutter/material.dart';
import 'package:fyta_assignment/fundation/route/fyta_route.dart';
import 'package:fyta_assignment/fundation/route/general_route.dart';
import 'package:fyta_assignment/fundation/theme.dart';

void main() {
  runApp(const MyApp());
}

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
      ],
      routes: GeneralRouter.pages,
      initialRoute: FytaRoute.cameraScreen,
    );
  }
}

