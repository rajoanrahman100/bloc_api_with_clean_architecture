import 'package:bloc_api_with_clean_architecture/domain/tv/usecase/get_popular_tv.dart';
import 'package:bloc_api_with_clean_architecture/presentation/home/block/populartv_state.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularTVCubit extends Cubit<PopularTVState> {
  PopularTVCubit() : super(PopularTVLoading());

  void getPopularTV() async {
    var data = await sl<GetPopularTVUseCase>().call();

    data.fold((error) {
      emit(PopularTVError(message: error));
    }, (data) {
      emit(PopularTVLoaded(tv: data));
    });
  }
}
