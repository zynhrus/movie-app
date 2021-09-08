import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/model/favorite_movie.dart';

part 'favorite_movie_state.dart';

class FavoriteMovieCubit extends Cubit<FavoriteMovieState> {
  final Database database;

  FavoriteMovieCubit(this.database) : super(FavoriteMovieInitial());

  void getFavoriteMovies() async {
    try {
      emit(FavoriteMovieLoading());
      var meals = await database.getAllFavoriteMovies();
      emit(GetFavoriteMovieSuccess(meals));
    } catch (e) {
      print(e);
      emit(GetFavoriteMovieFailed(e.toString()));
    }
  }
}
