import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'We didn’t find your plant?',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: const Color(0xff313133)),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Retake the photo or send us the picutre so that we can help you find it.',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(height: 1.6),
          ),
          const SizedBox(
            height: 36,
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Retake Photo',
                  style: Theme.of(context).textTheme.bodyText1,
                )),
          )
        ],
      ),
    );
  }
}
