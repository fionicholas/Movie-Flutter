// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResult _$MovieResultFromJson(Map<String, dynamic> json) {
  return MovieResult(
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : MoviesItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MovieResultToJson(MovieResult instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
