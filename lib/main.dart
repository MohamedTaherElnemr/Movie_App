import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/usecases/get_top_rated_usecase.dart';
import 'package:movies_app/presentation/blocs/cubit/app_cubit.dart';
import 'package:movies_app/presentation/screens/home_screen.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  // GetTopRatedUseCase getTopRatedUseCase = GetTopRatedUseCase();
  // getTopRatedUseCase();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
            create: (BuildContext context) => AppCubit()
              ..getTopRatedMovies()
              ..getPopularMovies()
              ..getUpcomingMovies()
              ..getNowPlayingMovies()),
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: AppColor.vulcan),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
