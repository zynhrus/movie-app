// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) {
  return MovieDetail(
    adult: json['adult'] as bool,
    backdropPath: json['backdrop_path'] as String,
    budget: json['budget'] as int,
    genres: (json['genres'] as List<dynamic>)
        .map((e) => Genres.fromJson(e as Map<String, dynamic>))
        .toList(),
    homepage: json['homepage'] as String,
    id: json['id'] as int,
    imdbId: json['imdb_id'] as String,
    originalLanguage: json['original_language'] as String,
    originalTitle: json['original_title'] as String,
    overview: json['overview'] as String,
    popularity: (json['popularity'] as num).toDouble(),
    posterPath: json['poster_path'] as String,
    releaseDate: json['release_date'] as String,
    revenue: json['revenue'] as int,
    runtime: json['runtime'] as int,
    status: json['status'] as String,
    tagline: json['tagline'] as String,
    title: json['title'] as String,
    video: json['video'] as bool,
    voteAverage: (json['vote_average'] as num).toDouble(),
    voteCount: json['vote_count'] as int,
  );
}

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
