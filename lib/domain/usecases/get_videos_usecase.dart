import 'package:movies_app/data/models/videos_model/result.dart';
import 'package:movies_app/data/repositories/movie_repo_impl.dart';
import 'package:movies_app/domain/repositories/movie_repo.dart';

class GetVideosUseCase {
  MovieRepo movieRepo = MovieRepoImpl();

  Future<List<ResultModel>?> call(videoId) async {
    return movieRepo.getVideos(videoId);
  }
}
