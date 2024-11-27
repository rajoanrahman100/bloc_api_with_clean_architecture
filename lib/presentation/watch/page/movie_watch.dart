import 'package:bloc_api_with_clean_architecture/common/widget/appbar/app_bar.dart';
import 'package:bloc_api_with_clean_architecture/domain/movie/entities/movie.dart';
import 'package:bloc_api_with_clean_architecture/presentation/watch/page/video_vote_average.dart';
import 'package:bloc_api_with_clean_architecture/presentation/watch/widget/video_player.dart';
import 'package:bloc_api_with_clean_architecture/presentation/watch/widget/video_release_date.dart';
import 'package:bloc_api_with_clean_architecture/presentation/watch/widget/video_title.dart';
import 'package:flutter/material.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({super.key, required this.movieEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: movieEntity.id!),
            const SizedBox(height: 16,),
            VideoTitle(title: movieEntity.title!,),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(releaseDate: movieEntity.releaseDate!,),
                VideoVoteAverage(voteAverage: movieEntity.voteAverage!,)
              ],
            ),
            // const SizedBox(height: 16,),
            // VideoOverview(overview: movieEntity.overview!,),
            // const SizedBox(height: 16,),
            // RecommendationMovies(movieId: movieEntity.id!,),
            // const SizedBox(height: 16,),
            // SimilarMovies(movieId: movieEntity.id!,)
          ],
        ),
      ),
    );
  }
}
