part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}

class GetMovieLoading extends MovieState {}

class GetMovieSuccess extends MovieState {
  final ResponseMovie data;
  const GetMovieSuccess(this.data);
}

class GetMovieError extends MovieState {
  final String error;
  const GetMovieError(this.error);
}
