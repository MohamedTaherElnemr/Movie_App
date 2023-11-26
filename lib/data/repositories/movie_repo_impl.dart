import 'package:movies_app/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/data/models/cast_model/cast.dart';
import 'package:movies_app/data/models/movie_result_model/movie_model.dart';
import 'package:movies_app/data/models/videos_model/result.dart';
import 'package:movies_app/domain/repositories/movie_repo.dart';

class MovieRepoImpl extends MovieRepo {
  MovieRemoteDataSource movieRemoteDataSource = MovieRemoteDataSourceImpl();
  @override
  Future<List<MovieModel>?> getTopRatedMovies() async {
    try {
      var movies = movieRemoteDataSource.getTopRatedMovies();
      return movies;
    } on Exception {
      return [];
    }
  }

  @override
  Future<List<MovieModel>?> getNowPlayingMovies() async {
    try {
      var movies = movieRemoteDataSource.getNowPlayingMovies();
      return movies;
    } on Exception {
      return [];
    }
  }

  @override
  Future<List<MovieModel>?> getPopularMovies() async {
    try {
      var movies = movieRemoteDataSource.getPopularMovies();
      return movies;
    } on Exception {
      return [];
    }
  }

  @override
  Future<List<MovieModel>?> getUpcomingMovies() async {
    try {
      var movies = movieRemoteDataSource.getUpcomingMovies();
      return movies;
    } on Exception {
      return [];
    }
  }

  @override
  Future<List<CastModel>?> getCastCrew(int movieId) async {
    try {
      var cast = movieRemoteDataSource.getCastCrew(movieId);
      return cast;
    } on Exception {
      return [];
    }
  }

  @override
  Future<List<ResultModel>?> getVideos(videoId) async {
    try {
      var videos = movieRemoteDataSource.getVideos(videoId);
      return videos;
    } on Exception {
      return [];
    }
  }

  @override
  Future<List<MovieModel>?> searchMovies(String query) async {
    try {
      var searchResult = movieRemoteDataSource.searchMovies(query);
      return searchResult;
    } on Exception {
      return [];
    }
  }
}
