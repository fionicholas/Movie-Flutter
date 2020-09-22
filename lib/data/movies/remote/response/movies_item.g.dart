// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesItem _$MoviesItemFromJson(Map<String, dynamic> json) {
  return MoviesItem(
    json['id'] as int,
    json['title'] as String,
    json['overview'] as String,
    json['release_date'] as String,
    (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
    (json['vote_average'] as num)?.toDouble(),
    (json['popularity'] as num)?.toDouble(),
    json['poster_path'] as String,
    json['backdrop_path'] as String,
    json['original_name'] as String,
    json['first_air_date'] as String,
    json['vote_count'] as int,
    json['original_language'] as String,
  );
}

Map<String, dynamic> _$MoviesItemToJson(MoviesItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'genre_ids': instance.genreIds,
      'vote_average': instance.voteAverage,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'original_name': instance.tvName,
      'first_air_date': instance.tvRelease,
      'vote_count': instance.voteCount,
      'original_language': instance.originalLanguage,
    };
