import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/cubit/movie_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/shared/theme.dart';
import 'package:movie_app/widgets/movie_item.dart';
import 'package:movie_app/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<MovieCubit>(context).getTrendingMovie();
        }
      }
    });
  }

  @override
  void initState() {
    setupScrollController(context);
    BlocProvider.of<MovieCubit>(context).getTrendingMovie();
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
        if (state is MovieLoading && state.isFirstFetch) {
          return loadingIndicator();
        }

        List<Movie> movies = [];
        bool isLoading = false;

        if (state is MovieLoading) {
          movies = state.oldMovies;
          isLoading = true;
        } else if (state is GetMovieSuccess) {
          movies = state.movies;
        }

        if (state is GetMovieFailed) {
          return Center(
            child: Text(
              "Sorry their is something error, please check our internet or restart the app",
              textAlign: TextAlign.center,
              style: primaryColorTextStyle.copyWith(fontSize: 25),
            ),
          );
        }

        return Expanded(
          child: ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(bottom: 110),
            itemBuilder: (context, index) {
              if (index < movies.length) {
                var movie = movies[index];
                return MovieItem(movie: movie);
              } else {
                Timer(Duration(milliseconds: 30), () {
                  scrollController
                      .jumpTo(scrollController.position.maxScrollExtent);
                });

                return loadingIndicator();
              }
            },
            itemCount: movies.length + (isLoading ? 1 : 0),
          ),
        );
      },
    );
  }

  Widget loadingIndicator() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}