import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fyta_assignment/data/responses/search_results.dart';

import '../fixture/fixture_reader.dart';

void main() {
  test('test search result model', () {
    //arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('results.json'));
    //act
    final result = SearchResults.fromJson(jsonMap);

    //assert
    expect(result.results.isNotEmpty, true);
  });
}
