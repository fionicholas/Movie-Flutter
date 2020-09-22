import 'package:movie_bloc_retrofit/data/movies/remote/response/movies_item.dart';

class MoviesFavoriteEntity {
  int id, voteCount;
  String title,
      overview,
      releaseDate,
      voteAverage,
      popularity,
      posterPath,
      backdropPath,
      tvName,
      tvRelease,
      originalLanguage;

  MoviesFavoriteEntity(
      {this.id,
      this.title,
      this.overview,
      this.releaseDate,
      this.voteAverage,
      this.popularity,
      this.posterPath,
      this.backdropPath,
      this.tvName,
      this.tvRelease,
      this.voteCount,
      this.originalLanguage});

  MoviesItem toMovie() {
    return MoviesItem(
      id,
      title,
      overview,
      releaseDate,
      [],
      double.parse(voteAverage),
      double.parse(popularity),
      posterPath,
      backdropPath,
      tvName,
      tvRelease,
      voteCount,
      originalLanguage,
    );
  }

  factory MoviesFavoriteEntity.fromDatabaseJson(Map<String, dynamic> data) =>
      MoviesFavoriteEntity(
        id: data['id'] ?? 0,
        title: data['title'] ?? '',
        overview: data['overview'] ?? '',
        releaseDate: data['releaseDate'] ?? '',
        voteAverage: data['voteAverage'] ?? '',
        popularity: data['popularity'] ?? '',
        posterPath: data['posterPath'] ?? '',
        backdropPath: data['backdropPath'] ?? '',
        tvName: data['tvName'] ?? '',
        tvRelease: data['tvRelease'] ?? '',
        voteCount: data['voteCount'] ?? 0,
        originalLanguage: data['originalLanguage'] ?? '',
      );

  Map<String, dynamic> toDatabaseJson() {
    var map = {
      "id": this.id ?? 0,
      "title": this.title ?? '',
      "overview": this.overview ?? '',
      "releaseDate": this.releaseDate ?? '',
      "voteAverage": this.voteAverage ?? '',
      "popularity": this.popularity ?? '',
      "posterPath": this.posterPath ?? '',
      "backdropPath": this.backdropPath ?? '',
      "tvName": this.tvName ?? '',
      "tvRelease": this.tvRelease ?? '',
      "voteCount": this.voteCount ?? 0,
      "originalLanguage": this.originalLanguage ?? ''
    };

    if (map['id'] != null) map['id'] = this.id ?? '';

    return map;
  }
}
