import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/data/models/cast_model/cast.dart';
import 'package:movies_app/data/models/movie_result_model/movie_model.dart';
import 'package:movies_app/data/models/videos_model/result.dart';
import 'package:movies_app/domain/usecases/get_cast_usecase.dart';
import 'package:movies_app/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_app/domain/usecases/get_popular_usecase.dart';
import 'package:movies_app/domain/usecases/get_top_rated_usecase.dart';
import 'package:movies_app/domain/usecases/get_upcoming_usecase.dart';
import 'package:movies_app/domain/usecases/get_videos_usecase.dart';
import 'package:movies_app/domain/usecases/search_usecase.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  GetNowPlayingUseCase getNowPlayingUseCase = GetNowPlayingUseCase();
  GetTopRatedUseCase getTopRatedUseCase = GetTopRatedUseCase();
  GetPopularUseCase getPopularUseCase = GetPopularUseCase();
  GetUpcomingUseCase getUpcomingUseCase = GetUpcomingUseCase();
  GetCastCrewUseCase getCastCrewUseCase = GetCastCrewUseCase();
  GetVideosUseCase getVideosUseCase = GetVideosUseCase();
  SearchMoviesUseCase searchMoviesUseCase = SearchMoviesUseCase();

  List<MovieModel>? topRatedMovies;
  List<MovieModel>? popularMovies;
  List<MovieModel>? upcomingMovies;
  List<MovieModel>? nowplayingMovies;
  List<CastModel>? cast;
  List<ResultModel>? videos;
  List<MovieModel>? searchResult;

  Future<void> getTopRatedMovies() async {
    emit(GetTopRatedMoviesLoadingState());
    await getTopRatedUseCase().then((value) {
      topRatedMovies = value;
      log('top rated done ');
      log(topRatedMovies!.length.toString());
      emit(GetTopRatedMoviesSuccessState());
    }).catchError((error) {
      emit(GetTopRatedMoviesFailedState(errorMessage: error));
    });
  }

  Future<void> getPopularMovies() async {
    emit(GetPopularMoviesLoadingState());
    await getPopularUseCase().then((value) {
      popularMovies = value;
      log('popular  done ');
      log(popularMovies!.length.toString());
      emit(GetPopularMoviesSuccessState());
    }).catchError((error) {
      emit(GetPopularMoviesFailedState(errorMessage: error));
    });
  }

  Future<void> getUpcomingMovies() async {
    emit(GetUpcomingMoviesLoadingState());
    await getUpcomingUseCase().then((value) {
      upcomingMovies = value;
      log('upcoming done ');
      log(upcomingMovies!.length.toString());
      emit(GetUpcomingMoviesSuccessState());
    }).catchError((error) {
      emit(GetUpcomingMoviesFailedState(errorMessage: error));
    });
  }

  Future<void> getNowPlayingMovies() async {
    emit(GetNowPlayingMoviesLoadingState());
    await getNowPlayingUseCase().then((value) {
      nowplayingMovies = value;
      log('now playing done ');
      log(nowplayingMovies!.length.toString());
      emit(GetNowPlayingMoviesSuccessState());
    }).catchError((error) {
      emit(GetNowPlayingMoviesFailedState(errorMessage: error));
    });
  }

  ///////////////////////

  Future<void> getCastCrew(int movieId) async {
    emit(GetCastLodingState());
    await getCastCrewUseCase(movieId).then((value) {
      cast = value;
      log('cast done');
      log(cast!.length.toString());
      emit(GetCastSuccessState());
    }).catchError((error) {
      emit(GetCastFailedState(errorMessage: error));
    });
  }

  void emptyCast() {
    cast = [];
    emit(EmptyCastState());
    log('cast is empty');
  }

  //////////////////////////////
  ///get videos /////

  Future<void> getVideos(VideoId) async {
    emit(GetVideosLoadingState());
    await getVideosUseCase(VideoId).then((value) {
      videos = value;
      log('videos done');
      log(videos!.length.toString());
      emit(GetVideosSuccessState());
    }).catchError((error) {
      emit(GetVideosFailedState(errorMessage: error));
    });
  }

  void emptyVideos() {
    videos = [];
    emit(EmptyVideoState());
  }

  void emitting() {
    emit(GetCastSuccessState());
  }

  ///////////////////// search Movies ////////

  Future<void> searchMovies(String query) async {
    emit(SearchMoviesLoadingState());
    await searchMoviesUseCase(query).then((value) {
      searchResult = value;
      log('search done');
      log(searchResult!.length.toString());
      emit(SearchMoviesSuccessState());
    }).catchError((error) {
      emit(SearchMoviesFailedState(errorMessage: error));
    });
  }
}
