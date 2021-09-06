import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/service/api_service.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final ApiService apiService;

  MovieCubit(this.apiService) : super(MovieInitial());

  void getTrendingMovie() async {
    try {
      emit(MovieLoading());
      var movies = await apiService.getTrendingMovieThisWeek();
      emit(GetMovieSuccess(movies));
    } catch (e) {
      print(e);
      emit(GetMovieFailed(e.toString()));
    }
  }

  void getSearchMovieResults(String movieName) async {
    try {
      emit(MovieLoading());
      var movies = await apiService.searchMovie(movieName);
      emit(GetMovieSuccess(movies));
    } catch (e) {
      print(e);
      emit(GetMovieFailed(e.toString()));
    }
  }

}
