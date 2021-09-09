// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MyTicket extends DataClass implements Insertable<MyTicket> {
  final int? id;
  final int idMovie;
  final String title;
  final String? poster;
  final String seats;
  final String time;
  final String date;
  final String total;
  MyTicket(
      {this.id,
      required this.idMovie,
      required this.title,
      this.poster,
      required this.seats,
      required this.time,
      required this.date,
      required this.total});
  factory MyTicket.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MyTicket(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idMovie: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_movie'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      poster: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}poster']),
      seats: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}seats'])!,
      time: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time'])!,
      date: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      total: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total'])!,
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
    if (!nullToAbsent || poster != null) {
      map['poster'] = Variable<String?>(poster);
    }
    map['seats'] = Variable<String>(seats);
    map['time'] = Variable<String>(time);
    map['date'] = Variable<String>(date);
    map['total'] = Variable<String>(total);
    return map;
  }

  TicketsCompanion toCompanion(bool nullToAbsent) {
    return TicketsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idMovie: Value(idMovie),
      title: Value(title),
      poster:
          poster == null && nullToAbsent ? const Value.absent() : Value(poster),
      seats: Value(seats),
      time: Value(time),
      date: Value(date),
      total: Value(total),
    );
  }

  factory MyTicket.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MyTicket(
      id: serializer.fromJson<int?>(json['id']),
      idMovie: serializer.fromJson<int>(json['idMovie']),
      title: serializer.fromJson<String>(json['title']),
      poster: serializer.fromJson<String?>(json['poster']),
      seats: serializer.fromJson<String>(json['seats']),
      time: serializer.fromJson<String>(json['time']),
      date: serializer.fromJson<String>(json['date']),
      total: serializer.fromJson<String>(json['total']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'idMovie': serializer.toJson<int>(idMovie),
      'title': serializer.toJson<String>(title),
      'poster': serializer.toJson<String?>(poster),
      'seats': serializer.toJson<String>(seats),
      'time': serializer.toJson<String>(time),
      'date': serializer.toJson<String>(date),
      'total': serializer.toJson<String>(total),
    };
  }

  MyTicket copyWith(
          {int? id,
          int? idMovie,
          String? title,
          String? poster,
          String? seats,
          String? time,
          String? date,
          String? total}) =>
      MyTicket(
        id: id ?? this.id,
        idMovie: idMovie ?? this.idMovie,
        title: title ?? this.title,
        poster: poster ?? this.poster,
        seats: seats ?? this.seats,
        time: time ?? this.time,
        date: date ?? this.date,
        total: total ?? this.total,
      );
  @override
  String toString() {
    return (StringBuffer('MyTicket(')
          ..write('id: $id, ')
          ..write('idMovie: $idMovie, ')
          ..write('title: $title, ')
          ..write('poster: $poster, ')
          ..write('seats: $seats, ')
          ..write('time: $time, ')
          ..write('date: $date, ')
          ..write('total: $total')
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
                  poster.hashCode,
                  $mrjc(
                      seats.hashCode,
                      $mrjc(time.hashCode,
                          $mrjc(date.hashCode, total.hashCode))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyTicket &&
          other.id == this.id &&
          other.idMovie == this.idMovie &&
          other.title == this.title &&
          other.poster == this.poster &&
          other.seats == this.seats &&
          other.time == this.time &&
          other.date == this.date &&
          other.total == this.total);
}

class TicketsCompanion extends UpdateCompanion<MyTicket> {
  final Value<int?> id;
  final Value<int> idMovie;
  final Value<String> title;
  final Value<String?> poster;
  final Value<String> seats;
  final Value<String> time;
  final Value<String> date;
  final Value<String> total;
  const TicketsCompanion({
    this.id = const Value.absent(),
    this.idMovie = const Value.absent(),
    this.title = const Value.absent(),
    this.poster = const Value.absent(),
    this.seats = const Value.absent(),
    this.time = const Value.absent(),
    this.date = const Value.absent(),
    this.total = const Value.absent(),
  });
  TicketsCompanion.insert({
    this.id = const Value.absent(),
    required int idMovie,
    required String title,
    this.poster = const Value.absent(),
    required String seats,
    required String time,
    required String date,
    required String total,
  })  : idMovie = Value(idMovie),
        title = Value(title),
        seats = Value(seats),
        time = Value(time),
        date = Value(date),
        total = Value(total);
  static Insertable<MyTicket> custom({
    Expression<int?>? id,
    Expression<int>? idMovie,
    Expression<String>? title,
    Expression<String?>? poster,
    Expression<String>? seats,
    Expression<String>? time,
    Expression<String>? date,
    Expression<String>? total,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idMovie != null) 'id_movie': idMovie,
      if (title != null) 'title': title,
      if (poster != null) 'poster': poster,
      if (seats != null) 'seats': seats,
      if (time != null) 'time': time,
      if (date != null) 'date': date,
      if (total != null) 'total': total,
    });
  }

  TicketsCompanion copyWith(
      {Value<int?>? id,
      Value<int>? idMovie,
      Value<String>? title,
      Value<String?>? poster,
      Value<String>? seats,
      Value<String>? time,
      Value<String>? date,
      Value<String>? total}) {
    return TicketsCompanion(
      id: id ?? this.id,
      idMovie: idMovie ?? this.idMovie,
      title: title ?? this.title,
      poster: poster ?? this.poster,
      seats: seats ?? this.seats,
      time: time ?? this.time,
      date: date ?? this.date,
      total: total ?? this.total,
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
    if (poster.present) {
      map['poster'] = Variable<String?>(poster.value);
    }
    if (seats.present) {
      map['seats'] = Variable<String>(seats.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (total.present) {
      map['total'] = Variable<String>(total.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TicketsCompanion(')
          ..write('id: $id, ')
          ..write('idMovie: $idMovie, ')
          ..write('title: $title, ')
          ..write('poster: $poster, ')
          ..write('seats: $seats, ')
          ..write('time: $time, ')
          ..write('date: $date, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }
}

class $TicketsTable extends Tickets with TableInfo<$TicketsTable, MyTicket> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TicketsTable(this._db, [this._alias]);
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
  final VerificationMeta _posterMeta = const VerificationMeta('poster');
  late final GeneratedColumn<String?> poster = GeneratedColumn<String?>(
      'poster', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _seatsMeta = const VerificationMeta('seats');
  late final GeneratedColumn<String?> seats = GeneratedColumn<String?>(
      'seats', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _timeMeta = const VerificationMeta('time');
  late final GeneratedColumn<String?> time = GeneratedColumn<String?>(
      'time', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<String?> date = GeneratedColumn<String?>(
      'date', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _totalMeta = const VerificationMeta('total');
  late final GeneratedColumn<String?> total = GeneratedColumn<String?>(
      'total', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, idMovie, title, poster, seats, time, date, total];
  @override
  String get aliasedName => _alias ?? 'tickets';
  @override
  String get actualTableName => 'tickets';
  @override
  VerificationContext validateIntegrity(Insertable<MyTicket> instance,
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
    if (data.containsKey('poster')) {
      context.handle(_posterMeta,
          poster.isAcceptableOrUnknown(data['poster']!, _posterMeta));
    }
    if (data.containsKey('seats')) {
      context.handle(
          _seatsMeta, seats.isAcceptableOrUnknown(data['seats']!, _seatsMeta));
    } else if (isInserting) {
      context.missing(_seatsMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyTicket map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MyTicket.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TicketsTable createAlias(String alias) {
    return $TicketsTable(_db, alias);
  }
}

abstract class _$DatabaseMyTickets extends GeneratedDatabase {
  _$DatabaseMyTickets(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $TicketsTable tickets = $TicketsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tickets];
}
