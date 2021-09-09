import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/model/ticket.dart';

part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  final DatabaseMyTickets database;

  TicketCubit(this.database) : super(TicketInitial());

  void getMyTickets() async {
    try {
      emit(TicketLoading());
      var tickets = await database.getAllMyTickets();
      emit(GetTicketSuccess(tickets));
    } catch (e) {
      print(e);
      emit(GetTicketFailed(e.toString()));
    }
  }
}
