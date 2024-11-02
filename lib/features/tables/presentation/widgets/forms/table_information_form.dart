import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/popup_confirmation.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/forms/field/location_field.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';

class TableInformationForm extends StatefulWidget {
  const TableInformationForm({
    super.key,
    required this.formKey,
    this.initialValue = const <String, dynamic>{},
    this.onDeleted,
    this.isLoading = false,
  });

  final GlobalKey<FormBuilderState> formKey;
  final Map<String, dynamic> initialValue;
  final Future Function()? onDeleted;
  final bool isLoading;

  @override
  State<TableInformationForm> createState() => _TableInformationFormState();
}

class _TableInformationFormState extends State<TableInformationForm> {
  void _showPopupConfirmation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      useSafeArea: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return PopupConfirmation(
          title: "Hapus meja?",
          message: "Kamu yakin ingin menghapus meja ini?",
          labelButtonPrimary: "Tidak",
          labelButtonSecondary: "Ya, Hapus",
          isSecondaryActionLoading: widget.isLoading,
          primaryAction: () async {
            if (widget.onDeleted != null) {
              await widget.onDeleted!();
            }

            if (!context.mounted) return;
            Navigator.pop(context);
          },
          secondaryAction: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: widget.initialValue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormLabel("No. Meja"),
                      FormBuilderTextField(
                        name: "no",
                        decoration: const InputDecoration(
                          hintText: "Contoh: T-01",
                        ),
                        validator: FormBuilderValidators.required(
                          errorText:
                              ErrorTextStrings.required(name: "Nomor Meja"),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormLabel("Kapasitas"),
                      FormBuilderTextField(
                        name: "capacity",
                        decoration: const InputDecoration(
                          hintText: "Mejanya untuk berapa orang?",
                          suffixText: "Orang",
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: FormBuilderValidators.required(
                          errorText:
                              ErrorTextStrings.required(name: "Kapasitas Meja"),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const FormLabel("Lokasi"),
                                  LocationField(
                                      initialValue:
                                          widget.initialValue["outletRoomId"]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                if (widget.initialValue.isNotEmpty)
                  TextButton(
                    onPressed: () => _showPopupConfirmation(context),
                    child: const TextActionL(
                      "Hapus Meja",
                      color: TColors.error,
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
