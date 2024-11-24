import 'package:bloc_api_with_clean_architecture/core/network/dio_client.dart';
import 'package:bloc_api_with_clean_architecture/data/auth/repositories/auth/auth.dart';
import 'package:bloc_api_with_clean_architecture/data/auth/source/auth/auth_api_service.dart';
import 'package:bloc_api_with_clean_architecture/data/movie/repositories/movie.dart';
import 'package:bloc_api_with_clean_architecture/data/movie/source/movie/movie_api_service.dart';
import 'package:bloc_api_with_clean_architecture/domain/auth/repositories/auth.dart';
import 'package:bloc_api_with_clean_architecture/domain/auth/usecase/isloggedin_usecase.dart';
import 'package:bloc_api_with_clean_architecture/domain/auth/usecase/signin_usecase.dart';
import 'package:bloc_api_with_clean_architecture/domain/auth/usecase/signup_usecase.dart';
import 'package:bloc_api_with_clean_architecture/domain/movie/repositories/movie.dart';
import 'package:bloc_api_with_clean_architecture/domain/movie/usecase/get_trending_movies_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setUpServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthApiServiceImpl>(AuthApiServiceImpl());

  sl.registerSingleton<MovieApiService>(MovieApiServiceImpl());
  sl.registerSingleton<MovieApiServiceImpl>(MovieApiServiceImpl());

  // Repostories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryIml());

  // Usecases ());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<IsLoggedUseCase>(IsLoggedUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
}
