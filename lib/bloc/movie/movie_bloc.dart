import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weget/model/response_movie.dart';
import 'package:weget/service/api_service_movie.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ApiServiceMovie _apiServiceMovie = ApiServiceMovie();
  MovieBloc() : super(MovieInitial()) {
    on<GetMovieEvent>((event, emit) async {
      emit(GetMovieLoading());
      try {
        final response = await _apiServiceMovie.getMovie();
        emit(
            GetMovieSuccess(ResponseMovie.fromJson(jsonDecode(response.body))));
      } on DioException catch (e) {
        emit(GetMovieError(e.response?.data));
      } catch (e) {
        emit(GetMovieError(e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
