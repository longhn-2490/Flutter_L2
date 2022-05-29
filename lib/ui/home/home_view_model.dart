import 'package:flutter/material.dart';
import 'package:flutter_lession_2/config/utils/constants.dart';
import 'package:flutter_lession_2/data/model/movie_data.dart';
import 'package:flutter_lession_2/data/repository/movie_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final MovieRepository _movieRepository;

  HomeViewModel(this._movieRepository);

  Future<List<MovieData>> getMovies() async {
    return await _movieRepository.getMovies(popular, 1);
  }
}
