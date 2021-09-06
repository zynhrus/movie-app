import 'package:flutter/material.dart';
import 'package:movie_app/cubit/movie_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/shared/base_image.dart';
import 'package:movie_app/shared/theme.dart';
import 'package:movie_app/widgets/movie_item.dart';
import 'package:movie_app/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<MovieCubit>().getTrendingMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(),
        bodyList(),
      ],
    );
  }

  Widget bodyList() {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is GetMovieSuccess) {
          var movies = state.movies;
          return Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              padding: EdgeInsets.only(bottom: 85),
              itemBuilder: (context, index) {
                var movie = movies[index];
                return MovieItem(movie: movie);
              },
            ),
          );
        } else if (state is GetMovieFailed) {
          return Center(
            child: Text(
              "Sorry their is something error, please check our internet or restart the app",
              textAlign: TextAlign.center,
              style: primaryColorTextStyle.copyWith(fontSize: 25),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}