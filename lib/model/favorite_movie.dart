import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'favorite_movie.g.dart';

@DataClassName('FavoriteMovie')
class Favorites extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  IntColumn get idMovie => integer()();
  TextColumn get title => text()();
  TextColumn get overview => text()();
  TextColumn get poster => text().nullable()();
  RealColumn get voteAverage => real()();
  IntColumn get voteCount => integer()();
  BoolColumn get isFavorite => boolean().nullable().withDefault(Constant(false))();
}

@UseMoor(tables: [Favorites])
class Database extends _$Database {
  Database()
      : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<FavoriteMovie>> getAllFavoriteMovies() => select(favorites).get();

  Future insertFavoriteMovie(FavoriteMovie favoriteMeal) => into(favorites).insert(favoriteMeal);

  Future deleteFavoriteMovie(FavoriteMovie favoriteMeal) => delete(favorites).delete(favoriteMeal);
}