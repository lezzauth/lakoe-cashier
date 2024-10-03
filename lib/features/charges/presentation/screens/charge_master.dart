import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/popup_confirmation.dart';
import 'package:point_of_sales_cashier/features/charges/application/cubit/charge_form/charge_form_cubit.dart';
import 'package:point_of_sales_cashier/features/charges/application/cubit/charge_form/charge_form_state.dart';
import 'package:point_of_sales_cashier/features/charges/application/cubit/charge_master/charge_master_cubit.dart';
import 'package:point_of_sales_cashier/features/charges/application/cubit/charge_master/charge_master_state.dart';
import 'package:point_of_sales_cashier/features/charges/data/models.dart';
import 'package:point_of_sales_cashier/features/charges/presentation/widgets/form/charge_form.dart';
import 'package:collection/collection.dart';

class ChargeMasterScreen extends StatelessWidget {
  const ChargeMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChargeFormCubit(),
      child: const ChargeMaster(),
    );
  }
}

class ChargeMaster extends StatefulWidget {
  const ChargeMaster({super.key});

  @override
  State<ChargeMaster> createState() => _ChargeMasterState();
}

class _ChargeMasterState extends State<ChargeMaster> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _showPopupConfirmation() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      useSafeArea: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BlocBuilder<ChargeMasterCubit, ChargeMasterState>(
          builder: (context, state) {
            return PopupConfirmation(
              title: "Ada yang berubah...",
              message:
                  'Kamu telah melakukan perubahan pengaturan biaya lainnya.\nMau disimpan atau diabaikan?',
              labelButtonPrimary: "Simpan",
              labelButtonSecondary: "Abaikan",
              isSaveActionLoading: state is ChargeMasterActionInProgress,
              primaryAction: () {
                Navigator.pop(context);
                Navigator.of(context, rootNavigator: true).pop();
              },
              secondaryAction: () async {
                await _onSubmitted();

                if (!context.mounted) return;
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  Future<void> _onSubmitted() async {
    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) return;
    ChargeMasterState states = context.read<ChargeMasterCubit>().state;
    if (states is! ChargeMasterLoadSuccess) return;

    ChargeFormState chargeFormCubit = context.read<ChargeFormCubit>().state;

    dynamic value = _formKey.currentState?.value;

    List<ChargeField> newCharges = [];
    List<String> removedChargeIds = [];
    List<ChargeField> updatedCharges = [];

    for (var charge in chargeFormCubit.charges) {
      final name = _formKey.currentState?.fields['name_${charge.id}']?.value;
      final value = _formKey.currentState?.fields['value_${charge.id}']?.value;
      final unit = _formKey.currentState?.fields['unit_${charge.id}']?.value;

      if (charge.id.startsWith("NEW_CHARGE")) {
        newCharges.add(
            ChargeField(id: charge.id, name: name, value: value, unit: unit));
        continue;
      }

      updatedCharges.add(
          ChargeField(id: charge.id, name: name, value: value, unit: unit));
    }

    List<String> updatedChargeIds = updatedCharges.map((e) => e.id).toList();

    removedChargeIds = states.charges
        .whereNot((e) =>
            updatedChargeIds.contains(e.id) || e.name == "Service Charge")
        .map((e) => e.id)
        .toList();

    final serviceCharge =
        states.charges.firstWhereOrNull((e) => e.name == "Service Charge");
    if (serviceCharge != null) {
      if (value["isServiceChargeActive"] == true) {
        updatedCharges.add(
          ChargeField(
            id: serviceCharge.id,
            name: serviceCharge.name,
            value: value["value"],
            unit: "percentage",
          ),
        );
      } else {
        removedChargeIds.add(serviceCharge.id);
      }
    } else {
      if (value["isServiceChargeActive"] == true) {
        newCharges.add(ChargeField(
          id: "serviceCharge",
          name: "Service Charge",
          value: value["value"],
          unit: "percentage",
        ));
      }
    }

    await context.read<ChargeMasterCubit>().save(
          newCharges: newCharges,
          updatedCharges: updatedCharges,
          removedIds: removedChargeIds,
        );
  }

  @override
  void initState() {
    super.initState();

    context.read<ChargeMasterCubit>().findAll();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChargeFormCubit, ChargeFormState>(
      builder: (context, state) {
        return PopScope(
          canPop: !state.isFormDirty,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop == true) return;
            _showPopupConfirmation();
          },
          child: Scaffold(
            appBar: CustomAppbar(
              title: "Biaya Lainnya",
              handleBackButton:
                  !state.isFormDirty ? null : () => _showPopupConfirmation(),
            ),
            body: ChargeForm(
              formKey: _formKey,
              onSubmitted: _onSubmitted,
            ),
          ),
        );
      },
    );
  }
}
