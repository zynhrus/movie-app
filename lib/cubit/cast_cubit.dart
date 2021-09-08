import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/model/cast.dart';
import 'package:movie_app/service/api_service.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  ApiService apiService;

  CastCubit(this.apiService) : super(CastInitial());

  void getCasts(String id) async {
    try {
      emit(CastLoading());
      var casts = await apiService.getCast(id);
      emit(GetCastSuccess(casts));
    } catch (e) {
      print(e);
      emit(GetCastFailed(e.toString()));
    }
  }
}
