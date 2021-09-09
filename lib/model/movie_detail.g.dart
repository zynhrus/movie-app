// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) {
  return MovieDetail(
    adult: json['adult'] as bool,
    backdropPath: json['backdrop_path'] as String?,
    genres: (json['genres'] as List<dynamic>)
        .map((e) => Genres.fromJson(e as Map<String, dynamic>))
        .toList(),
    id: json['id'] as int,
    overview: json['overview'] as String,
    posterPath: json['poster_path'] as String?,
    runtime: json['runtime'] as int?,
    title: json['title'] as String,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    voteCount: json['vote_count'] as int?,
    releaseDate: json['release_date'] as String?,
  );
}

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genres': instance.genres,
      'id': instance.id,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'runtime': instance.runtime,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'release_date': instance.releaseDate,
    };
