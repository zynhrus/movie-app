import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Movie {
  int id;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  String title;
  double voteAverage;
  String overview;
  String? releaseDate;
  int voteCount;
  bool? adult;
  String? backdropPath;
  bool? video;
  List<int>? genreIds;
  double? popularity;

  Movie({
    required this.id,
    this.originalLanguage,
    this.originalTitle,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
    required this.overview,
    this.releaseDate,
    required this.voteCount,
    this.adult,
    this.backdropPath,
    this.video,
    this.genreIds,
    this.popularity,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
