import 'package:movies_app/data/models/cast_model/cast.dart';
import 'package:movies_app/data/repositories/movie_repo_impl.dart';
import 'package:movies_app/domain/repositories/movie_repo.dart';

class GetCastCrewUseCase {
  MovieRepo movieRepo = MovieRepoImpl();

  Future<List<CastModel>?> call(int movieId) async {
    return movieRepo.getCastCrew(movieId);
  }
}
