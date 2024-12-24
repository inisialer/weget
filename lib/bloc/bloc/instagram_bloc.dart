import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'instagram_event.dart';
part 'instagram_state.dart';

class InstagramBloc extends Bloc<InstagramEvent, InstagramState> {
  InstagramBloc() : super(InstagramInitial()) {
    on<InstagramEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
