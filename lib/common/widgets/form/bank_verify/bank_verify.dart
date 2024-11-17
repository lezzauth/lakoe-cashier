import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/application/cubit/bank_verify_cubit.dart';
import 'package:lakoe_pos/application/cubit/bank_verify_state.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/form/bank_verify/bank_verify_confirmation.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/general_information.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:public_repository/public_repository.dart';

class BankVerify extends StatefulWidget {
  const BankVerify({
    super.key,
    required this.bankCode,
    required this.bankName,
    required this.accountNumber,
    required this.name,
  });

  final String bankCode;
  final String bankName;
  final String accountNumber;
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
    required this.name,
  });

  final String bankCode;
  final String bankName;
  final String accountNumber;
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
            bankCode: widget.bankCode,
            accountNumber: widget.accountNumber,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BankVerifyCubit, BankVerifyState>(
      listener: (context, state) async {
        if (state is BankVerifyActionSuccess) {
          final result = await showModalBottomSheet<BankVerifyArgument?>(
            context: context,
            isScrollControlled: true,
            barrierColor: Colors.transparent,
            builder: (context) {
              return CustomBottomsheet(
                child: BankVerifyConfirmation(
                  accountName: state.account.accountName,
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

        if (state is BankVerifyActionFailure) {
          final result = await showModalBottomSheet<BankVerifyArgument?>(
            context: context,
            isScrollControlled: true,
            barrierColor: Colors.transparent,
            builder: (context) {
              return CustomBottomsheet(
                  child: GeneralInformation(
                imageSrc: TImages.generalIllustration,
                title: "Nomor rekening tidak ditemukan",
                description:
                    "Yuk! Cek lagi nomor rekening yang kamu masukkan, pastikan sesuai denga bank-nya, ya!",
                onRequest: () {
                  Navigator.pop(context);
                },
                actionTitle: "Cek Lagi",
              ));
            },
          );

          if (!context.mounted) return;
          Navigator.pop(context, result);
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
