part of 'app_cubit.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

final class AppInitial extends AppState {}

final class GetTopRatedMoviesSuccessState extends AppState {}

final class GetTopRatedMoviesFailedState extends AppState {
  final String errorMessage;

  const GetTopRatedMoviesFailedState({required this.errorMessage});
}

final class GetTopRatedMoviesLoadingState extends AppState {}

///////////////////////////////

final class GetPopularMoviesLoadingState extends AppState {}

final class GetPopularMoviesSuccessState extends AppState {}

final class GetPopularMoviesFailedState extends AppState {
  final String errorMessage;

  const GetPopularMoviesFailedState({required this.errorMessage});
}

////////////////////////

final class GetUpcomingMoviesLoadingState extends AppState {}

final class GetUpcomingMoviesSuccessState extends AppState {}

final class GetUpcomingMoviesFailedState extends AppState {
  final String errorMessage;

  const GetUpcomingMoviesFailedState({required this.errorMessage});
}

//////////////////////////

final class GetNowPlayingMoviesLoadingState extends AppState {}

final class GetNowPlayingMoviesSuccessState extends AppState {}

final class GetNowPlayingMoviesFailedState extends AppState {
  final String errorMessage;

  const GetNowPlayingMoviesFailedState({required this.errorMessage});
}

////////////////////////////////////////

final class GetCastLodingState extends AppState {}

final class GetCastSuccessState extends AppState {}

final class GetCastFailedState extends AppState {
  final String errorMessage;

  const GetCastFailedState({required this.errorMessage});
}

final class EmptyCastState extends AppState {}

final class EmptyVideoState extends AppState {}

//////////////// get videos ////////////

final class GetVideosLoadingState extends AppState {}

final class GetVideosSuccessState extends AppState {}

final class GetVideosFailedState extends AppState {
  final String errorMessage;

  const GetVideosFailedState({required this.errorMessage});
}

////////////////////// Search Movies //////////////

final class SearchMoviesLoadingState extends AppState {}

final class SearchMoviesSuccessState extends AppState {}

final class SearchMoviesFailedState extends AppState {
  final String errorMessage;

  const SearchMoviesFailedState({required this.errorMessage});
}
