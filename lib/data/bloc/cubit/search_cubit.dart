import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fyta_assignment/data/repository_impl/search_repository_impl.dart';
import 'package:fyta_assignment/data/responses/search_results.dart';


part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepositoryImpl repository;
  SearchCubit(this.repository) : super(SearchInitial());

  void searchByImage(File file) async{
    emit(SearchLoading());
    final result = await repository.searchByImage(file);
    emit(SearchLoaded(result));
  }
}
