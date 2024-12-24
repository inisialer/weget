part of 'instagram_bloc.dart';

sealed class InstagramState extends Equatable {
  const InstagramState();
  
  @override
  List<Object> get props => [];
}

final class InstagramInitial extends InstagramState {}
