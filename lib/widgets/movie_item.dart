import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/shared/url_helper.dart';
import 'package:movie_app/shared/theme.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: FadeInImage.assetNetwork(
              width: 110,
              placeholder: 'assets/loading.gif',
              image: "$posterImageUrlMedium${movie.posterPath}",
              height: 165,
              imageErrorBuilder: (context, url, error) => Image.asset(
                'assets/no_image.png',
                height: 165,
                width: 110,
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Release on: ${movie.releaseDate.toString()}",
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Image.asset(
                      'assets/rating.png',
                      color: kYellowColor,
                      height: 22,
                    ),
                    SizedBox(width: 3),
                    RichText(
                      text: TextSpan(
                        text: movie.voteAverage.toString(),
                        style: yellowTextStyle.copyWith(
                          fontSize: 17,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' / ${movie.voteCount.toString()}',
                              style: greyTextStyle)
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  movie.overview,
                  style: blackTextStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
