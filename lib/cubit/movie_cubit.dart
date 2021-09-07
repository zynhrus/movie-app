import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/service/api_service.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final ApiService apiService;

  MovieCubit(this.apiService) : super(MovieInitial());

  int page = 1;

  void getTrendingMovie() async {
    if (state is MovieLoading) return;

    final currentState = state;
    var oldMovies = <Movie>[];

    if (currentState is GetMovieSuccess) {
      oldMovies = currentState.movies;
    }

    try {
      emit(MovieLoading(oldMovies,isFirstFetch: page == 1));
      await apiService.getTrendingMovieThisWeek(page).then((newMovies) {
        page++;

        final movies = (state as MovieLoading).oldMovies;
        movies.addAll(newMovies);

        emit(GetMovieSuccess(movies));
      });
    } catch (e) {
      print(e);
      emit(GetMovieFailed(e.toString()));
    }
  }

  void getSearchMovieResults(String movieName) async {
    if (state is MovieLoading) return;

    final currentState = state;

    var oldMovies = <Movie>[];
    if (currentState is GetMovieSuccess) {
      oldMovies = currentState.movies;
    }

    try {
      emit(MovieLoading(oldMovies,isFirstFetch: page == 1));
      var movies = await apiService.searchMovie(movieName);
      emit(GetMovieSuccess(movies));
    } catch (e) {
      print(e);
      emit(GetMovieFailed(e.toString()));
    }
  }
}
