import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/custom_checkbox.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class DeleteAccountReasonScreen extends StatefulWidget {
  const DeleteAccountReasonScreen({super.key});

  @override
  State<DeleteAccountReasonScreen> createState() =>
      _DeleteAccountReasonScreenState();
}

class _DeleteAccountReasonScreenState extends State<DeleteAccountReasonScreen> {
  bool isOtherSelected = false;
  final _formKey = GlobalKey<FormBuilderState>();
  final FocusNode _otherReasonFocusNode = FocusNode();

  List<_ItemReason> listItemReason = [
    _ItemReason(isSelected: false, label: "Tutup Usaha/Tidak Lagi Membutuhkan"),
    _ItemReason(isSelected: false, label: "Masalah Teknis atau Ketidakpuasan"),
    _ItemReason(isSelected: false, label: "Perubahan Kebutuhan Bisnis"),
    _ItemReason(isSelected: false, label: "Privasi dan Keamanan Data"),
    _ItemReason(isSelected: false, label: "Lainnya"),
  ];

  @override
  void dispose() {
    _otherReasonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const CustomAppbar(
          title: "Hapus Akun",
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Wrap(
                      runSpacing: 20,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextHeading3(
                              "Sebelum pergi, boleh tau alasannya?",
                              color: TColors.neutralDarkDark,
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(height: 4),
                            TextBodyM(
                              "Kamu boleh pilih lebih dari satu, ya",
                              color: TColors.neutralDarkDark,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...listItemReason.map(
                              (item) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomCheckbox(
                                      value: item.isSelected,
                                      onChanged: (bool value) {
                                        setState(() {
                                          item.isSelected = value;

                                          if (item.label == "Lainnya") {
                                            isOtherSelected = value;
                                            if (isOtherSelected) {
                                              FocusScope.of(context)
                                                  .requestFocus(
                                                      _otherReasonFocusNode);
                                            }
                                          }
                                        });
                                      },
                                    ),
                                    const SizedBox(width: 12),
                                    Flexible(
                                      child: TextHeading4(
                                        item.label,
                                        color: TColors.neutralDarkDark,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              margin: const EdgeInsets.only(bottom: 16.0),
                              child: FormBuilderTextField(
                                name: "other_reason",
                                focusNode: _otherReasonFocusNode,
                                decoration: InputDecoration(
                                  hintText: "Tuliskan alasanmu disini",
                                  fillColor: isOtherSelected == true
                                      ? TColors.neutralLightLightest
                                      : TColors.neutralLightLight,
                                ),
                                maxLines: 3,
                                onChanged: (value) {
                                  setState(() {
                                    if (value != null && value.isNotEmpty) {
                                      isOtherSelected = true;
                                      listItemReason.last.isSelected = true;
                                    } else {
                                      isOtherSelected = false;
                                      listItemReason.last.isSelected = false;
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: TColors.neutralLightMedium,
                width: 1.0,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/otp-input");
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: TColors.neutralLightLightest,
                  backgroundColor: TColors.error,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const TextActionL("Lanjut"),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: TColors.error,
                  side: const BorderSide(color: TColors.error),
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const TextActionL("Batal"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemReason {
  bool isSelected;
  final String label;

  _ItemReason({
    required this.isSelected,
    required this.label,
  });
}
