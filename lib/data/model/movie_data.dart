import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../config/utils/constants.dart';
import 'genre_data.dart';

part 'movie_data.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class MovieData implements Equatable {
  final int? id;
  final String? title;
  final double? popularity;
  final bool? video;
  final String? overview;
  final bool? adult;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  @JsonKey(name: 'genres')
  final List<GenreData>? genres;

  MovieData({
    this.id,
    this.title,
    this.popularity,
    this.video,
    this.overview,
    this.adult,
    this.posterPath,
    this.originalTitle,
    this.backdropPath,
    this.voteCount,
    this.voteAverage,
    this.releaseDate,
    this.genreIds,
    this.genres,
  });

  factory MovieData.fromJson(Map<String, dynamic> json) =>
      _$MovieDataFromJson(json);

  String getImagePath() {
    return preImageUrl + '$posterPath';
  }

  String getBackImagePath() {
    return preImageUrl + '$backdropPath';
  }

  String getGenre() {
    return genres?.first.name ?? '';
  }

  @override
  List<Object?> get props => [
        id,
        title,
        popularity,
        video,
        overview,
        adult,
        posterPath,
        originalTitle,
        backdropPath,
        voteCount,
        voteAverage,
        releaseDate,
        genreIds,
        genres,
      ];

  @override
  bool? get stringify => true;
}
