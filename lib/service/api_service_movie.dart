import 'package:dio/dio.dart';
import 'package:weget/constants.dart';

class ApiServiceMovie {
  final Dio _dio = Dio();

  Future<Response> getMovie() async {
    final response = await _dio.get('$baseApi/3/movie/now_playing',
        options: Options(headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYzVjMmZhNzZjNGEzMmM4ZmEwZjQyNmE2MzM0ZmU4OCIsInN1YiI6IjY0ZTAxYTRlMzcxMDk3MDBjNTFlYTcyNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ToZaJlqOxoJ3lSOpqwCwMplhImy6Lf_CsWWdwBbwU78'
        }));
    return response;
  }
}
