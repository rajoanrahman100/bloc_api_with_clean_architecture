import 'package:bloc_api_with_clean_architecture/presentation/splash/block/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash()); //Set the initial state

  void appStarted()async{
    await Future.delayed(const Duration(seconds: 2));
    emit(UnAuthenticated());
  }

}
