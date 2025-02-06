import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/bill/application/cubit/bill_master/bill_master_cubit.dart';
import 'package:lakoe_pos/features/bill/application/cubit/bill_master/bill_master_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

class BillSettingsScreen extends StatefulWidget {
  const BillSettingsScreen({super.key});

  @override
  State<BillSettingsScreen> createState() => _BillSettingsScreenState();
}

class _BillSettingsScreenState extends State<BillSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Atur Struk & Tiket",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<BillMasterCubit, BillMasterState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle("STRUK (BILL) PESANAN"),
                SectionCard(
                  children: [
                    PaymentSectionItem(
                      title: "Print Otomatis",
                      subTitle: "Cetak struk setelah transaksi",
                      value: state.autoPrintReceipt,
                      onToggleActive: (value) {
                        context
                            .read<BillMasterCubit>()
                            .setAutoPrintReceipt(value);
                      },
                    ),
                    PaymentSectionItem(
                      title: "Gunakan Bahasa Indonesia",
                      subTitle: "Nonaktifkan untuk bahasa Inggris",
                      value: state.receiptLanguage == 'id',
                      onToggleActive: (value) {
                        context
                            .read<BillMasterCubit>()
                            .setReceiptLanguage(value ? 'id' : 'en');
                      },
                    ),
                    PaymentSectionItem(
                      title: "Catatan Kaki",
                      subTitle: "Tambahkan pesan untuk pelanggan",
                      hasSwitch: false,
                      onTap: () {
                        Navigator.pushNamed(context, "/bill/edit");
                      },
                      lastItem: true,
                    ),
                  ],
                ),
                _buildSectionTitle("TIKET ORDER (DAPUR/BAR)"),
                SectionCard(
                  children: [
                    PaymentSectionItem(
                      title: "Tiket Order",
                      subTitle: "Print tiket order untuk dapur/bar",
                      value: state.printOrderTicket,
                      onToggleActive: (value) {
                        context
                            .read<BillMasterCubit>()
                            .setPrintTicketOrder(value);
                      },
                      lastItem: true,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      margin: const EdgeInsets.only(bottom: 12),
      child: TextHeading4(
        title,
        color: TColors.neutralDarkLightest,
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final List<Widget> children;
  const SectionCard({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: TColors.neutralLightMedium,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}

class PaymentSectionItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool hasSwitch;
  final bool value;
  final bool lastItem;
  final bool isDisabled;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onToggleActive;

  const PaymentSectionItem({
    super.key,
    required this.title,
    required this.subTitle,
    this.hasSwitch = true,
    this.value = false,
    this.lastItem = false,
    this.isDisabled = false,
    this.onTap,
    this.onToggleActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hasSwitch ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isDisabled ? TColors.neutralLightLight : Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: TColors.neutralLightMedium,
              width: lastItem ? 0 : 1,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextHeading4(
                      title,
                      color: isDisabled
                          ? TColors.neutralDarkLightest
                          : TColors.neutralDarkDark,
                    ),
                    TextBodyM(
                      subTitle,
                      color: isDisabled
                          ? TColors.neutralDarkLightest
                          : TColors.neutralDarkLightest,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              if (hasSwitch)
                Switch(
                  value: value,
                  onChanged: isDisabled ? null : onToggleActive,
                )
              else
                GestureDetector(
                  onTap: () => onToggleActive?.call(true),
                  child: UiIcons(
                    TIcons.arrowRight,
                    size: 16,
                    color: TColors.neutralDarkLightest,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
