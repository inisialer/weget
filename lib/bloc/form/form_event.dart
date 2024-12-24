part of 'form_bloc.dart';

sealed class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object?> get props => [];
}

class Form1Updated extends FormEvent {
  final String? value1;
  final String value2;

  const Form1Updated(this.value1, this.value2);

  @override
  List<Object?> get props => [value1, value2];
}

class Form2Updated extends FormEvent {
  final String value3;
  final String value4;

  const Form2Updated(this.value3, this.value4);

  @override
  List<Object> get props => [value3, value4];
}
