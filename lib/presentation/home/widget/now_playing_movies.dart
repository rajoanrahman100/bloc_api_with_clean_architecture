import 'package:bloc_api_with_clean_architecture/common/bloc/generic_data_cubit.dart';
import 'package:bloc_api_with_clean_architecture/common/bloc/generic_data_state.dart';
import 'package:bloc_api_with_clean_architecture/common/widget/movie/movie_card.dart';
import 'package:bloc_api_with_clean_architecture/domain/movie/entities/movie.dart';
import 'package:bloc_api_with_clean_architecture/domain/movie/usecase/get_now_playing_movies_usecase.dart';
import 'package:bloc_api_with_clean_architecture/presentation/home/block/now_playing_cubit.dart';
import 'package:bloc_api_with_clean_architecture/presentation/home/block/now_playing_state.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData<List<MovieEntity>>(sl<GetNowPlayingMoviesUseCase>()),
      child: BlocBuilder<GenericDataCubit,GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading){
            return const Center(
              child: CircularProgressIndicator()
            );
          }
          
          if (state is DataLoaded ){
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return MovieCard(movieEntity: state.data[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10,),
                itemCount: state.data.length
              ),
            );
          }

          if (state is FailureDataLoaded) {
            return Center(child: Text(state.message));
          }

          return Container();
        },
      )
    );
  }
}