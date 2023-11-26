import 'package:movies_app/data/models/movie_result_model/movie_model.dart';
import 'package:movies_app/data/repositories/movie_repo_impl.dart';
import 'package:movies_app/domain/repositories/movie_repo.dart';

class GetNowPlayingUseCase {
  MovieRepo movieRepo = MovieRepoImpl();

  Future<List<MovieModel>?> call() async {
    return movieRepo.getNowPlayingMovies();
  }
}
