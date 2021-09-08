import 'package:flutter/material.dart';
import 'package:movie_app/cubit/cast_cubit.dart';
import 'package:movie_app/cubit/favorite_movie_cubit.dart';
import 'package:movie_app/cubit/movie_detail_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/model/favorite_movie.dart';
import 'package:movie_app/model/movie_detail.dart';
import 'package:movie_app/shared/url_helper.dart';
import 'package:movie_app/shared/theme.dart';
import 'package:movie_app/views/reserevation.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final String id;

  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool firstRun = true;
  var isMovieFavorite;
  var movieFavorites;
  var id;

  @override
  void initState() {
    context.read<MovieDetailCubit>().getMovieDetail(widget.id);
    context.read<FavoriteMovieCubit>().getFavoriteMovies();
    context.read<CastCubit>().getCasts(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final database = context.read<FavoriteMovieCubit>().database;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        builder: (context, movieState) {
          MovieDetail movieDetail;

          if (movieState is GetMovieDetailFailed) {
            return Center(
              child: Text(
                "Sorry their is something error we can't see this movie detail",
                textAlign: TextAlign.center,
                style: primaryColorTextStyle.copyWith(fontSize: 25),
              ),
            );
          } else if (movieState is GetMovieDetailSuccess) {
            movieDetail = movieState.movieDetail;

            var genreItem = movieDetail.genres.isNotEmpty
                ? movieInfoItem(movieDetail.genres[0].name)
                : SizedBox();

            var adultItem = movieDetail.adult
                ? Row(children: [
                    movieInfoItem("18+"),
                    SizedBox(width: 5),
                  ])
                : SizedBox();

            return BlocBuilder<FavoriteMovieCubit, FavoriteMovieState>(
              builder: (context, favoriteMovieState) {
                if (favoriteMovieState is GetFavoriteMovieSuccess) {
                  var favoriteMovie = favoriteMovieState.favoriteMovies;
                  var movieFavorites = favoriteMovie
                      .where((element) => element.idMovie == movieDetail.id);

                  if (firstRun) {
                    isMovieFavorite = movieFavorites.isNotEmpty;

                    firstRun = false;
                  }

                  if (isMovieFavorite) {
                    id = movieFavorites.single.id;
                  }

                  return Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                FadeInImage.assetNetwork(
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  placeholder: 'assets/loading.gif',
                                  image:
                                      "$baseImageUrl${movieDetail.backdropPath}",
                                  height: screenHeight / 2,
                                  imageErrorBuilder: (context, url, error) =>
                                      Center(
                                    child: Image.asset(
                                      'assets/no_image.png',
                                      height: screenHeight / 2,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 110,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black54,
                                        kTransparentColor,
                                      ],
                                      begin: const FractionalOffset(0.0, 0.0),
                                      end: const FractionalOffset(0.0, 1.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppBar(
                                      backgroundColor: kTransparentColor,
                                      title: Text(
                                        movieDetail.title,
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 20,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                      elevation: 0,
                                    ),
                                    movieDetail.trailedId == ""
                                        ? SizedBox()
                                        : Padding(
                                            padding: EdgeInsets.only(
                                                top: screenHeight / 9),
                                            child: GestureDetector(
                                              onTap: () async {
                                                final youtubeUrl =
                                                    "$youtubeBaseUrl${movieDetail.trailedId}";

                                                if (await canLaunch(
                                                    youtubeUrl)) {
                                                  await launch(youtubeUrl);
                                                }
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: kWhiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                child: Icon(
                                                  Icons.play_circle_fill_sharp,
                                                  color: kPrimaryColor,
                                                  size: 60,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ],
                                )
                              ],
                            ),
                            // Body
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            adultItem,
                                            movieInfoItem(
                                                "${movieDetail.runtime.toString()} min"),
                                            SizedBox(width: 5),
                                            genreItem,
                                            SizedBox(width: 5),
                                            movieInfoItem(
                                                "⭐️ ${movieDetail.voteAverage}"),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          final favoriteMovie = FavoriteMovie(
                                            id: id,
                                            idMovie: movieDetail.id,
                                            title: movieDetail.title,
                                            overview: movieDetail.overview,
                                            poster:
                                                movieDetail.posterPath ?? "",
                                            voteAverage:
                                                movieDetail.voteAverage ?? 0,
                                            voteCount:
                                                movieDetail.voteCount ?? 0,
                                            isFavorite: true,
                                          );

                                          if (isMovieFavorite) {
                                            database.deleteFavoriteMovie(
                                                favoriteMovie);
                                            setState(() {
                                              isMovieFavorite = false;
                                            });
                                          } else {
                                            database.insertFavoriteMovie(
                                                favoriteMovie);
                                            setState(() {
                                              isMovieFavorite = true;
                                            });
                                          }

                                          context
                                              .read<FavoriteMovieCubit>()
                                              .getFavoriteMovies();
                                        },
                                        child: Icon(
                                          isMovieFavorite
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          size: 35,
                                          color: kRedColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Synopsis",
                                    style: blackTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    movieDetail.overview,
                                    style: blackTextStyle,
                                  ),
                                  SizedBox(height: 10),
                                  BlocBuilder<CastCubit, CastState>(
                                    builder: (context, castState) {
                                      if (castState is GetCastFailed) {
                                        return Center(
                                          child: Text(
                                            "Failed to load casts",
                                            style: primaryColorTextStyle
                                                .copyWith(fontSize: 25),
                                          ),
                                        );
                                      } else if (castState is GetCastSuccess) {
                                        var casts = castState.casts;

                                        if (casts.isEmpty) {
                                          return SizedBox();
                                        }

                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Casts",
                                              style: blackTextStyle.copyWith(
                                                fontSize: 20,
                                                fontWeight: bold,
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 320,
                                              child: ListView.builder(
                                                  itemCount: casts.length,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      width: 120,
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            child: FadeInImage
                                                                .assetNetwork(
                                                              width: 90,
                                                              fit: BoxFit.cover,
                                                              placeholder:
                                                                  'assets/loading.gif',
                                                              image:
                                                                  "$baseImageUrl${casts[index].profilePath}",
                                                              height: 120,
                                                              imageErrorBuilder:
                                                                  (context, url,
                                                                          error) =>
                                                                      Center(
                                                                child:
                                                                    Image.asset(
                                                                  'assets/no_image.png',
                                                                  height: 120,
                                                                  width: 90,
                                                                ),
                                                              ),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        defaultBorderRadius),
                                                          ),
                                                          Text(
                                                            casts[index].name,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style:
                                                                blackTextStyle,
                                                          ),
                                                          Text(
                                                            casts[index]
                                                                .character,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style:
                                                                greyTextStyle,
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          ],
                                        );
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReservationPage(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 30),
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                "Reservation",
                                style: whiteTextStyle.copyWith(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Container movieInfoItem(String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: kBlackColor,
          borderRadius: BorderRadius.circular(defaultBorderRadius)),
      child: Text(
        value,
        style: whiteTextStyle.copyWith(fontSize: 13),
      ),
    );
  }
}
