import 'package:json_annotation/json_annotation.dart';

part 'movie_detail.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetail {
   bool adult;
   String? backdropPath;
   List<Genres> genres;
   int id;
   String overview;
   String? posterPath;
   int? runtime;
   String title;
   double? voteAverage;
   int? voteCount;
   String? releaseDate;

  @JsonKey(ignore: true)
  late String trailedId;

  MovieDetail({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.runtime,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);
}

class Genres {
  late int id;
  late String name;

  Genres({
    this.id = 0,
    this.name = "",
  });

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
     Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
