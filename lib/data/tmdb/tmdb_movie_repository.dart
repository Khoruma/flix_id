import 'package:dio/dio.dart';
import '../repositories/movie_repository.dart';
import '../../domain/entities/actor.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/entities/result.dart';

class TmdbMovieRepository implements MovieRepository {
  TmdbMovieRepository({Dio? dio}) : _dio = dio ?? Dio();

  final Dio? _dio;

  final String accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3M2NiMmZkZTk1YjZlOGRiNjRjY2JlYTY0MDM2N2JiMyIsIm5iZiI6MTcyNTk1OTY0Ny4wMTcxOTUsInN1YiI6IjY1OWNlMTk3M2ZhYmEwMDBmMDcxMzRmZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mlt3bnM2S9nhYIZ0ZWTsPVMcLPgrIlJCtzY5TYmhfZw';

  late final Options _options = Options(headers: {
    'authorization': 'Bearer $accessToken',
    'accept': 'application/json',
  });

  @override
  Future<Result<List<Actor>>> getActors({required int id}) async {
    try {
      final response = await _dio!.get(
          'https://api.themoviedb.org/3/movie/movie_id/credits?language=en-US',
          options: _options);
      // * MENGAMBIL DATA ACTORS
      final result =
          List<Map<String, dynamic>>.from(response.data['cast']); // * KEY CAST

      // * CONVERT DATA TO ACTOR
      return Result.success(result.map((e) => Actor.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<MovieDetail>> getDetail({required int id}) async {
    try {
      final response = await _dio!.get(
          'https://api.themoviedb.org/3/movie/$id?language=en-US',
          options: _options);

      return Result.success(MovieDetail.fromJSON(response.data));
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlaying({int page = 1}) async =>
      _getMovies(_MovieCategory.nowPlaying.toString(), page: page);

  @override
  Future<Result<List<Movie>>> getUpcoming({int page = 1}) async =>
      _getMovies(_MovieCategory.upcoming.toString(), page: page);

  Future<Result<List<Movie>>> _getMovies(String category,
      {int page = 1}) async {
    try {
      final response = await _dio!.get(
          'https://api.themoviedb.org/3/movie/$category?language=en-US&page=$page',
          options: _options);

      //* MENGAMBIL DATA DARI API DENGAN KEY RESULTS
      final result = List<Map<String, dynamic>>.from(
          response.data['results']); //* RESULTS KEY

      // * CONVERT KE LIST DARI MAP
      return Result.success(result.map((e) => Movie.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed("${e.message}");
    }
  }
}

enum _MovieCategory {
  nowPlaying('now_playing'),
  upcoming('upcoming');

  final String _instring;

  const _MovieCategory(String inString) : _instring = inString;

  @override
  String toString() => _instring;
}
