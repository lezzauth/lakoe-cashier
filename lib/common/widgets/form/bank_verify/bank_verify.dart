import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lakoe_pos/application/cubit/bank_verify_cubit.dart';
import 'package:lakoe_pos/application/cubit/bank_verify_state.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/form/bank_verify/bank_verify_confirmation.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/general_information.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/device/device_uility.dart';
import 'package:public_repository/public_repository.dart';

class BankVerify extends StatefulWidget {
  const BankVerify({
    super.key,
    required this.bankCode,
    required this.bankName,
    required this.accountNumber,
    this.accountName,
    required this.name,
  });

  final String bankCode;
  final String bankName;
  final String accountNumber;
  final String? accountName;
  final String name;

  @override
  State<BankVerify> createState() => _BankVerifyState();
}

class _BankVerifyState extends State<BankVerify> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BankVerifyCubit(),
      child: BankVerifyContent(
        accountNumber: widget.accountNumber,
        accountName: widget.accountName ?? "",
        bankCode: widget.bankCode,
        bankName: widget.bankName,
        name: widget.name,
      ),
    );
  }
}

class BankVerifyContent extends StatefulWidget {
  const BankVerifyContent({
    super.key,
    required this.bankCode,
    required this.bankName,
    required this.accountNumber,
    required this.accountName,
    required this.name,
  });

  final String bankCode;
  final String bankName;
  final String accountNumber;
  final String accountName;
  final String name;

  @override
  State<BankVerifyContent> createState() => _BankVerifyContentState();
}

class _BankVerifyContentState extends State<BankVerifyContent> {
  @override
  void initState() {
    super.initState();

    context.read<BankVerifyCubit>().verify(
          GetBankAccountDto(
            noRekening: widget.accountNumber,
            kodeBank: widget.bankCode,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BankVerifyCubit, BankVerifyState>(
      listener: (context, state) async {
        if (state is BankVerifyActionSuccess) {
          bool isSameName =
              state.account.data.accountName == widget.accountName;
          if (isSameName) {
            Navigator.pop(
              context,
              BankVerifyArgument(
                accountName: state.account.data.accountName,
                accountNumber: widget.accountNumber,
                bankName: widget.bankName,
                name: widget.name,
              ),
            );
          } else {
            final result = await showModalBottomSheet<BankVerifyArgument?>(
              context: context,
              isScrollControlled: true,
              barrierColor: Colors.transparent,
              builder: (context) {
                return CustomBottomsheet(
                  child: BankVerifyConfirmation(
                    accountName: state.account.data.accountName,
                    accountNumber: widget.accountNumber,
                    bankName: widget.bankName,
                    name: widget.name,
                  ),
                );
              },
            );

            if (!context.mounted) return;
            Navigator.pop(context, result);
          }
        }

        if (state is BankVerifyActionFailure) {
          if (state.status == "33") {
            final result = await showModalBottomSheet<BankVerifyArgument?>(
              context: context,
              isScrollControlled: true,
              isDismissible: false,
              enableDrag: false,
              barrierColor: Colors.transparent,
              builder: (context) {
                return PopScope(
                  canPop: false,
                  onPopInvokedWithResult: (didPop, result) async {},
                  child: CustomBottomsheet(
                      hasGrabber: false,
                      child: GeneralInformation(
                        imageSrc: TImages.generalIllustration,
                        title: "Rekening tidak ditemukan",
                        description:
                            "Yuk! Cek lagi nomor rekening yang kamu, pastikan sesuai dengan bank-nya, ya!",
                        onAction: () {
                          Navigator.pop(context);
                        },
                        actionTitle: "Cek Lagi",
                      )),
                );
              },
            );
            if (!context.mounted) return;
            Navigator.pop(context, result);
          } else {
            final TextEditingController controller = TextEditingController();

            final GlobalKey<FormBuilderState> formKey =
                GlobalKey<FormBuilderState>();

            final result = await showModalBottomSheet<BankVerifyArgument?>(
              context: context,
              isScrollControlled: true,
              barrierColor: Colors.transparent,
              builder: (context) {
                return CustomBottomsheet(
                  child: Padding(
                    padding: TDeviceUtils.getViewInsets(context),
                    child: FormBuilder(
                      key: formKey,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: TextHeading2(
                                "Nama pemilik rekening",
                                color: TColors.neutralDarkDarkest,
                              ),
                            ),
                            TextBodyM(
                              "Pastikan nama pemilik rekening sesuai dengan nama yang tercantum di buku tabungan atau informasi resmi bank.",
                              color: TColors.neutralDarkMedium,
                            ),
                            const SizedBox(height: 16),
                            FormBuilderTextField(
                              name: "accountName",
                              controller: controller,
                              decoration: const InputDecoration(
                                hintText: "Masukan nama pemilik rekening",
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  errorText:
                                      ErrorTextStrings.required(name: "Nama"),
                                ),
                                (value) {
                                  if (value != null &&
                                      !RegExp(r'^[a-zA-Z0-9\s]+$')
                                          .hasMatch(value)) {
                                    return "Tidak boleh mengandung karakter khusus";
                                  }
                                  return null;
                                },
                              ]),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState?.saveAndValidate() ??
                                      false) {
                                    Navigator.pop(
                                      context,
                                      BankVerifyArgument(
                                        bankName: widget.bankName,
                                        accountNumber: widget.accountNumber,
                                        accountName: controller.text,
                                        name: widget.name,
                                      ),
                                    );
                                  }
                                },
                                child: TextActionL("Konfirmasi"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );

            if (!context.mounted) return;

            Navigator.pop(context, result);
          }
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              top: 16,
              bottom: 8,
              right: 20,
            ),
            child: const TextHeading2(
              "Sedang verifikasi rekening...",
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              top: 8,
              right: 20,
              bottom: 20,
            ),
            child: LinearProgressIndicator(
              minHeight: 8,
              borderRadius: BorderRadius.circular(12),
              backgroundColor: TColors.neutralLightMedium,
            ),
          ),
        ],
      ),
    );
  }
}
