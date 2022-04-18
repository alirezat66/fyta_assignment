import 'package:flutter/material.dart';
import 'package:fyta_assignment/fundation/route/fyta_route.dart';
import 'package:fyta_assignment/view/pages/camera_page.dart';

class GeneralRouter {
  static Map<String, WidgetBuilder> pages = {
    FytaRoute.cameraScreen: (context) => const CameraPage(),
        
  };
}