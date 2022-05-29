import 'package:json_annotation/json_annotation.dart';

import '../../model/movie_data.dart';
part 'movie_response.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class MovieResponse {
  @JsonKey(name: 'page')
  final int? page;

  @JsonKey(name: 'results')
  final List<MovieData>? movies;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  @JsonKey(name: 'total_results')
  final int? totalResults;

  MovieResponse({this.page, this.movies, this.totalPages, this.totalResults});

  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);

}
