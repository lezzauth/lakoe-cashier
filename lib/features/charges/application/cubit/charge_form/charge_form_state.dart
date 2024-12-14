import 'package:equatable/equatable.dart';
import 'package:lakoe_pos/features/charges/data/models.dart';
import 'package:lakoe_pos/features/charges/presentation/widgets/form/field/other_charge_field.dart';

class ChargeFormState extends Equatable {
  final List<OtherChargeField> charges;
  final Map<String, dynamic> value;
  final int chargeCount;
  final bool isFormValid;
  final bool isFormDirty;

  const ChargeFormState({
    required this.charges,
    required this.value,
    required this.chargeCount,
    this.isFormValid = false,
    this.isFormDirty = false,
  });

  @override
  List<Object?> get props => [charges, value, chargeCount, isFormValid];
}

class ChargeFormSubmitted extends ChargeFormState {
  final ChargeFormSubmittedValue submittedValue;

  const ChargeFormSubmitted({
    required super.isFormValid,
    required super.chargeCount,
    required super.charges,
    required super.value,
    required this.submittedValue,
  });

  @override
  List<Object?> get props => [...super.props, submittedValue];
}

class ChargeFormSubmittedValue {
  final List<ChargeField> newChargees;
  final List<String> removedChargeIds;
  final List<ChargeField> updatedChargees;

  ChargeFormSubmittedValue({
    required this.newChargees,
    required this.removedChargeIds,
    required this.updatedChargees,
  });
}
