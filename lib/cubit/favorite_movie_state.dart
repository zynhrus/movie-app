part of 'favorite_movie_cubit.dart';

abstract class FavoriteMovieState extends Equatable {
  const FavoriteMovieState();

  @override
  List<Object?> get props => [];
}

class FavoriteMovieInitial extends FavoriteMovieState {

}

class FavoriteMovieLoading extends FavoriteMovieState {}

class GetFavoriteMovieSuccess extends FavoriteMovieState {
  final List<FavoriteMovie> favoriteMovies;

  GetFavoriteMovieSuccess(this.favoriteMovies);

  @override
  List<Object> get props => [favoriteMovies];
}

class GetFavoriteMovieFailed extends FavoriteMovieState {
  final String error;

  GetFavoriteMovieFailed(this.error);

  @override
  List<Object> get props => [error];
}