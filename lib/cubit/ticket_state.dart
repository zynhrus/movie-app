part of 'ticket_cubit.dart';

abstract class TicketState extends Equatable {
  const TicketState();

  @override
  List<Object?> get props => [];
}

class TicketInitial extends TicketState {}

class TicketLoading extends TicketState {}

class GetTicketSuccess extends TicketState {
  final List<MyTicket> tickets;

  GetTicketSuccess(this.tickets);

  @override
  List<Object> get props => [tickets];
}

class GetTicketFailed extends TicketState {
  final String error;

  GetTicketFailed(this.error);

  @override
  List<Object> get props => [error];
}
