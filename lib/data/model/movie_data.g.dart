// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieData _$MovieDataFromJson(Map<String, dynamic> json) => $checkedCreate(
      'MovieData',
      json,
      ($checkedConvert) {
        final val = MovieData(
          id: $checkedConvert('id', (v) => v as int?),
          title: $checkedConvert('title', (v) => v as String?),
          popularity:
              $checkedConvert('popularity', (v) => (v as num?)?.toDouble()),
          video: $checkedConvert('video', (v) => v as bool?),
          overview: $checkedConvert('overview', (v) => v as String?),
          adult: $checkedConvert('adult', (v) => v as bool?),
          posterPath: $checkedConvert('poster_path', (v) => v as String?),
          originalTitle: $checkedConvert('original_title', (v) => v as String?),
          backdropPath: $checkedConvert('backdrop_path', (v) => v as String?),
          voteCount: $checkedConvert('vote_count', (v) => v as int?),
          voteAverage:
              $checkedConvert('vote_average', (v) => (v as num?)?.toDouble()),
          releaseDate: $checkedConvert('release_date', (v) => v as String?),
          genreIds: $checkedConvert('genre_ids',
              (v) => (v as List<dynamic>?)?.map((e) => e as int).toList()),
          genres: $checkedConvert(
              'genres',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => GenreData.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'posterPath': 'poster_path',
        'originalTitle': 'original_title',
        'backdropPath': 'backdrop_path',
        'voteCount': 'vote_count',
        'voteAverage': 'vote_average',
        'releaseDate': 'release_date',
        'genreIds': 'genre_ids'
      },
    );
