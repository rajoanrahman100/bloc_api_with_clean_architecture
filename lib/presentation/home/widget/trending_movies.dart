import 'package:bloc_api_with_clean_architecture/core/configs/assets/app_images.dart';
import 'package:bloc_api_with_clean_architecture/presentation/home/block/trending_cubit.dart';
import 'package:bloc_api_with_clean_architecture/presentation/home/block/trnding_state.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (_, state) {
          if (state is TrendingLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TrendingLoaded) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink:
                  state.movies.map((item) => AppImages.movieImageBasePath + item.posterPath.toString()).toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: true,
            );
          }
          if (state is TrendingFailed) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
