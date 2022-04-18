import 'package:flutter/material.dart';
import 'package:fyta_assignment/fundation/locator.dart';
import 'package:fyta_assignment/fundation/route/fyta_route.dart';
import 'package:fyta_assignment/view/pages/camera_page/camera_page.dart';

import '../../bloc/fyta_bloc.dart';

class GeneralRouter {
  static Map<String, WidgetBuilder> pages = {
    FytaRoute.cameraScreen: (context) => BlocProvider(
          create: (context) => locator<SearchCubit>(),
          child: const CameraPage(),
        ),
  };
}
