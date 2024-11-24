import 'package:bloc_api_with_clean_architecture/domain/movie/usecase/get_now_playing_movies_usecase.dart';
import 'package:bloc_api_with_clean_architecture/domain/movie/usecase/get_trending_movies_usecase.dart';
import 'package:bloc_api_with_clean_architecture/presentation/home/block/now_playing_state.dart';
import 'package:bloc_api_with_clean_architecture/presentation/home/block/trnding_state.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingLoading());

  void getNowPlayingMovies() async {
    var data = await sl<GetNowPlayingMoviesUseCase>().call();

    data.fold((error) {
      emit(NowPlayingFailed(message: error));
    }, (data) {
      emit(NowPlayingLoaded(movies: data));
    });
  }
}
