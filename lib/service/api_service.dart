import 'package:dio/dio.dart';
import 'package:movie_app/model/movie.dart';

class ApiService {
  final Dio _dio = Dio();

  final _baseUrl = 'https://api.themoviedb.org/3';
  final key = "383df06997757c37af7e100718825bde";

  Future<List<Movie>> searchMovie(String movieName) async {
    var movies;

    try {
      Response response =
      await _dio.get(_baseUrl + '/search/movie?api_key=$key&page=1&query=$movieName');

      print(response.data['results']);
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
