import 'package:bloc_api_with_clean_architecture/domain/tv/entities/tv.dart';

abstract class PopularTVState {}

class PopularTVLoading extends PopularTVState {}

class PopularTVLoaded extends PopularTVState {
  final List<TVEntity> tv;

  PopularTVLoaded({required this.tv});
}

class PopularTVError extends PopularTVState {
  final String message;
  PopularTVError({required this.message});
}