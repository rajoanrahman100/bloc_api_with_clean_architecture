import 'package:bloc_api_with_clean_architecture/core/entity/trailer.dart';
import 'package:bloc_api_with_clean_architecture/domain/movie/usecase/get_movie_trailer_usecase.dart';
import 'package:bloc_api_with_clean_architecture/presentation/watch/block/trailer_state.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit():super(TrailerLoading());

  void getMovieTrailer(int movieId)async{

    var data= await sl<GetMovieTrailerUseCase>().call(params: movieId);

    data.fold((error) {
      emit(TrailerError(message: error));
    }, (data) {
      TrailerEntity trailerEntity = data;
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: trailerEntity.key!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );

      emit(TrailerLoaded(youtubePlayerController: controller));
    });

  }
}