import 'cast.dart';

class CastCrewModel {
  int? id;
  List<CastModel>? cast;

  CastCrewModel({this.id, this.cast});

  factory CastCrewModel.fromJson(Map<String, dynamic> json) => CastCrewModel(
        id: json['id'] as int?,
        cast: (json['cast'] as List<dynamic>?)
            ?.map((e) => CastModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'cast': cast?.map((e) => e.toJson()).toList(),
      };
}
