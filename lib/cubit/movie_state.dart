part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object?> get props => [];
}

class MovieInitial extends MovieState {

}
class MovieLoading extends MovieState {
  final List<Movie> oldMovies;
  final bool isFirstFetch;

  MovieLoading(this.oldMovies, {this.isFirstFetch=false});
}

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
