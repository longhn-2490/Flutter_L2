import 'package:flutter_lession_2/data/model/loadmore_data.dart';

import '../../model/movie_data.dart';
import '../../remote/api/movie_api.dart';
import '../movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApi _movieApi;

  const MovieRepositoryImpl(this._movieApi);


  @override
  Future<MovieData> getMovieDetail(int id) async {
    return await _movieApi.getMovieDetail(id);
  }

  @override
  Future<List<MovieData>> getMovies(String type, int page) async {
    return await _movieApi.getMovies(type, page).then((response) => response.movies ?? []);
  }
}
