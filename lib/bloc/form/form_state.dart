part of 'form_bloc.dart';

class FormUpdateState extends Equatable {
  final String? value1;
  final String value2;
  final String value3;
  final String value4;

  const FormUpdateState({
    this.value1,
    this.value2 = '',
    this.value3 = '',
    this.value4 = '',
  });

  FormUpdateState copyWith({
    String? value1,
    String? value2,
    String? value3,
    String? value4,
  }) {
    return FormUpdateState(
      value1: value1,
      value2: value2 ?? this.value2,
      value3: value3 ?? this.value3,
      value4: value4 ?? this.value4,
    );
  }

  @override
  List<Object?> get props => [value1, value2, value3, value4];
}

final class FormInitial extends FormUpdateState {}
