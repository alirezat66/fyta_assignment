import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fyta_assignment/data/client/dio_client.dart';
import 'package:fyta_assignment/data/repository_impl/search_repository_impl.dart';
import 'package:fyta_assignment/data/responses/search_results.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../fixture/fixture_reader.dart';
import 'search_repository_test.mocks.dart';

class MockFile extends Mock implements File {}

@GenerateMocks([FytaApi])
@GenerateMocks([
  SearchRepositoryImpl
], customMocks: [
  MockSpec<SearchRepositoryImpl>(
      as: #SearchRepositoryImplForTest, returnNullOnMissingStub: true),
])
void main() {
  late MockFytaApi api;
  late SearchRepositoryImplForTest mockRepo;
  late MockFile file;
  late SearchResults results;
  setUp(() {
    api = MockFytaApi();
    mockRepo = SearchRepositoryImplForTest();
    file = MockFile();
    results = SearchResults.fromJson(json.decode(fixture('results.json')));
    when(mockRepo.searchByImage(file)).thenAnswer((_) async => results);
  });
  test('test search by image', () async {
    //act
    final result = await mockRepo.searchByImage(file);
    // assert
    expect(result.results.isNotEmpty, true);
  });
}
