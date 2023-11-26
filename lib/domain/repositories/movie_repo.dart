import 'package:movies_app/data/models/cast_model/cast.dart';
import 'package:movies_app/data/models/movie_result_model/movie_model.dart';
import 'package:movies_app/data/models/videos_model/result.dart';

abstract class MovieRepo {
  Future<List<MovieModel>?> getTopRatedMovies();
  Future<List<MovieModel>?> getPopularMovies();
  Future<List<MovieModel>?> getNowPlayingMovies();
  Future<List<MovieModel>?> getUpcomingMovies();
  Future<List<CastModel>?> getCastCrew(int movieId);
  Future<List<ResultModel>?> getVideos(videoId);
  Future<List<MovieModel>?> searchMovies(String query);
}
