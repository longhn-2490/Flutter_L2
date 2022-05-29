// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreData _$GenreDataFromJson(Map<String, dynamic> json) => $checkedCreate(
      'GenreData',
      json,
      ($checkedConvert) {
        final val = GenreData(
          id: $checkedConvert('id', (v) => v as int?),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );
