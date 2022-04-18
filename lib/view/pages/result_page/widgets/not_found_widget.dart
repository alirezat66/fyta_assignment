import 'package:flutter/material.dart';
import 'package:fyta_assignment/fundation/languages/languages.dart';

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
            Languages.of(context).notFoundResult,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            Languages.of(context).notFoundDesc,
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
                  Languages.of(context).notFoundButtonTitle,
                  style: Theme.of(context).textTheme.bodyText1,
                )),
          )
        ],
      ),
    );
  }
}
