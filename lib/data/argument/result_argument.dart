import 'dart:io';

import 'package:fyta_assignment/data/responses/search_results.dart';

class ResultArgument {
  final  SearchResults  results;
  final File  file;
  ResultArgument({
    required this.results,
    required this.file,
  });

}
