// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    id: json['id'] as int,
    originalLanguage: json['original_language'] as String?,
    originalTitle: json['original_title'] as String?,
    posterPath: json['poster_path'] as String?,
    title: json['title'] as String,
    voteAverage: (json['vote_average'] as num).toDouble(),
    overview: json['overview'] as String,
    releaseDate: json['release_date'] as String?,
    voteCount: json['vote_count'] as int,
    adult: json['adult'] as bool?,
    backdropPath: json['backdrop_path'] as String?,
    video: json['video'] as bool?,
    genreIds:
        (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
    popularity: (json['popularity'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'vote_count': instance.voteCount,
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'video': instance.video,
      'genre_ids': instance.genreIds,
      'popularity': instance.popularity,
    };
