import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/forms/field/location_field.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';

class TableInformationForm extends StatefulWidget {
  const TableInformationForm({
    super.key,
    required this.formKey,
    this.initialValue = const <String, dynamic>{},
  });

  final GlobalKey<FormBuilderState> formKey;
  final Map<String, dynamic> initialValue;

  @override
  State<TableInformationForm> createState() => _TableInformationFormState();
}

class _TableInformationFormState extends State<TableInformationForm> {
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
                          errorText: ErrorTextStrings.required(),
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
                          hintText: "Jumlah kapasitas meja",
                          suffixText: "Orang",
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: FormBuilderValidators.required(
                          errorText: ErrorTextStrings.required(),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
