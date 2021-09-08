import 'package:dio/dio.dart';
import 'package:movie_app/model/cast.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/movie_detail.dart';

class ApiService {
  final Dio _dio = Dio();

  final _baseUrl = 'https://api.themoviedb.org/3';
  final key = "383df06997757c37af7e100718825bde";

  Future<String> getYoutubeId(String id) async {
    var youtubeId;

    try {
      Response response =
      await _dio.get(_baseUrl + '/movie/$id/videos?api_key=$key');

      youtubeId = response.data['results'][0]['key'];

    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }

    return youtubeId;
  }

  Future<MovieDetail> getMovieDetail(String id) async {
    MovieDetail movieDetail;

    Response response =
    await _dio.get(_baseUrl + '/movie/$id?api_key=$key');

    movieDetail = MovieDetail.fromJson(response.data);

    movieDetail.trailedId = await getYoutubeId(id);

    return movieDetail;
  }

  Future<List<Cast>> getCast(String id) async {
    var casts;

    try {
      Response response =
      await _dio.get(_baseUrl + '/movie/$id/credits?api_key=$key');

      casts = (response.data['cast'] as List)
          .map((cast) => Cast.fromJson(cast))
          .toList();

    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }

    return casts;
  }

  Future<List<Movie>> searchMovie(String movieName) async {
    var movies;

    try {
      Response response =
      await _dio.get(_baseUrl + '/search/movie?api_key=$key&page=1&query=$movieName');

      movies = (response.data['results'] as List)
          .map((movie) => Movie.fromJson(movie))
          .toList();
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
    return movies;
  }

  Future<List<Movie>> getTrendingMovieThisWeek(int page) async {
    var movies;

    try {
      Response response =
          await _dio.get(_baseUrl + '/trending/movie/week?api_key=$key&page=$page');
      movies = (response.data['results'] as List)
          .map((movie) => Movie.fromJson(movie))
          .toList();
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
    return movies;
  }
}
