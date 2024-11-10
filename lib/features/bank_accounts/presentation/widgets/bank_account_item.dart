import 'package:flutter/material.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_caption_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class BankAccountItem extends StatelessWidget {
  const BankAccountItem({super.key, required this.bankAccount, this.onTap});

  final OwnerBankModel bankAccount;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: TColors.neutralLightMedium,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: TextHeading4(
                            bankAccount.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (bankAccount.isPrimary)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            margin: const EdgeInsets.only(
                              left: 12,
                            ),
                            decoration: BoxDecoration(
                              color: TColors.successLight,
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                            child: const TextCaptionM(
                              "UTAMA",
                              color: TColors.successDark,
                            ),
                          )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBodyS(
                          "——",
                          color: TColors.neutralLightDark,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        TextBodyS(
                          bankAccount.accountNumber,
                          color: TColors.neutralDarkLight,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        TextBodyS(
                          bankAccount.accountName.toUpperCase(),
                          color: TColors.neutralDarkLight,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              const TextActionM(
                "Ubah",
                color: TColors.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
