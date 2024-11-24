import 'package:bloc_api_with_clean_architecture/domain/movie/entities/movie.dart';

abstract class NowPlayingState {}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingLoaded extends NowPlayingState {
  final List<MovieEntity> movies;

  NowPlayingLoaded({required this.movies});
}

class NowPlayingFailed extends NowPlayingState {
  final String message;

  NowPlayingFailed({required this.message});
}
