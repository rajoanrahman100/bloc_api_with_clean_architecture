import 'package:bloc_api_with_clean_architecture/core/network/dio_client.dart';
import 'package:bloc_api_with_clean_architecture/data/auth/repositories/auth/auth.dart';
import 'package:bloc_api_with_clean_architecture/data/auth/source/auth/auth_api_service.dart';
import 'package:bloc_api_with_clean_architecture/domain/auth/repositories/auth.dart';
import 'package:bloc_api_with_clean_architecture/domain/auth/usecase/isloggedin_usecase.dart';
import 'package:bloc_api_with_clean_architecture/domain/auth/usecase/signin_usecase.dart';
import 'package:bloc_api_with_clean_architecture/domain/auth/usecase/signup_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setUpServiceLocator() {

  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthApiServiceImpl>(AuthApiServiceImpl());

  // Repostories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Usecases
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<IsLoggedUseCase>(IsLoggedUseCase());
}
