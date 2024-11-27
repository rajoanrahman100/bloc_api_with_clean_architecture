import 'package:bloc_api_with_clean_architecture/domain/movie/entities/movie.dart';

abstract class GenericDataState {}

class DataLoading extends GenericDataState {}

class DataLoaded<T> extends GenericDataState {  //<T> is generic Data Type. This is the data type we want to load.
  final T data;

  DataLoaded({required this.data});
}

class FailureDataLoaded extends GenericDataState {
  final String message;

  FailureDataLoaded({required this.message});
}
