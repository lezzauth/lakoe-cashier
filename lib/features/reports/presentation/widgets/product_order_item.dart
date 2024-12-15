import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:product_repository/product_repository.dart';

class ProductOrderItem extends StatelessWidget {
  const ProductOrderItem({
    super.key,
    required this.order,
    this.onTap,
  });

  final ProductOrderModel order;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    String tag = order.paymentMethod ?? "NONE";

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: TColors.neutralLightMedium,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 14,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: TSizes.fontSizeHeading4,
                          color: TColors.neutralDarkDarkest,
                          fontWeight: FontWeight.w600,
                        ),
                        text: order.customerName == "GUEST"
                            ? "Tamu"
                            : order.customerName,
                        children: [
                          TextSpan(
                            style: GoogleFonts.inter(
                              fontSize: TSizes.fontSizeBodyS,
                              color: TColors.neutralDarkLight,
                              fontWeight: FontWeight.w400,
                            ),
                            text: " - (${order.itemTotal} Item)",
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextBodyS(
                    TFormatter.dateTime(order.createdAt),
                    color: TColors.neutralDarkLight,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: TagPaymentMethod(tag: tag),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Total: ",
                      style: GoogleFonts.inter(
                        fontSize: TSizes.fontSizeBodyS,
                        color: TColors.neutralDarkLight,
                      ),
                      children: [
                        TextSpan(
                          text: TFormatter.formatToRupiah(
                            double.parse(order.price),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: TSizes.fontSizeBodyM,
                            fontWeight: FontWeight.w800,
                            color: TColors.neutralDarkDarkest,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TagPaymentMethod extends StatelessWidget {
  const TagPaymentMethod({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context) {
    String getTagLabel() {
      switch (tag) {
        case "CASH":
          return "Cash";
        case "QR_CODE":
          return "QRIS";
        case "DEBIT":
          return "Debit/Credit";
        case "BANK_TRANSFER":
          return "Bank Transfer";
        default:
          return "Belum Dibayar";
      }
    }

    Color getTagBackgroundColor() {
      switch (tag) {
        case "CASH":
          return TColors.highlightLightest;
        case "QR_CODE":
          return TColors.infoLight;
        case "DEBIT":
          return TColors.warningLight;
        case "BANK_TRANSFER":
          return TColors.successLight;
        default:
          return TColors.neutralLightMedium;
      }
    }

    Color getTagTextColor() {
      switch (tag) {
        case "CASH":
          return TColors.highlightDark;
        case "QR_CODE":
          return TColors.info;
        case "DEBIT":
          return TColors.warning;
        case "BANK_TRANSFER":
          return TColors.success;
        default:
          return TColors.neutralDarkDark;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: getTagBackgroundColor(),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextHeading5(
        getTagLabel(),
        color: getTagTextColor(),
      ),
    );
  }
}
