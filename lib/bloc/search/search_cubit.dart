import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fyta_assignment/data/repository/search_repository.dart';
import 'package:fyta_assignment/data/responses/search_results.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository repository;
  SearchCubit(this.repository) : super(SearchInitial());

  void searchByImage(File file) async {
    emit(SearchLoading());
    try {
      final result = await repository.searchByImage(file);
      emit(SearchLoaded(result));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void takePhoto() {
    emit(SearchLoading());
  }
  void initPageAgain(){
    emit(SearchInitial());
  }
}
