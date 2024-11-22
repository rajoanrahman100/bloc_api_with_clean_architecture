import 'package:bloc_api_with_clean_architecture/core/configs/theme/app_theme.dart';
import 'package:bloc_api_with_clean_architecture/presentation/splash/block/splash_cubit.dart';
import 'package:bloc_api_with_clean_architecture/presentation/splash/page/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //Make the status bar transparent
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
        )
    );


    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
          home: const SplashPage()
      ),
    );
  }
}


