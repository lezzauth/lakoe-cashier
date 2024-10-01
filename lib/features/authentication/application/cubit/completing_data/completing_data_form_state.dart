import 'package:equatable/equatable.dart';

class CompletingDataFormState extends Equatable {
  final Map<String, dynamic> value;
  final bool isFormValid;

  const CompletingDataFormState({
    required this.value,
    required this.isFormValid,
  });

  @override
  List<Object?> get props => [value, isFormValid];
}
