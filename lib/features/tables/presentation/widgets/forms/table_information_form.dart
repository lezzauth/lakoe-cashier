import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/device/device_uility.dart';

class TableInformationForm extends StatefulWidget {
  const TableInformationForm({super.key});

  @override
  State<TableInformationForm> createState() => _TableInformationFormState();
}

class _TableInformationFormState extends State<TableInformationForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  showCreateLocation() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: TDeviceUtils.getViewInsets(context),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextHeading2(
                    "Buat lokasi baru",
                    color: TColors.neutralDarkDarkest,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: FormBuilderTextField(
                    name: "name",
                    decoration: InputDecoration(hintText: "Contoh: Indoor"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: TextActionL("Simpan"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
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
                        name: "tableNumber",
                        decoration: const InputDecoration(
                          hintText: "Contoh: T-01",
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
                            const FormLabel("Satuan Dasar"),
                            Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: Wrap(
                                direction: Axis.horizontal,
                                spacing: 8,
                                children: [
                                  InputChip(
                                    label: TextBodyS("Indoor"),
                                    onPressed: () {},
                                  ),
                                  InputChip(
                                    label: TextBodyS("Outdoor"),
                                    onPressed: () {},
                                  ),
                                  InputChip(
                                    label: TextBodyS("Lantai 2"),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 36,
                              child: OutlinedButton.icon(
                                onPressed: showCreateLocation,
                                label: TextActionM(
                                  "Buat Baru",
                                  color: TColors.primary,
                                ),
                                style: ButtonStyle(
                                    padding: WidgetStatePropertyAll(
                                      EdgeInsets.symmetric(horizontal: 14.0),
                                    ),
                                    side: WidgetStatePropertyAll(BorderSide(
                                      width: 1,
                                      color: TColors.primary,
                                    ))),
                                icon: UiIcons(
                                  TIcons.add,
                                  height: 12,
                                  width: 12,
                                  color: TColors.primary,
                                ),
                              ),
                            )
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
