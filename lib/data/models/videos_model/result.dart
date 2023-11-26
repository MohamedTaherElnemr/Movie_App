class ResultModel {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  DateTime? publishedAt;
  String? id;

  ResultModel({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        iso6391: json['iso_639_1'] as String?,
        iso31661: json['iso_3166_1'] as String?,
        name: json['name'] as String?,
        key: json['key'] as String?,
        site: json['site'] as String?,
        size: json['size'] as int?,
        type: json['type'] as String?,
        official: json['official'] as bool?,
        publishedAt: json['published_at'] == null
            ? null
            : DateTime.parse(json['published_at'] as String),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'iso_639_1': iso6391,
        'iso_3166_1': iso31661,
        'name': name,
        'key': key,
        'site': site,
        'size': size,
        'type': type,
        'official': official,
        'published_at': publishedAt?.toIso8601String(),
        'id': id,
      };
}
