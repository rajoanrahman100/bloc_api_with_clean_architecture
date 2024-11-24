import 'package:bloc_api_with_clean_architecture/core/constants/api_url.dart';
import 'package:bloc_api_with_clean_architecture/core/network/dio_client.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class TVApiService {
  Future<Either> getPopularTv();

  Future<Either> getRecommendationTVs(int tvId);

  Future<Either> getSimilarTVs(int tvId);

  Future<Either> getKeywords(int tvId);

  Future<Either> searchTV(String query);
}

class TVApiServiceImpl extends TVApiService {
  @override
  Future<Either> getKeywords(int tvId) {
    // TODO: implement getKeywords
    throw UnimplementedError();
  }

  @override
  Future<Either> getPopularTv() async {
    // TODO: implement getPopularTv
    try {
      var response = await sl<DioClient>().get(ApiUrl.popularTV);
      return Right(response.data);
    } on DioException catch (e) {
      return Left("Exception ${e.response!.data["message"]}");
    }
  }

  @override
  Future<Either> getRecommendationTVs(int tvId) {
    // TODO: implement getRecommendationTVs
    throw UnimplementedError();
  }

  @override
  Future<Either> getSimilarTVs(int tvId) {
    // TODO: implement getSimilarTVs
    throw UnimplementedError();
  }

  @override
  Future<Either> searchTV(String query) {
    // TODO: implement searchTV
    throw UnimplementedError();
  }
}
