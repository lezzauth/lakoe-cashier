import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop_repository/online_shop_repository.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class OrderStatusDescription extends StatelessWidget {
  const OrderStatusDescription({
    super.key,
    required this.order,
  });

  final OrderDetailModel order;

  @override
  Widget build(BuildContext context) {
    return switch (order.status) {
      "WAITING_FOR_PAYMENT" => RichText(
          text: TextSpan(
            text:
                "Pesanan akan dibatalkan bila pembayaran tidak dilakukan sampai ",
            style: GoogleFonts.inter(
              fontSize: TSizes.fontSizeBodyM,
              color: TColors.neutralDarkLight,
            ),
            children: [
              TextSpan(
                text: "${TFormatter.orderDate(
                  order.createdAt.add(Duration(days: 1)).toIso8601String(),
                )} WIB",
                style: GoogleFonts.inter(
                  fontSize: TSizes.fontSizeBodyM,
                  color: TColors.neutralDarkLight,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    ". Silakan tunggu sampai pembayaran terkonfirmasi sebelum mengirimkan barang.",
                style: GoogleFonts.inter(
                  fontSize: TSizes.fontSizeBodyM,
                  color: TColors.neutralDarkLight,
                ),
              ),
            ],
          ),
        ),
      "CONFIRMED" => RichText(
          text: TextSpan(
            text:
                "Segera proses pesanan yang telah masuk. Jangan membuat pembeli menunggu terlalu lama.",
            style: GoogleFonts.inter(
              fontSize: TSizes.fontSizeBodyM,
              color: TColors.neutralDarkLight,
            ),
          ),
        ),
      "READY" => RichText(
          text: TextSpan(
            text: "Pesanan telah di-pickup oleh Kurir dan siap untuk dikirim.",
            style: GoogleFonts.inter(
              fontSize: TSizes.fontSizeBodyM,
              color: TColors.neutralDarkLight,
            ),
          ),
        ),
      "ON_DELIVERY" => RichText(
          text: TextSpan(
            text:
                "Pesanan sudah dalam proses pengiriman. Silakan tunggu penerimaan barang oleh pembeli.",
            style: GoogleFonts.inter(
              fontSize: TSizes.fontSizeBodyM,
              color: TColors.neutralDarkLight,
            ),
          ),
        ),
      "COMPLETED" => RichText(
          text: TextSpan(
            text:
                "Produk telah diterima oleh pembeli dan pesanan ini diselesaikan.",
            style: GoogleFonts.inter(
              fontSize: TSizes.fontSizeBodyM,
              color: TColors.neutralDarkLight,
            ),
          ),
        ),
      _ => Container(),
    };
  }
}
