import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final String id;
  final String backdropPath;
  final String title;
  final int voteAverage;
  final String releaseDate;
  final String overView;

  const MovieEntity(
      {required this.posterPath,
      required this.id,
      required this.backdropPath,
      required this.title,
      required this.voteAverage,
      required this.releaseDate,
      required this.overView});

  @override
  List<Object?> get props => [id, title];

  @override
  bool get stringify => true;
}
