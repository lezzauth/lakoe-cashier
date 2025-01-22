import 'package:flutter/material.dart' hide Image;
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/ui/separator/separator.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/bill/text_small.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/features/bill/application/cubit/bill_master/bill_master_cubit.dart';
import 'package:lakoe_pos/features/bill/data/arguments/template_order_model.dart';
import 'package:lakoe_pos/features/bill/presentation/widgets/bill_view.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillMasterScreen extends StatelessWidget {
  const BillMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BillMaster();
  }
}

class BillMaster extends StatefulWidget {
  const BillMaster({super.key});

  @override
  State<BillMaster> createState() => _BillMasterState();
}

class _BillMasterState extends State<BillMaster> {
  // late TemplateOrderModel templateOrder;

  void _onInit() {
    context.read<BillMasterCubit>().init();
  }

  @override
  void initState() {
    super.initState();

    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    TemplateOrderModel templateOrder = TemplateOrderModel();

    return Scaffold(
      backgroundColor: TColors.neutralLightLight,
      appBar: const CustomAppbar(
        title: "Tampilan Struk (Bill)",
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ResponsiveLayout(
                      mobile: BillView(order: templateOrder.order),
                      tablet: Center(
                        child: SizedBox(
                          width: 450,
                          child: BillView(order: templateOrder.order),
                        ),
                      ),
                    ),
                    const TextBodyS(
                      "Ini hanya contoh tampilan struk",
                      color: TColors.neutralDarkLightest,
                      fontStyle: FontStyle.italic,
                    ),
                  ],
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: TColors.neutralLightLight,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/bill/edit");
                  },
                  child: TextActionL("Ubah Catatan Kaki"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionBillInformation extends StatelessWidget {
  final String cashierName;
  final String noBill;
  final String orderDate;

  const SectionBillInformation({
    super.key,
    required this.cashierName,
    required this.noBill,
    required this.orderDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: TextSmall(
                "Cashier:",
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextSmall(
                cashierName,
                isBold: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: TextSmall(
                "Receipt No:",
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextSmall(
                noBill,
                isBold: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: TextSmall(
                "Order Date:",
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextSmall(
                orderDate,
                textAlign: TextAlign.right,
                isBold: true,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Separator(
            color: TColors.neutralDarkDarkest,
            height: 0.5,
            dashWidth: 4.0,
          ),
        ),
      ],
    );
  }
}
