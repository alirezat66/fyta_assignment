import 'dart:io';

import 'package:fyta_assignment/data/client/dio_client.dart';
import 'package:fyta_assignment/data/repository/search_repository.dart';
import 'package:fyta_assignment/data/responses/search_results.dart';

class SearchRepositoryImpl implements SearchRepository {
  final FytaApi api;
  SearchRepositoryImpl(this.api);
  @override
  Future<SearchResults> searchByImage(File file) async {
    final response = await api.postFileAsync('identify/all', file);
    return SearchResults.fromJson(response.data);
  }
}
