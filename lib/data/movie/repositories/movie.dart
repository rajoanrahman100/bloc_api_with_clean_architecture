import 'package:bloc_api_with_clean_architecture/common/helper/mapper/movie.dart';
import 'package:bloc_api_with_clean_architecture/common/helper/mapper/trailer.dart';
import 'package:bloc_api_with_clean_architecture/core/models/trailer.dart';
import 'package:bloc_api_with_clean_architecture/data/movie/model/movie.dart';
import 'package:bloc_api_with_clean_architecture/data/movie/source/movie/movie_api_service.dart';
import 'package:bloc_api_with_clean_architecture/domain/movie/repositories/movie.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryIml extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    // TODO: implement getTrendingMovies
    var data = await sl<MovieApiServiceImpl>().getTrendingMovies();

    return data.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content']).map((e) => MovieMapper.toEntity(MovieModel.fromJson(e))).toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getNowPlaying() async {
    // TODO: implement getNowPlaying
    var data = await sl<MovieApiServiceImpl>().getNowPlaying();
    return data.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content']).map((e) => MovieMapper.toEntity(MovieModel.fromJson(e))).toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getMovieTrailer(int movieID) async {
    // TODO: implement getMovieTrailer
    var data = await sl<MovieApiServiceImpl>().getMovieTrailer(movieID);
    return data.fold((error) {
      return Left(error);
    }, (data) {
      var movies = TrailerMapper.toEntity(TrailerModel.fromJson(data["trailer"]));
      return Right(movies);
    });
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    // TODO: implement getRecommendationMovies
    var returnedData = await sl<MovieApiServiceImpl>().getRecommendationMovies(movieId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    // TODO: implement getSimilarMovies
    var returnedData = await sl<MovieApiServiceImpl>().getSimilarMovies(movieId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> searchMovie(String query) async {
    // TODO: implement searchMovie
    var returnedData = await sl<MovieApiServiceImpl>().searchMovie(query);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
      return Right(movies);
    });
  }
}
