// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MovieResponse',
      json,
      ($checkedConvert) {
        final val = MovieResponse(
          page: $checkedConvert('page', (v) => v as int?),
          movies: $checkedConvert(
              'results',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => MovieData.fromJson(e as Map<String, dynamic>))
                  .toList()),
          totalPages: $checkedConvert('total_pages', (v) => v as int?),
          totalResults: $checkedConvert('total_results', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'movies': 'results',
        'totalPages': 'total_pages',
        'totalResults': 'total_results'
      },
    );
