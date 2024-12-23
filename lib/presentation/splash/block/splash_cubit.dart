import 'package:bloc_api_with_clean_architecture/domain/auth/usecase/isloggedin_usecase.dart';
import 'package:bloc_api_with_clean_architecture/presentation/splash/block/splash_state.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash()); //Set the initial state

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));

    final isLoggedIn = await sl<IsLoggedUseCase>().call();

    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
