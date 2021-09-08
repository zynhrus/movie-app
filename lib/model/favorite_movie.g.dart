// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movie.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class FavoriteMovie extends DataClass implements Insertable<FavoriteMovie> {
  final int? id;
  final int idMovie;
  final String title;
  final String overview;
  final String? poster;
  final double voteAverage;
  final int voteCount;
  final bool? isFavorite;
  FavoriteMovie(
      {this.id,
      required this.idMovie,
      required this.title,
      required this.overview,
      this.poster,
      required this.voteAverage,
      required this.voteCount,
      this.isFavorite});
  factory FavoriteMovie.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FavoriteMovie(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idMovie: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_movie'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      overview: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}overview'])!,
      poster: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}poster']),
      voteAverage: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_average'])!,
      voteCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_count'])!,
      isFavorite: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_favorite']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['id_movie'] = Variable<int>(idMovie);
    map['title'] = Variable<String>(title);
    map['overview'] = Variable<String>(overview);
    if (!nullToAbsent || poster != null) {
      map['poster'] = Variable<String?>(poster);
    }
    map['vote_average'] = Variable<double>(voteAverage);
    map['vote_count'] = Variable<int>(voteCount);
    if (!nullToAbsent || isFavorite != null) {
      map['is_favorite'] = Variable<bool?>(isFavorite);
    }
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idMovie: Value(idMovie),
      title: Value(title),
      overview: Value(overview),
      poster:
          poster == null && nullToAbsent ? const Value.absent() : Value(poster),
      voteAverage: Value(voteAverage),
      voteCount: Value(voteCount),
      isFavorite: isFavorite == null && nullToAbsent
          ? const Value.absent()
          : Value(isFavorite),
    );
  }

  factory FavoriteMovie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FavoriteMovie(
      id: serializer.fromJson<int?>(json['id']),
      idMovie: serializer.fromJson<int>(json['idMovie']),
      title: serializer.fromJson<String>(json['title']),
      overview: serializer.fromJson<String>(json['overview']),
      poster: serializer.fromJson<String?>(json['poster']),
      voteAverage: serializer.fromJson<double>(json['voteAverage']),
      voteCount: serializer.fromJson<int>(json['voteCount']),
      isFavorite: serializer.fromJson<bool?>(json['isFavorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'idMovie': serializer.toJson<int>(idMovie),
      'title': serializer.toJson<String>(title),
      'overview': serializer.toJson<String>(overview),
      'poster': serializer.toJson<String?>(poster),
      'voteAverage': serializer.toJson<double>(voteAverage),
      'voteCount': serializer.toJson<int>(voteCount),
      'isFavorite': serializer.toJson<bool?>(isFavorite),
    };
  }

  FavoriteMovie copyWith(
          {int? id,
          int? idMovie,
          String? title,
          String? overview,
          String? poster,
          double? voteAverage,
          int? voteCount,
          bool? isFavorite}) =>
      FavoriteMovie(
        id: id ?? this.id,
        idMovie: idMovie ?? this.idMovie,
        title: title ?? this.title,
        overview: overview ?? this.overview,
        poster: poster ?? this.poster,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
        isFavorite: isFavorite ?? this.isFavorite,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteMovie(')
          ..write('id: $id, ')
          ..write('idMovie: $idMovie, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('poster: $poster, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idMovie.hashCode,
          $mrjc(
              title.hashCode,
              $mrjc(
                  overview.hashCode,
                  $mrjc(
                      poster.hashCode,
                      $mrjc(voteAverage.hashCode,
                          $mrjc(voteCount.hashCode, isFavorite.hashCode))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteMovie &&
          other.id == this.id &&
          other.idMovie == this.idMovie &&
          other.title == this.title &&
          other.overview == this.overview &&
          other.poster == this.poster &&
          other.voteAverage == this.voteAverage &&
          other.voteCount == this.voteCount &&
          other.isFavorite == this.isFavorite);
}

class FavoritesCompanion extends UpdateCompanion<FavoriteMovie> {
  final Value<int?> id;
  final Value<int> idMovie;
  final Value<String> title;
  final Value<String> overview;
  final Value<String?> poster;
  final Value<double> voteAverage;
  final Value<int> voteCount;
  final Value<bool?> isFavorite;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.idMovie = const Value.absent(),
    this.title = const Value.absent(),
    this.overview = const Value.absent(),
    this.poster = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.isFavorite = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.id = const Value.absent(),
    required int idMovie,
    required String title,
    required String overview,
    this.poster = const Value.absent(),
    required double voteAverage,
    required int voteCount,
    this.isFavorite = const Value.absent(),
  })  : idMovie = Value(idMovie),
        title = Value(title),
        overview = Value(overview),
        voteAverage = Value(voteAverage),
        voteCount = Value(voteCount);
  static Insertable<FavoriteMovie> custom({
    Expression<int?>? id,
    Expression<int>? idMovie,
    Expression<String>? title,
    Expression<String>? overview,
    Expression<String?>? poster,
    Expression<double>? voteAverage,
    Expression<int>? voteCount,
    Expression<bool?>? isFavorite,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idMovie != null) 'id_movie': idMovie,
      if (title != null) 'title': title,
      if (overview != null) 'overview': overview,
      if (poster != null) 'poster': poster,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (voteCount != null) 'vote_count': voteCount,
      if (isFavorite != null) 'is_favorite': isFavorite,
    });
  }

  FavoritesCompanion copyWith(
      {Value<int?>? id,
      Value<int>? idMovie,
      Value<String>? title,
      Value<String>? overview,
      Value<String?>? poster,
      Value<double>? voteAverage,
      Value<int>? voteCount,
      Value<bool?>? isFavorite}) {
    return FavoritesCompanion(
      id: id ?? this.id,
      idMovie: idMovie ?? this.idMovie,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      poster: poster ?? this.poster,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (idMovie.present) {
      map['id_movie'] = Variable<int>(idMovie.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (poster.present) {
      map['poster'] = Variable<String?>(poster.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    if (voteCount.present) {
      map['vote_count'] = Variable<int>(voteCount.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool?>(isFavorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('id: $id, ')
          ..write('idMovie: $idMovie, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('poster: $poster, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, FavoriteMovie> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FavoritesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idMovieMeta = const VerificationMeta('idMovie');
  late final GeneratedColumn<int?> idMovie = GeneratedColumn<int?>(
      'id_movie', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  late final GeneratedColumn<String?> overview = GeneratedColumn<String?>(
      'overview', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _posterMeta = const VerificationMeta('poster');
  late final GeneratedColumn<String?> poster = GeneratedColumn<String?>(
      'poster', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  late final GeneratedColumn<double?> voteAverage = GeneratedColumn<double?>(
      'vote_average', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _voteCountMeta = const VerificationMeta('voteCount');
  late final GeneratedColumn<int?> voteCount = GeneratedColumn<int?>(
      'vote_count', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _isFavoriteMeta = const VerificationMeta('isFavorite');
  late final GeneratedColumn<bool?> isFavorite = GeneratedColumn<bool?>(
      'is_favorite', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_favorite IN (0, 1))',
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idMovie,
        title,
        overview,
        poster,
        voteAverage,
        voteCount,
        isFavorite
      ];
  @override
  String get aliasedName => _alias ?? 'favorites';
  @override
  String get actualTableName => 'favorites';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteMovie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_movie')) {
      context.handle(_idMovieMeta,
          idMovie.isAcceptableOrUnknown(data['id_movie']!, _idMovieMeta));
    } else if (isInserting) {
      context.missing(_idMovieMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('poster')) {
      context.handle(_posterMeta,
          poster.isAcceptableOrUnknown(data['poster']!, _posterMeta));
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    } else if (isInserting) {
      context.missing(_voteAverageMeta);
    }
    if (data.containsKey('vote_count')) {
      context.handle(_voteCountMeta,
          voteCount.isAcceptableOrUnknown(data['vote_count']!, _voteCountMeta));
    } else if (isInserting) {
      context.missing(_voteCountMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite']!, _isFavoriteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteMovie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FavoriteMovie.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favorites];
}
