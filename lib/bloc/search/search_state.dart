part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {}

class SearchLoaded extends SearchState {
  final SearchResults results;
  const SearchLoaded(this.results);
  @override
  List<Object> get props => [results];
}
