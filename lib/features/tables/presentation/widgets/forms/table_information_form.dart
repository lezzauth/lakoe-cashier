import 'package:app_data_provider/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lakoe_pos/common/widgets/form/form_label.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/popup_confirmation.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/features/tables/common/widgets/preview_qr_table.dart';
import 'package:lakoe_pos/features/tables/presentation/widgets/forms/field/location_field.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:table_repository/table_repository.dart';

class TableInformationForm extends StatefulWidget {
  const TableInformationForm({
    super.key,
    required this.formKey,
    this.initialValue = const <String, dynamic>{},
    this.onSubmit,
    this.onDeleted,
    this.isLoading = false,
    this.table,
    required this.tableNumber,
  });

  final GlobalKey<FormBuilderState> formKey;
  final Map<String, dynamic> initialValue;
  final Future Function()? onSubmit;
  final Future Function()? onDeleted;
  final bool isLoading;
  final TableModel? table;
  final String tableNumber;

  @override
  State<TableInformationForm> createState() => _TableInformationFormState();
}

class _TableInformationFormState extends State<TableInformationForm> {
  final AppDataProvider _appDataProvider = AppDataProvider();
  late String tableNumber;

  @override
  void initState() {
    super.initState();
    tableNumber = widget.tableNumber;
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
          title: "Hapus meja?",
          message: "Kamu yakin ingin menghapus meja ini?",
          labelButtonPrimary: "Tidak",
          labelButtonSecondary: "Ya, Hapus",
          isSecondaryActionLoading: widget.isLoading,
          primaryAction: () {
            Navigator.pop(context);
          },
          secondaryAction: () async {
            await widget.onDeleted!();

            if (!context.mounted) return;
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveLayout(
          mobile: SizedBox.shrink(),
          tablet: Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16),
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: FutureBuilder<List<String?>>(
                    future: Future.wait([
                      _appDataProvider.colorBrand,
                      _appDataProvider.logoBrand,
                    ]),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        final String? colorBrandData = snapshot.data![0];
                        final String? logoBrandData = snapshot.data![1];

                        int argColorInt = 0xFFFD6E00;
                        if (colorBrandData != null) {
                          argColorInt = int.parse(
                              colorBrandData.replaceFirst("0x", ""),
                              radix: 16);
                        }

                        return PreviewQrTable(
                          widget.table?.id ?? DateTime.timestamp().toString(),
                          logo: logoBrandData ?? "",
                          colorBrand: argColorInt,
                          tableNumber: tableNumber,
                        );
                      } else {
                        return PreviewQrTable(
                          widget.table?.id ?? DateTime.timestamp().toString(),
                          logo: "",
                          colorBrand: 0xFFFD6E00,
                          tableNumber: tableNumber,
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Expanded(
                    child: SizedBox(
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/tables/edit/brand");
                        },
                        child: const TextActionL(
                          "Ubah Logo & Warna",
                          color: TColors.primary,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              // TabContainer(
              //   tabs: [
              //     TabItem(title: "Info Meja"),
              //     TabItem(title: "Logo & Warna")
              //   ],
              // ),
              // SizedBox(height: 20),
              FormBuilder(
                key: widget.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                initialValue: widget.initialValue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                                    hintText: "Contoh: T-00",
                                  ),
                                  validator: FormBuilderValidators.required(
                                    errorText: ErrorTextStrings.required(
                                        name: "Nomor Meja"),
                                  ),
                                  onChanged: (value) {
                                    if (value!.isNotEmpty) {
                                      setState(() {
                                        tableNumber = value;
                                      });
                                    } else {
                                      setState(() {
                                        tableNumber = widget.tableNumber;
                                      });
                                    }
                                  },
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
                                    hintText:
                                        "Mejanya muat untuk berapa orang?",
                                    suffixText: "Orang",
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  validator: FormBuilderValidators.required(
                                    errorText: ErrorTextStrings.required(
                                        name: "Kapasitas Meja"),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const FormLabel("Lokasi"),
                                            LocationField(
                                              initialValue: widget
                                                  .initialValue["outletRoomId"],
                                            ),
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
                    ResponsiveLayout(
                      mobile: SizedBox.shrink(),
                      tablet: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        child: SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed:
                                widget.isLoading ? null : widget.onSubmit,
                            child: widget.isLoading
                                ? SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 1.5,
                                    ),
                                  )
                                : TextActionL(
                                    "Simpan",
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
