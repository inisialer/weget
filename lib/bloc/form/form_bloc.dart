import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormUpdateState> {
  FormBloc() : super(const FormUpdateState()) {
    on<Form1Updated>((event, emit) {
      emit(state.copyWith(
        value1: event.value1,
        value2: event.value2,
      ));
    });

    on<Form2Updated>((event, emit) {
      emit(state.copyWith(
        value3: event.value3,
        value4: event.value4,
      ));
    });
  }
}
