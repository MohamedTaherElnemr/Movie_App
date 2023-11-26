import 'result.dart';

class VideosModel {
  int? id;
  List<ResultModel>? results;

  VideosModel({this.id, this.results});

  factory VideosModel.fromJson(Map<String, dynamic> json) => VideosModel(
        id: json['id'] as int?,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => ResultModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'results': results?.map((e) => e.toJson()).toList(),
      };
}
