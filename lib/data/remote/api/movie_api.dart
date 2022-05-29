import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../model/movie_data.dart';
import '../response/movie_response.dart';

part 'movie_api.g.dart';

@RestApi()
abstract class MovieApi {
  factory MovieApi(Dio dioBuilder) = _MovieApi;

  @GET('/movie/{type}')
  Future<MovieResponse> getMovies(@Path('type') String type,
      @Query('page') int page);

  @GET('/movie/{id}')
  Future<MovieData> getMovieDetail(@Path('id') final int id);
}
