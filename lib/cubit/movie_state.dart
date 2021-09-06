part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object?> get props => [];
}

class MovieInitial extends MovieState {

}
class MovieLoading extends MovieState {}

class GetMovieSuccess extends MovieState {
  final List<Movie> movies;

  GetMovieSuccess(this.movies);

  @override
  List<Object> get props => [movies];
}

class GetMovieFailed extends MovieState {
  final String error;

  GetMovieFailed(this.error);

  @override
  List<Object> get props => [error];
}
