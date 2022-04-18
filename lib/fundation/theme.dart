import 'package:flutter/material.dart';

final fytaTheme = ThemeData(
  textTheme: const TextTheme(
    headline4: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w900,
      fontFamily: 'Avenir',
    ),
    headline5: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w500,
      fontFamily: 'Avenir',
    ),
    bodyText2: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: 'Avenir'),
    bodyText1: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: 'Avenir'),
    subtitle1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: 'Avenir'),
  ),
  appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
          fontSize: 21,
          height: 1.4,
          fontFamily: "Avenir",
          fontWeight: FontWeight.w900,
          color: Colors.white)),
  colorScheme: const ColorScheme(
      primary: Color(0xffA2EFAB),
      secondary: Colors.blue,
      surface: Colors.white,
      background: Colors.black,
      error: Colors.redAccent,
      onPrimary: Colors.yellowAccent,
      onSecondary: Colors.green,
      onSurface: Colors.white,
      onBackground: Colors.indigo,
      onError: Colors.pink,
      brightness: Brightness.dark),
  primarySwatch: Colors.green,
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      filled: true,
      fillColor: const Color(0xff767680).withOpacity(0.24),
      prefixIconColor: const Color(0xffA1A1A4).withOpacity(0.60),
      hintStyle: TextStyle(
        fontFamily: 'sfPro',
        color: const Color(0xffEBEBF5).withOpacity(0.60),
        fontSize: 17,
      ),
      alignLabelWithHint: false,
      contentPadding: EdgeInsets.zero),
);