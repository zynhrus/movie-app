import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'ticket.g.dart';

@DataClassName('MyTicket')
class Tickets extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  IntColumn get idMovie => integer()();
  TextColumn get title => text()();
  TextColumn get poster => text().nullable()();
  TextColumn get seats => text()();
  TextColumn get time => text()();
  TextColumn get date => text()();
  TextColumn get total => text()();
}

@UseMoor(tables: [Tickets])
class DatabaseMyTickets extends _$DatabaseMyTickets {
  DatabaseMyTickets()
      : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'my_ticket.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<MyTicket>> getAllMyTickets() => select(tickets).get();

  Future insertMyTicket(MyTicket myTicket) => into(tickets).insert(myTicket);

  Future deleteMyTicket(MyTicket myTicket) => delete(tickets).delete(myTicket);

  Future updateMyTicket(MyTicket myTicket) => update(tickets).replace(myTicket);
}