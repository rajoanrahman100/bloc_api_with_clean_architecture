import 'package:bloc_api_with_clean_architecture/domain/movie/usecase/get_trending_movies_usecase.dart';
import 'package:bloc_api_with_clean_architecture/presentation/home/block/trnding_state.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingLoading());

  void getTrendingMovies() async {
    var data = await sl<GetTrendingMoviesUseCase>().call();

    data.fold((error) {
      emit(TrendingFailed(message: error));
    }, (data) {
      emit(TrendingLoaded(movies: data));
    });
  }
}
