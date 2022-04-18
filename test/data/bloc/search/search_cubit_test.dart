import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fyta_assignment/bloc/fyta_bloc.dart';
import 'package:fyta_assignment/data/responses/search_results.dart';
import 'package:mockito/mockito.dart';

import '../../fixture/fixture_reader.dart';
import '../../repository/search_repository_test.dart';
import '../../repository/search_repository_test.mocks.dart';

void main() {
  late SearchRepositoryImplForTest repository;
  late MockFile file;
  late SearchResults results;
  setUp(() {
    repository = SearchRepositoryImplForTest();
    file = MockFile();
    results = SearchResults.fromJson(json.decode(fixture('results.json')));
  });
  setUpCaller() {
    when(repository.searchByImage(file)).thenAnswer((_) async => results);
  }

  SearchCubit buildBloc() {
    return SearchCubit(repository);
  }

  group('constructor', () {
    test('works properly', () {
      expect(buildBloc, returnsNormally);
    });
    test('has correct initial state', () {
      expect(
        buildBloc().state,
        equals(SearchInitial()),
      );
    });
  });
  group('test search', () {
    setUp(() {
      setUpCaller();
    });
    blocTest<SearchCubit, SearchState>('change state from init to loaded',
        build: buildBloc,
        act: (cubit) {
          cubit.searchByImage(file);
        },
        expect: () => [SearchLoading(), SearchLoaded(results)]);
  });
}
