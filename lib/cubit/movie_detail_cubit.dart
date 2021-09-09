import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/model/movie_detail.dart';
import 'package:movie_app/service/api_service.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final ApiService apiService;

  MovieDetailCubit(this.apiService) : super(MovieDetailInitial());

  void getMovieDetail(String id) async {
    try {
      emit(MovieDetailLoading());
      var movies = await apiService.getMovieDetail(id);
      emit(GetMovieDetailSuccess(movies));
    } catch (e) {
      print(e);
      emit(GetMovieDetailFailed(e.toString()));
    }
  }
}
