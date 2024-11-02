import 'package:equatable/equatable.dart';

class ProductFormState extends Equatable {
  final Map<String, dynamic> value;
  final bool isFormValid;
  final bool isFormDirty;

  const ProductFormState({
    required this.value,
    this.isFormValid = false,
    this.isFormDirty = false,
  });

  @override
  List<Object?> get props => [value, isFormValid];
}
