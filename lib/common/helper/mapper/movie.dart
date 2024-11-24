

import 'package:bloc_api_with_clean_architecture/domain/movie/entities/movie.dart';

import '../../../data/movie/model/movie.dart';

class MovieMapper {

  //Converting model to movie entity

  static MovieEntity toEntity(MovieModel movie) {
    return MovieEntity(
      backdropPath: movie.backdropPath, 
      id: movie.id, 
      title: movie.title, 
      originalTitle: movie.originalTitle, 
      overview: movie.overview, 
      posterPath: movie.posterPath, 
      mediaType: movie.mediaType, 
      adult: movie.adult, 
      originalLanguage: movie.originalLanguage, 
      genreIds: movie.genreIds, 
      popularity: movie.popularity, 
      releaseDate: movie.releaseDate, 
      video: movie.video, 
      voteAverage: movie.voteAverage, 
      voteCount: movie.voteCount
    );
  }
}