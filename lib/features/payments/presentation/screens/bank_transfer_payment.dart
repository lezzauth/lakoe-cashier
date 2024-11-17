import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/separator/separator.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/payments/application/cubit/payment/payment_state.dart';
import 'package:lakoe_pos/features/payments/data/arguments/bank_transfer_payment_argument.dart';
import 'package:lakoe_pos/features/payments/presentation/widgets/bank_transfer/transfer_attachment.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:lakoe_pos/utils/helpers/helper.dart';

class BankTransferPaymentScreen extends StatefulWidget {
  const BankTransferPaymentScreen({super.key, required this.arguments});

  final BankTransferPaymentArgument arguments;

  @override
  State<BankTransferPaymentScreen> createState() =>
      _BankTransferPaymentScreenState();
}

class _BankTransferPaymentScreenState extends State<BankTransferPaymentScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    CustomToast.init(context);
  }

  Future<void> _onSubmitted() async {
    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) return;

    dynamic value = _formKey.currentState?.value;

    TransferAttachment photo = value["photo"] as TransferAttachment;

    Navigator.pop(
      context,
      PaymentBankTransfer(
        accountNumber: widget.arguments.account.accountNumber,
        paidAmount: widget.arguments.amount,
        photo: photo.file!,
      ),
    );
  }

  Future<void> _onCopy({required String text}) async {
    await THelper.copyToClipboard(text);

    if (!mounted) return;
    CustomToast.showWithContext(
      context,
      "Berhasil disalin",
      icon: TIcons.copy,
      duration: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments = widget.arguments;

    String formattedAmount = TFormatter.formatToRupiah(arguments.amount);
    List<String> splittedAmount = [
      formattedAmount.substring(0, formattedAmount.length - 3),
      formattedAmount.substring(formattedAmount.length - 3),
    ];

    return Scaffold(
      backgroundColor: TColors.neutralLightLight,
      appBar: CustomAppbar(
        title: "Tagih Pembayaran",
        leading: Transform.translate(
          offset: const Offset(-16, 0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const UiIcons(
              TIcons.close,
              size: 20,
              color: TColors.primary,
            ),
          ),
        ),
      ),
      body: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: () {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            _isFormValid = _formKey.currentState?.isValid ?? false;
            setState(() {});
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 36),
                      decoration: BoxDecoration(
                        color: TColors.neutralLightLightest,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 4),
                                      child: TextHeading4(
                                        arguments.account.name,
                                        color: TColors.neutralDarkDarkest,
                                      ),
                                    ),
                                    TextBodyM(
                                      "A/n ${arguments.account.accountName}",
                                      color: TColors.neutralDarkDark,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Separator(
                            color: TColors.neutralLightMedium,
                            height: 1,
                            dashWidth: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 12, 16, 12),
                                  margin: const EdgeInsets.only(bottom: 28),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: TColors.neutralLightLight,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextHeading2(
                                        arguments.account.accountNumber,
                                        color: TColors.neutralDarkDarkest,
                                      ),
                                      SizedBox(
                                        height: 32,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            _onCopy(
                                              text: arguments
                                                  .account.accountNumber,
                                            );
                                          },
                                          style: const ButtonStyle(
                                            padding: WidgetStatePropertyAll(
                                              EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 0,
                                              ),
                                            ),
                                          ),
                                          child: const TextActionL(
                                            "Salin",
                                            color: TColors.primary,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: const TextBodyM(
                                    "Jumlah transfer",
                                    color: TColors.neutralDarkDark,
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 12, 16, 12),
                                  margin: const EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: TColors.neutralLightLight,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            children: splittedAmount.map(
                                          (text) {
                                            // bool isLastThreeDigits =
                                            //     text == splittedAmount.last;
                                            return TextSpan(
                                              text: text,
                                              style: GoogleFonts.inter(
                                                  fontSize:
                                                      TSizes.fontSizeHeading2,
                                                  // color: isLastThreeDigits
                                                  //     ? TColors.error
                                                  //     : TColors
                                                  //         .neutralDarkDarkest,
                                                  color: TColors
                                                      .neutralDarkDarkest,
                                                  fontWeight: FontWeight.w900),
                                            );
                                          },
                                        ).toList()),
                                      ),
                                      SizedBox(
                                        height: 32,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            _onCopy(
                                              text: arguments.amount
                                                  .toInt()
                                                  .toString(),
                                            );
                                          },
                                          style: const ButtonStyle(
                                            padding: WidgetStatePropertyAll(
                                              EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 0,
                                              ),
                                            ),
                                          ),
                                          child: const TextActionL(
                                            "Salin",
                                            color: TColors.primary,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const TextBodyS(
                                  "Pastikan jumlahnya benar hingga 3 digit terakhir",
                                  color: TColors.neutralDarkLight,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: const TextHeading3(
                        "Bukti transfer",
                        color: TColors.neutralDarkDarkest,
                      ),
                    ),
                    FormBuilderField<TransferAttachment>(
                      name: "photo",
                      builder: (field) {
                        bool isValid = field.value?.file != null ||
                            field.value?.url != null;
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          setState(() {
                            _isFormValid = isValid;
                          });
                        });

                        return TransferAttachmentField(
                          value: field.value,
                          onChanged: field.didChange,
                          errorText: field.errorText ?? "",
                          onError: (errorText) {
                            _formKey.currentState?.fields["photo"]
                                ?.invalidate(errorText);
                          },
                        );
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: ErrorTextStrings.required(
                                name: "Bukti Transfer")),
                      ]),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: _isFormValid ? _onSubmitted : null,
                  child: const TextActionL(
                    "Selesaikan",
                    color: TColors.neutralLightLightest,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
