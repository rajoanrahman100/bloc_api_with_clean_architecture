import 'package:bloc_api_with_clean_architecture/domain/movie/entities/movie.dart';

abstract class TrendingState {}

class TrendingLoading extends TrendingState {}

class TrendingLoaded extends TrendingState {
  final List<MovieEntity> movies;

  TrendingLoaded({required this.movies});
}

class TrendingFailed extends TrendingState {
  final String message;

  TrendingFailed({required this.message});
}
