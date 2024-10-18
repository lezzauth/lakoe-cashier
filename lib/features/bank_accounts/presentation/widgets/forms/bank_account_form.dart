import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/application/cubit/bank_list_cubit.dart';
import 'package:point_of_sales_cashier/common/widgets/form/bank_select/bank_select.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/popup_confirmation.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';
import 'package:public_repository/public_repository.dart';

class BankAccountForm extends StatefulWidget {
  const BankAccountForm({
    super.key,
    required this.onSubmitted,
    this.isLoading = false,
    this.initialValue = const <String, dynamic>{},
    this.onDeleted,
  });

  final Function(dynamic value, BankListModel? bank) onSubmitted;
  final Future Function()? onDeleted;
  final bool isLoading;
  final Map<String, dynamic> initialValue;

  @override
  State<BankAccountForm> createState() => _BankAccountFormState();
}

class _BankAccountFormState extends State<BankAccountForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isFormValid = false;

  Future<void> _onSubmit() async {
    if (!mounted) return;

    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) {
      SnackBar snackBar = SnackBar(
        content: Text(ErrorTextStrings.formInvalid()),
        showCloseIcon: true,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          snackBar,
        );
      return;
    }

    dynamic value = _formKey.currentState?.value;

    final bank = await context.read<BankListCubit>().findOne(value["name"]);

    widget.onSubmitted(value, bank);
  }

  void _showPopupConfirmation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      useSafeArea: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return PopupConfirmation(
          title: "Hapus rekening bank?",
          message: "Kamu yakin ingin menghapus rekening ini?",
          labelButtonPrimary: "Tidak",
          labelButtonSecondary: "Ya, Hapus",
          isDiscardActionLoading: widget.isLoading,
          primaryAction: () async {
            Navigator.pop(context);
          },
          secondaryAction: () async {
            if (widget.onDeleted != null) {
              await widget.onDeleted!();
            }
            if (!context.mounted) return;

            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: widget.initialValue,
      onChanged: () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          _isFormValid = _formKey.currentState?.isValid ?? false;
          setState(() {});
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FormLabel("Pilih Bank"),
                        FormBuilderField<String>(
                          name: "name",
                          builder: (field) {
                            return BankSelect(
                              onChanged: field.didChange,
                              hintText: "Pilih nama bank",
                              errorText: field.errorText ?? "",
                              value: field.value ?? "",
                            );
                          },
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: ErrorTextStrings.required(),
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FormLabel("Nomor Rekening"),
                        FormBuilderTextField(
                          name: "accountNumber",
                          decoration: const InputDecoration(
                            hintText: "Masukan nomor rekening",
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: ErrorTextStrings.required()),
                            FormBuilderValidators.numeric(
                                errorText: ErrorTextStrings.numeric())
                          ]),
                        ),
                      ],
                    ),
                  ),
                  if (widget.initialValue.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: TColors.neutralLightLight,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            width: 1,
                            color: TColors.neutralLightMedium,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextHeading4(
                              "Jadikan nomor rekening utama",
                              color: TColors.neutralDarkDarkest,
                            ),
                            SizedBox(
                              height: 28,
                              child: FormBuilderField<bool>(
                                name: "isPrimary",
                                initialValue:
                                    widget.initialValue["isPrimary"] ?? false,
                                builder: (FormFieldState<bool> field) {
                                  return Switch(
                                    value: field.value ?? false,
                                    onChanged: (value) {
                                      field.didChange(value);
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (widget.initialValue.isNotEmpty &&
                      widget.onDeleted != null)
                    TextButton(
                      onPressed: () => _showPopupConfirmation(context),
                      child: const TextActionL(
                        "Hapus Rekening Bank",
                        color: TColors.error,
                      ),
                    )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ElevatedButton(
              onPressed: _isFormValid ? _onSubmit : null,
              child: widget.isLoading
                  ? const SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                        color: TColors.neutralLightLightest,
                        strokeWidth: 2,
                      ),
                    )
                  : const TextActionL(
                      "Simpan",
                    ),
            ),
          )
        ],
      ),
    );
  }
}
