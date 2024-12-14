import 'package:equatable/equatable.dart';
import 'package:lakoe_pos/features/taxes/data/models.dart';
import 'package:lakoe_pos/features/taxes/presentation/widgets/form/field/other_tax_field.dart';

class TaxFormState extends Equatable {
  final List<OtherTaxField> taxes;
  final Map<String, dynamic> value;
  final int taxCount;
  final bool isFormValid;
  final bool isFormDirty;

  const TaxFormState({
    required this.taxes,
    required this.value,
    required this.taxCount,
    this.isFormValid = false,
    this.isFormDirty = false,
  });

  @override
  List<Object?> get props => [taxes, value, taxCount, isFormValid];
}

class TaxFormSubmitted extends TaxFormState {
  final TaxFormSubmittedValue submittedValue;

  const TaxFormSubmitted({
    required super.isFormValid,
    required super.taxCount,
    required super.taxes,
    required super.value,
    required this.submittedValue,
  });

  @override
  List<Object?> get props => [...super.props, submittedValue];
}

class TaxFormSubmittedValue {
  final List<TaxField> newTaxes;
  final List<String> removedTaxIds;
  final List<TaxField> updatedTaxes;

  TaxFormSubmittedValue({
    required this.newTaxes,
    required this.removedTaxIds,
    required this.updatedTaxes,
  });
}
