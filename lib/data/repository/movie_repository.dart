import '../model/movie_data.dart';
import '../model/loadmore_data.dart';


abstract class MovieRepository {
  Future<List<MovieData>> getMovies(String type, int page);

  Future<MovieData> getMovieDetail(int id);
}
