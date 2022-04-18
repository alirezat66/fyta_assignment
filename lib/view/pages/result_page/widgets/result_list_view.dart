import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyta_assignment/data/responses/search_results.dart';
import 'package:fyta_assignment/view/pages/result_page/widgets/result_item.dart';

class ResultListView extends StatelessWidget {
  final File file;
  final SearchResults result;
  const ResultListView({Key? key, required this.file, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ResultItemWidget(
              imageFile: file,
              name: result.results[index].species.scientificName,
              nameAuthorship:
                  result.results[index].species.scientificNameAuthorship,
              rate: result.results[index].score,
              id: result.results[index].gbif.id,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 24,
            );
          },
          itemCount: result.results.length),
    );
  }
}
