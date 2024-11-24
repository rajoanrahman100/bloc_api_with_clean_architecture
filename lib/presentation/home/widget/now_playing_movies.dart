import 'package:bloc_api_with_clean_architecture/common/widget/movie/movie_card.dart';
import 'package:bloc_api_with_clean_architecture/presentation/home/block/now_playing_cubit.dart';
import 'package:bloc_api_with_clean_architecture/presentation/home/block/now_playing_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlayingCubit()..getNowPlayingMovies(),
      child: BlocBuilder<NowPlayingCubit,NowPlayingState>(
        builder: (context, state) {
          if (state is NowPlayingLoading){
            return const Center(
              child: CircularProgressIndicator()
            );
          }
          
          if (state is NowPlayingLoaded ){
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return MovieCard(movieEntity: state.movies[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10,),
                itemCount: state.movies.length
              ),
            );
          }

          if (state is NowPlayingFailed) {
            return Center(child: Text(state.message));
          }

          return Container();
        },
      )
    );
  }
}