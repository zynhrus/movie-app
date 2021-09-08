import 'package:flutter/material.dart';
import 'package:movie_app/cubit/favorite_movie_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/shared/theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movie_app/views/detail.dart';
import 'package:movie_app/widgets/movie_item.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    context.read<FavoriteMovieCubit>().getFavoriteMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Favorites List",
          style:
              primaryColorTextStyle.copyWith(fontSize: 25, fontWeight: bold),
        ),
        BlocBuilder<FavoriteMovieCubit, FavoriteMovieState>(
          builder: (context, state) {
            if (state is GetFavoriteMovieFailed) {
              return Center(
                child: Text("Failed to load favorite meals"),
              );
            } else if (state is GetFavoriteMovieSuccess) {
              var favoriteMovies = state.favoriteMovies;
              final database = context.read<FavoriteMovieCubit>().database;

              if (favoriteMovies.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: favoriteMovies.length,
                    padding: EdgeInsets.only(bottom: 85, top: 20),
                    itemBuilder: (context, index) {
                      var favoriteMovie = favoriteMovies[index];
                      var movie = Movie(
                        id: favoriteMovie.idMovie,
                        posterPath: favoriteMovie.poster,
                        title: favoriteMovie.title,
                        voteAverage: favoriteMovie.voteAverage,
                        overview: favoriteMovie.overview,
                        voteCount: favoriteMovie.voteCount,
                      );

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                id: favoriteMovie.idMovie.toString(),
                              ),
                            ),
                          ).then((value) {
                            context
                                .read<FavoriteMovieCubit>()
                                .getFavoriteMovies();
                          });
                        },
                        child: Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'Delete',
                              color: Colors.red,
                              icon: Icons.delete,
                              onTap: () {
                                database.deleteFavoriteMovie(favoriteMovie);
                                context.read<FavoriteMovieCubit>().getFavoriteMovies();
                              },
                            )
                          ],
                          child: MovieItem(
                            movie: movie,
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text(
                      "You haven't add any favorite movie",
                      textAlign: TextAlign.center,
                      style: blackTextStyle.copyWith(fontSize: 25),
                    ),
                  ),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }
}
