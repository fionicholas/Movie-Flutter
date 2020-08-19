import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'movies_item.g.dart';

@JsonSerializable()
class MoviesItem extends Equatable {
	@JsonKey(name : 'id')
	final int id;

	@JsonKey(name : 'title')
	final String title;

	@JsonKey(name : 'overview')
	final String overview;

	@JsonKey(name : 'release_date')
	final String releaseDate;

	@JsonKey(name : 'genre_ids')
	final List<int> genreIds;

	@JsonKey(name : 'vote_average')
	final double voteAverage;

	@JsonKey(name: 'popularity')
	final double popularity;

	@JsonKey(name: 'poster_path')
	final String posterPath;

	@JsonKey(name: 'backdrop_path')
	final String backdropPath;

	@JsonKey(name: 'original_name')
	final String tvName;

	@JsonKey(name: 'first_air_date')
	final String tvRelease;

	MoviesItem(
      this.id,
      this.title,
      this.overview,
      this.releaseDate,
      this.genreIds,
      this.voteAverage,
      this.popularity,
      this.posterPath,
			this.backdropPath,
      this.tvName,
      this.tvRelease);

	@override
  List<Object> get props => [
		id,
		title,
		overview,
		releaseDate,
		genreIds,
		voteAverage,
		popularity,
		posterPath,
		backdropPath,
		tvName,
		tvRelease,
  ];

	factory MoviesItem.fromJson(Map<String, dynamic> json) => _$MoviesItemFromJson(json);

	Map<String, dynamic> toJson() => _$MoviesItemToJson(this);
}
