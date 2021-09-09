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
  TextColumn get releaseDate => text().nullable()();
  RealColumn get voteAverage => real()();
  IntColumn get voteCount => integer()();
  BoolColumn get isFavorite => boolean().nullable().withDefault(Constant(false))();
}

@UseMoor(tables: [Favorites])
class DatabaseFavoriteMovie extends _$DatabaseFavoriteMovie {
  DatabaseFavoriteMovie()
      : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'favorite_movie.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<FavoriteMovie>> getAllFavoriteMovies() => select(favorites).get();

  Future insertFavoriteMovie(FavoriteMovie favoriteMovie) => into(favorites).insert(favoriteMovie);

  Future deleteFavoriteMovie(FavoriteMovie favoriteMovie) => delete(favorites).delete(favoriteMovie);
}