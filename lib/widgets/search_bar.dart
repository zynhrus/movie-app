import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movie_cubit.dart';
import 'package:movie_app/shared/extension.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _debouncer = Debouncer(milliseconds: 500);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    onSearchTextChanged(String text) async {
      if (text != ''){
        _debouncer.run(() => context.read<MovieCubit>().getSearchMovieResults(text));
      } else {
        _debouncer.run(() => context.read<MovieCubit>().getTrendingMovie(resetList: true));
      }
    }

    return Container(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            leading: Icon(Icons.search),
            title: TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'Search Movie', border: InputBorder.none),
              onChanged: onSearchTextChanged,
            ),
            trailing: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                controller.clear();
                onSearchTextChanged('');
              },
            ),
          ),
        ),
      ),
    );
  }
}
