import 'package:movie_bloc_retrofit/data/moviesfavorite/local/response/movies_favorite_entity.dart';
import 'package:movie_bloc_retrofit/database/db_provider.dart';

class MoviesDao {
  final dbProvider = DatabaseProvider.databaseProvider;

  Future<int> addMoviesFavorite(MoviesFavoriteEntity moviesFavoriteEntity) async {
    final db = await dbProvider.database;
    var result =
        db.insert(moviesFavoriteTable, moviesFavoriteEntity.toDatabaseJson());
    return result;
  }

  Future<List<MoviesFavoriteEntity>> getMovieFavorite(
      {List<String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null && query != '') {
      if (query.isNotEmpty)
        result = await db.query(moviesFavoriteTable,
            columns: columns, where: 'title LIKE ?', whereArgs: ["%$query%"]);
    } else {
      result = await db.query(moviesFavoriteTable,
          columns: columns, orderBy: 'id DESC');
    }

    List<MoviesFavoriteEntity> moviesFavorite = result.isNotEmpty
        ? result
            .map((item) => MoviesFavoriteEntity.fromDatabaseJson(item))
            .toList()
        : [];
    return moviesFavorite;
  }

  Future<int> deleteMoviesFavorite(int id) async {
    final db = await dbProvider.database;
    var result =
        db.delete(moviesFavoriteTable, where: 'id = ?', whereArgs: [id]);

    return result;
  }

  Future<MoviesFavoriteEntity> getMoviesFavoriteById(
      {List<String> columns, int id}) async {
    final db = await dbProvider.database;
    var result = await db.query(moviesFavoriteTable,
        columns: columns, where: 'id = ?', whereArgs: [id]);

    List<MoviesFavoriteEntity> moviesFavorite = result.isNotEmpty
        ? result
            .map((data) => MoviesFavoriteEntity.fromDatabaseJson(data))
            .toList()
        : [];

    MoviesFavoriteEntity moviesFavoriteEntity =
        moviesFavorite.isNotEmpty ? moviesFavorite[0] : null;

    return moviesFavoriteEntity;
  }
}
