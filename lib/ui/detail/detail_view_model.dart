import 'package:flutter/material.dart';
import 'package:flutter_lession_2/data/model/movie_data.dart';
import 'package:flutter_lession_2/data/repository/movie_repository.dart';

class DetailViewModel extends ChangeNotifier {
  final MovieRepository _movieRepository;

  DetailViewModel(this._movieRepository);

  Future<MovieData> getMovieDetail(int id) async {
    return await _movieRepository.getMovieDetail(id);
  }
}
