part of 'movie_detail_cubit.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object?> get props => [];
}

class MovieDetailInitial extends MovieDetailState {

}

class MovieDetailLoading extends MovieDetailState {}

class GetMovieDetailSuccess extends MovieDetailState {
  final MovieDetail movieDetail;

  GetMovieDetailSuccess(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class GetMovieDetailFailed extends MovieDetailState {
  final String error;

  GetMovieDetailFailed(this.error);

  @override
  List<Object> get props => [error];
}