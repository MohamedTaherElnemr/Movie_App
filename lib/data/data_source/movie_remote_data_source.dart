import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/core/api/api_constants.dart';
import 'package:movies_app/core/api/api_key.dart';
import 'package:movies_app/data/models/cast_model/cast.dart';
import 'package:movies_app/data/models/cast_model/cast_model.dart';

import 'package:movies_app/data/models/movie_result_model/movie_model.dart';
import 'package:movies_app/data/models/movie_result_model/movie_result_model.dart';
import 'package:movies_app/data/models/videos_model/result.dart';
import 'package:movies_app/data/models/videos_model/videos_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>?> getPopularMovies();
  Future<List<MovieModel>?> getNowPlayingMovies();
  Future<List<MovieModel>?> getUpcomingMovies();
  Future<List<MovieModel>?> getTopRatedMovies();
  Future<List<CastModel>?> getCastCrew(int movieId);
  Future<List<ResultModel>?> getVideos(videoId);
  Future<List<MovieModel>?> searchMovies(String query);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  @override
  Future<List<MovieModel>?> getPopularMovies() async {
    var url = Uri.parse(
        '${ApiConstants.baseUrl}movie/popular?api_key=${ApiKeys.apiKey}');
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      var popularMovies =
          MovieResultModel.fromJson(json.decode(response.body)).results;

      return popularMovies;
    } else {
      return [];
    }
  }

  @override
  Future<List<MovieModel>?> getNowPlayingMovies() async {
    var url = Uri.parse(
        '${ApiConstants.baseUrl}movie/now_playing?api_key=${ApiKeys.apiKey}');
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      var nowPlayingmovies =
          MovieResultModel.fromJson(json.decode(response.body)).results;

      return nowPlayingmovies;
    } else {
      return [];
    }
  }

  @override
  Future<List<MovieModel>?> getTopRatedMovies() async {
    var url = Uri.parse(
        '${ApiConstants.baseUrl}movie/top_rated?api_key=${ApiKeys.apiKey}');
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      var topRatedmovies =
          MovieResultModel.fromJson(json.decode(response.body)).results;

      return topRatedmovies;
    } else {
      return [];
    }
  }

  @override
  Future<List<MovieModel>?> getUpcomingMovies() async {
    var url = Uri.parse(
        '${ApiConstants.baseUrl}movie/upcoming?api_key=${ApiKeys.apiKey}');
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      var upcomingMovies =
          MovieResultModel.fromJson(json.decode(response.body)).results;

      return upcomingMovies;
    } else {
      return [];
    }
  }

  @override
  Future<List<CastModel>?> getCastCrew(int movieId) async {
    var url = Uri.parse(
        '${ApiConstants.baseUrl}movie/$movieId/credits?api_key=${ApiKeys.apiKey}');
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      var cast = CastCrewModel.fromJson(json.decode(response.body)).cast;

      return cast;
    } else {
      return [];
    }
  }

  @override
  Future<List<ResultModel>?> getVideos(videoId) async {
    var url = Uri.parse(
        '${ApiConstants.baseUrl}movie/$videoId/videos?api_key=${ApiKeys.apiKey}');
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      var videos = VideosModel.fromJson(json.decode(response.body)).results;

      return videos;
    } else {
      return [];
    }
  }

  @override
  Future<List<MovieModel>?> searchMovies(String query) async {
    var url = Uri.parse(
        '${ApiConstants.baseUrl}search/movie?api_key=${ApiKeys.apiKey}&&query=$query');
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      var searchResult =
          MovieResultModel.fromJson(json.decode(response.body)).results;

      return searchResult;
    } else {
      return [];
    }
  }
}
