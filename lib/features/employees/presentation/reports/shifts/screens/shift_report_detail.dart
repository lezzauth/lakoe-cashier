import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/separator/separator.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class ShiftReportDetailScreen extends StatelessWidget {
  final ShiftDetail shift = ShiftDetail(
    cashierName: "Dwi Prasetyo",
    startTime: "2025-01-12T09:00:00.000Z",
    endTime: "2025-01-12T20:00:00.000Z",
    totalOrders: 28,
    financialSummary: FinancialSummary(
      startingCash: 500000,
      totalTransactions: 850000,
      transactionBreakdown: {
        "CASH": 200000,
        "BANK_TRANSFER": 50000,
        "QR_CODE": 150000,
        "QR_CODE_EDC": 370000,
        "DEBIT": 80000,
        "UNPAID": 0,
      },
      expectedCash: 700000,
      finalCash: 650000,
      untrackedExpense: 50000,
      cashDifference: 0,
    ),
  );

  final Map<String, String> transactionLabels = {
    "CASH": "Cash (Tunai)",
    "BANK_TRANSFER": "Transfer Bank",
    "QR_CODE": "QRIS Statis",
    "QR_CODE_EDC": "QRIS EDC",
    "DEBIT": "Debit/Credit EDC",
    "UNPAID": "Terhutang",
  };

  ShiftReportDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.neutralLightLight,
      appBar: CustomAppbar(
          title: TFormatter.dateTime(shift.startTime, withTime: false)),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardGeneralInfo(),
            SizedBox(height: 12),
            _buildOrderListButton(),
            SizedBox(height: 12),
            _buildCardFinancialSummary(),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildCardGeneralInfo() => _buildCard(
        "Informasi Umum",
        [
          _buildRow("Nama Kasir", shift.cashierName),
          _buildRow("Waktu Buka", TFormatter.dateTime(shift.startTime)),
          _buildRow("Waktu Tutup", TFormatter.dateTime(shift.endTime)),
          _buildSeparator(),
          _buildRow("Total Pesanan", "${shift.totalOrders} Pesanan"),
        ],
      );

  Widget _buildOrderListButton() => GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: TColors.neutralLightLightest,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextHeading3("Lihat Daftar Pesanan"),
              UiIcons(TIcons.arrowRight,
                  size: 16, color: TColors.neutralDarkLight),
            ],
          ),
        ),
      );

  Widget _buildCardFinancialSummary() => _buildCard(
        "Ringkasan Keuangan",
        [
          _buildRow(
            "Saldo Awal (Tunai)",
            TFormatter.formatToRupiah(shift.financialSummary.startingCash),
          ),
          _buildSeparator(),
          _buildRow(
            "Total Transaksi",
            TFormatter.formatToRupiah(shift.financialSummary.totalTransactions),
          ),
          ...shift.financialSummary.transactionBreakdown.entries
              .map(
                (e) => _buildRow(
                  transactionLabels[e.key] ?? e.key,
                  TFormatter.formatToRupiah(e.value),
                  indent: 16,
                  color: TColors.neutralDarkLight,
                ),
              )
              .toList(),
          _buildSeparator(),
          _buildRow(
            "Saldo Tunai Seharusnya",
            TFormatter.formatToRupiah(shift.financialSummary.expectedCash),
          ),
          _buildSeparator(),
          _buildRow(
            "Saldo Akhir (Tunai)",
            TFormatter.formatToRupiah(shift.financialSummary.finalCash),
          ),
          _buildRow(
            "Biaya Tak Terduga",
            TFormatter.formatToRupiah(shift.financialSummary.untrackedExpense),
            color: TColors.highlightDark,
            isBold: true,
            onTap: () {},
          ),
          _buildSeparator(),
          _buildRow(
            "Selisih Uang (Tunai)",
            TFormatter.formatToRupiah(shift.financialSummary.cashDifference),
          ),
        ],
      );

  Widget _buildCard(String title, List<Widget> children) => Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: TColors.neutralLightLightest,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [TextHeading3(title), SizedBox(height: 12), ...children],
        ),
      );

  Widget _buildRow(
    String label,
    String value, {
    Color color = TColors.neutralDarkDark,
    double indent = 0.0,
    bool isBold = false,
    VoidCallback? onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.fromLTRB(indent, 4, 0, 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextBodyM(
                label,
                color: color,
                fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
              ),
              TextHeading4(value, color: TColors.neutralDarkDark),
            ],
          ),
        ),
      );
}

Widget _buildSeparator() => Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Separator(color: TColors.neutralLightDark),
    );

class ShiftDetail {
  final String cashierName;
  final String startTime;
  final String endTime;
  final int totalOrders;
  final FinancialSummary financialSummary;

  ShiftDetail({
    required this.cashierName,
    required this.startTime,
    required this.endTime,
    required this.totalOrders,
    required this.financialSummary,
  });
}

class FinancialSummary {
  final int startingCash;
  final int totalTransactions;
  final Map<String, int> transactionBreakdown;
  final int expectedCash;
  final int finalCash;
  final int untrackedExpense;
  final int cashDifference;

  FinancialSummary({
    required this.startingCash,
    required this.totalTransactions,
    required this.transactionBreakdown,
    required this.expectedCash,
    required this.finalCash,
    required this.untrackedExpense,
    required this.cashDifference,
  });
}
