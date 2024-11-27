import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlaying();
  Future<Either> getMovieTrailer(int movieID);
}