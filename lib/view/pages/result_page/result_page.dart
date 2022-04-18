import 'package:flutter/material.dart';
import 'package:fyta_assignment/view/pages/result_page/widgets/not_found_widget.dart';
import 'package:fyta_assignment/view/pages/result_page/widgets/result_item.dart';
import 'package:fyta_assignment/view/pages/result_page/widgets/result_list_view.dart';

import '../../../data/argument/result_argument.dart';

class ResultPage extends StatelessWidget {
  final ResultArgument argument;
  const ResultPage(
    this.argument, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leadingWidth: 90,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                Text(
                  'Back',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          title: Text(
            'Results',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        body: argument.results != null
            // ignore: prefer_const_constructors
            ? ResultListView(
                file: argument.file,
                result: argument.results!,
              )
            : const Center(
                child: NotFoundWidget(),
              ),
      ),
    );
  }
}
