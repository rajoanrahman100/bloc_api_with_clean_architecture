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
      return Right(data);
    });
  }
} 
