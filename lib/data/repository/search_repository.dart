import 'dart:io';

import 'package:fyta_assignment/data/responses/search_results.dart';

abstract  class SearchRepository{
  Future<SearchResults> searchByImage(File file);
}