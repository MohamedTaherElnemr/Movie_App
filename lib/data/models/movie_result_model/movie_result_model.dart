import 'movie_model.dart';

class MovieResultModel {
  List<MovieModel>? results;

  MovieResultModel({this.results});

  factory MovieResultModel.fromJson(Map<String, dynamic> json) {
    return MovieResultModel(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'results': results?.map((e) => e.toJson()).toList(),
      };
}
