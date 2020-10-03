import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final moviesFavoriteTable = 'movies_favorite';

class DatabaseProvider {
  static final DatabaseProvider databaseProvider = DatabaseProvider();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _createDatabase();
    return _database;
  }

  _createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "db_movies.db");

    var database = await openDatabase(path,
        version: 1, onCreate: _initDB, onUpgrade: _onUpgrade);
    return database;
  }

  void _initDB(Database database, int version) async {
    await database.execute("CREATE TABLE $moviesFavoriteTable ("
        "id INTEGER PRIMARY KEY,"
        "title TEXT, "
        "overview TEXT, "
        "releaseDate TEXT, "
        "voteAverage TEXT, "
        "popularity TEXT, "
        "posterPath TEXT, "
        "backdropPath TEXT, "
        "tvName TEXT, "
        "tvRelease TEXT, "
        "voteCount INTEGER, "
        "originalLanguage TEXT "
        ")");
  }

  void _onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }
}
