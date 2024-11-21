import 'package:bloc_api_with_clean_architecture/common/helper/navigation/app_navigation.dart';
import 'package:bloc_api_with_clean_architecture/core/configs/assets/app_images.dart';
import 'package:bloc_api_with_clean_architecture/presentation/auth/page/signin.dart';
import 'package:bloc_api_with_clean_architecture/presentation/home/page/home.dart';
import 'package:bloc_api_with_clean_architecture/presentation/splash/block/splash_cubit.dart';
import 'package:bloc_api_with_clean_architecture/presentation/splash/block/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            //Redirect user to Login page
            AppNavigator.pushReplacement(context,  SignInPage());
          }
          if (state is Authenticated) {
            AppNavigator.pushReplacement(context,  HomePage());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppImages.splashBackground))),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.center, end: Alignment.bottomCenter, colors: [
                const Color(0xff1A1B20).withOpacity(0),
                const Color(0xff1A1B20),
              ])),
            )
          ],
        ),
      ),
    );
  }
}
