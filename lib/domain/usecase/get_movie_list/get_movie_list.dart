import '../../../data/repositories/movie_repository.dart';
import '../../entities/result.dart';
import 'get_movie_list_param.dart';
import '../usecase.dart';

import '../../entities/movie.dart';

class GetMovieList implements UseCase<Result<List<Movie>>, GetMovieListParam> {
  final MovieRepository _movieRepository;

  GetMovieList({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<List<Movie>>> call(GetMovieListParam params) async {
    var movieResult = switch (params.category) {
      MovieListCategory.nowPlaying =>
        await _movieRepository.getNowPlaying(page: params.page),
      MovieListCategory.upcoming =>
        await _movieRepository.getUpcoming(page: params.page)
    };

    return switch (movieResult) {
      Success(value: final movies) => Result.success(movies),
      Failed(:final message) => Result.failed(message),
    };
  }
}
