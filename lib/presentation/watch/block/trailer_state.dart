import 'package:bloc_api_with_clean_architecture/core/entity/trailer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TrailerState {}

class TrailerLoading extends TrailerState {}

class TrailerLoaded extends TrailerState {
  final YoutubePlayerController youtubePlayerController;

  TrailerLoaded({required this.youtubePlayerController});
}

class TrailerError extends TrailerState {
  final String message;

  TrailerError({required this.message});
}