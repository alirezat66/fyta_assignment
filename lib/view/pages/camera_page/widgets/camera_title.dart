import 'package:flutter/material.dart';

import '../../../../fundation/languages/languages.dart';


class CameraTitle extends StatelessWidget {
  const CameraTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              height: kToolbarHeight * 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.5),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(Languages.of(context).photoTitle),
                  )),
            );
  }
}