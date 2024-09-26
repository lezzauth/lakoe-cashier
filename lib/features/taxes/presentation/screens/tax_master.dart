import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/popup_confirmation.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/taxes/application/cubit/tax_form.dart/tax_form_cubit.dart';
import 'package:point_of_sales_cashier/features/taxes/application/cubit/tax_form.dart/tax_form_state.dart';
import 'package:point_of_sales_cashier/features/taxes/application/cubit/tax_master/tax_master_cubit.dart';
import 'package:point_of_sales_cashier/features/taxes/application/cubit/tax_master/tax_master_state.dart';
import 'package:point_of_sales_cashier/features/taxes/data/models.dart';
import 'package:point_of_sales_cashier/features/taxes/presentation/widgets/form/tax_form.dart';
import 'package:collection/collection.dart';

class TaxMasterScreen extends StatelessWidget {
  const TaxMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaxFormCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) => switch (state) {
          AuthReady() => const TaxMaster(),
          _ => const Scaffold(body: Center(child: CircularProgressIndicator())),
        },
      ),
    );
  }
}

class TaxMaster extends StatefulWidget {
  const TaxMaster({super.key});

  @override
  State<TaxMaster> createState() => _TaxMasterState();
}

class _TaxMasterState extends State<TaxMaster> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _showPopupConfirmation() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      useSafeArea: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BlocBuilder<TaxMasterCubit, TaxMasterState>(
          builder: (context, state) {
            return PopupConfirmation(
              title: "Ada yang berubah...",
              message:
                  'Kamu telah melakukan perubahan pengaturan pajak.\nMau disimpan atau diabaikan?',
              labelButtonPrimary: "Simpan",
              labelButtonSecondary: "Abaikan",
              isSaveActionLoading: state is TaxMasterActionInProgress,
              discardAction: () {
                Navigator.pop(context);
                Navigator.of(context, rootNavigator: true).pop();
              },
              saveAction: () async {
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
    TaxMasterState states = context.read<TaxMasterCubit>().state;
    if (states is! TaxMasterLoadSuccess) return;

    TaxFormState taxFormCubit = context.read<TaxFormCubit>().state;

    dynamic value = _formKey.currentState?.value;

    List<TaxField> newTaxes = [];
    List<String> removedTaxIds = [];
    List<TaxField> updatedTaxes = [];

    for (var tax in taxFormCubit.taxes) {
      final name = _formKey.currentState?.fields['name_${tax.id}']?.value;
      final value = _formKey.currentState?.fields['value_${tax.id}']?.value;

      if (tax.id.startsWith("NEW_TAX")) {
        newTaxes.add(TaxField(id: tax.id, name: name, value: value));
        continue;
      }

      updatedTaxes.add(TaxField(id: tax.id, name: name, value: value));
    }

    List<String> updatedTaxIds = updatedTaxes.map((e) => e.id).toList();

    removedTaxIds = states.taxes
        .whereNot((e) => updatedTaxIds.contains(e.id) || e.name == "PB1")
        .map((e) => e.id)
        .toList();

    final pb1Tax = states.taxes.firstWhereOrNull((e) => e.name == "PB1");
    if (pb1Tax != null) {
      if (value["isPB1Active"] == true) {
        updatedTaxes.add(
            TaxField(id: pb1Tax.id, name: pb1Tax.name, value: value["value"]));
      } else {
        removedTaxIds.add(pb1Tax.id);
      }
    } else {
      if (value["isPB1Active"] == true) {
        newTaxes.add(TaxField(id: "pb1", name: "PB1", value: value["value"]));
      }
    }

    AuthReady authState = context.read<AuthCubit>().state as AuthReady;

    await context.read<TaxMasterCubit>().save(
          ownerId: authState.profile.id,
          newTaxes: newTaxes,
          updatedTaxes: updatedTaxes,
          removedIds: removedTaxIds,
        );
  }

  @override
  void initState() {
    super.initState();

    AuthReady authState = context.read<AuthCubit>().state as AuthReady;
    context.read<TaxMasterCubit>().findAll(ownerId: authState.profile.id);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop == true) return;
        _showPopupConfirmation();
      },
      child: Scaffold(
        appBar: CustomAppbar(
          title: "Pajak",
          handleBackButton: () => _showPopupConfirmation(),
        ),
        body: TaxForm(
          formKey: _formKey,
          onSubmitted: _onSubmitted,
        ),
      ),
    );
  }
}
