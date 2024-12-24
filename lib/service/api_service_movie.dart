import 'package:dio/dio.dart';
import 'package:weget/constants.dart';
import 'package:http/http.dart' as http;
import 'package:weget/model/response_movie.dart';

class ApiServiceMovie {
  final Dio _dio = Dio();

  Future<http.Response> getMovie() async {
    final response =
        await http.get(Uri.parse('$baseApi/3/movie/now_playing'), headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ 9.eyJhdWQiOiJiYzVjMmZhNzZjNGEzMmM4ZmEwZjQyNmE2MzM0ZmU4OCIsInN1YiI6IjY0ZTAxYTRlMzcxMDk3MDBjNTFlYTcyNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ToZaJlqOxoJ3lSOpqwCwMplhImy6Lf_CsWWdwBbwU78'
    });
    return response;
  }

  Future<ResponseMovie> getMovieDio() async {
    final response = await _dio.get(
      '$baseApi/3/movie/now_playing',
      options: Options(headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ 9.eyJhdWQiOiJiYzVjMmZhNzZjNGEzMmM4ZmEwZjQyNmE2MzM0ZmU4OCIsInN1YiI6IjY0ZTAxYTRlMzcxMDk3MDBjNTFlYTcyNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ToZaJlqOxoJ3lSOpqwCwMplhImy6Lf_CsWWdwBbwU78'
      }),
    );
    return ResponseMovie.fromJson(response.data);
  }
}
