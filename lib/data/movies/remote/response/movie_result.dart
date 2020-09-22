import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_bloc_retrofit/data/movies/remote/response/movies_item.dart';

part 'movie_result.g.dart';

@JsonSerializable()
class MovieResult extends Equatable {
  @JsonKey(name: 'results')
  final List<MoviesItem> results;

  const MovieResult([this.results = const[]]);

  @override
  List<Object> get props => [results];

  factory MovieResult.fromJson(Map<String, dynamic> json) => _$MovieResultFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResultToJson(this);
}