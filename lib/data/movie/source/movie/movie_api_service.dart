import 'package:bloc_api_with_clean_architecture/core/constants/api_url.dart';
import 'package:bloc_api_with_clean_architecture/core/network/dio_client.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class MovieApiService {
  Future<Either> getTrendingMovies();
}

class MovieApiServiceImpl extends MovieApiService {
  @override
  Future<Either> getTrendingMovies() async{
    // TODO: implement getTrendingMovies
    try {
      var response = await sl<DioClient>().get(ApiUrl.trendingMovies);
      return Right(response.data);
    } on DioException catch (e) {
      return Left("Exception ${e.response!.data["message"]}");
    }
  }
}
