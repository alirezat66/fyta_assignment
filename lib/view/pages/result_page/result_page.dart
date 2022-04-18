import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyta_assignment/bloc/search/search_cubit.dart';
import 'package:fyta_assignment/data/responses/search_results.dart';
import 'package:fyta_assignment/view/pages/result_page/widgets/result_item.dart';

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
            onTap:()=> Navigator.pop(context),
            child: Row(
              
              children: [
                const SizedBox(width: 16,),
                const Icon(Icons.arrow_back_ios,color: Colors.black,),
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
        body: argument.results.results.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ResultItemWidget(
                        imageFile: argument.file,
                        name: argument
                            .results.results[index].species.scientificName,
                        nameAuthorship: argument.results.results[index].species
                            .scientificNameAuthorship,
                        rate: argument.results.results[index].score,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 24,
                      );
                    },
                    itemCount: argument.results.results.length),
              )
            : const Center(
                child: Text(
                  'We cant find',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
      ),
    );
  }
}
