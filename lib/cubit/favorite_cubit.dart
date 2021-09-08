import 'package:bloc/bloc.dart';

class FavoriteCubit extends Cubit<List<String>> {
  FavoriteCubit() : super([]);

  void toggleFavorite(String id) {
    if(!isFavorite(id)){
      state.add(id);
    } else {
      state.remove(id);
    }
    print("New state : $state");
    emit(List.from(state));
  }

  bool isFavorite(String id) {
    print(id);
    print(state);
    var index = state.indexOf(id);
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }
}
