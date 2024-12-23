import 'package:bloc_api_with_clean_architecture/common/helper/mapper/tv.dart';
import 'package:bloc_api_with_clean_architecture/data/tv/model/tv.dart';
import 'package:bloc_api_with_clean_architecture/data/tv/source/tv_api_service.dart';
import 'package:bloc_api_with_clean_architecture/domain/tv/repositories/tv.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:dartz/dartz.dart';

class TVRepositoryImpl extends TVRepository {
  @override
  Future<Either> getKeywords(int tvId) {
    // TODO: implement getKeywords
    throw UnimplementedError();
  }

  @override
  Future<Either> getPopularTV() async {
    // TODO: implement getPopularTV
    var data = await sl<TVApiService>().getPopularTv();

    return data.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content']).map((e) => TvMapper.toEntity(TVModel.fromJson(e))).toList();
      return Right(movies);
    });
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
