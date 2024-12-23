import 'package:bloc_api_with_clean_architecture/core/constants/api_url.dart';
import 'package:bloc_api_with_clean_architecture/core/network/dio_client.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class MovieApiService {
  Future<Either> getTrendingMovies();

  Future<Either> getNowPlaying();

  Future<Either> getMovieTrailer(int movieID);

  Future<Either> getRecommendationMovies(int movieId);

  Future<Either> getSimilarMovies(int movieId);

  Future<Either> searchMovie(String query);
}

class MovieApiServiceImpl extends MovieApiService {
  @override
  Future<Either> getTrendingMovies() async {
    // TODO: implement getTrendingMovies
    try {
      var response = await sl<DioClient>().get(ApiUrl.trendingMovies);
      return Right(response.data);
    } on DioException catch (e) {
      return Left("Exception ${e.response!.data["message"]}");
    }
  }

  @override
  Future<Either> getNowPlaying() async {
    // TODO: implement getNowPlaying
    try {
      var response = await sl<DioClient>().get(ApiUrl.nowPlayingMovies);
      return Right(response.data);
    } on DioException catch (e) {
      return Left("Exception ${e.response!.data["message"]}");
    }
  }

  @override
  Future<Either> getMovieTrailer(int movieID) async {
    // TODO: implement getMovieTrailer
    try {
      var response = await sl<DioClient>().get("${ApiUrl.movie}$movieID/trailer");
      return Right(response.data);
    } on DioException catch (e) {
      return Left("Exception ${e.response!.data["message"]}");
    }
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    // TODO: implement getRecommendationMovies
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.movie}$movieId/recommendations',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    // TODO: implement getSimilarMovies
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.movie}$movieId/similar',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> searchMovie(String query) async {
    // TODO: implement searchMovie
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.search}movie/$query',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
