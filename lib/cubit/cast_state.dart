part of 'cast_cubit.dart';

abstract class CastState extends Equatable {
  const CastState();

  @override
  List<Object?> get props => [];
}

class CastInitial extends CastState {}

class CastLoading extends CastState {}

class GetCastSuccess extends CastState {
  final List<Cast> casts;

  GetCastSuccess(this.casts);

  @override
  List<Object> get props => [casts];
}

class GetCastFailed extends CastState {
  final String error;

  GetCastFailed(this.error);

  @override
  List<Object> get props => [error];
}
