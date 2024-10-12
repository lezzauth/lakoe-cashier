import 'package:flutter/material.dart' hide Image;
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/bill/text_small.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/bill/application/cubit/bill_master/bill_master_cubit.dart';
import 'package:point_of_sales_cashier/features/bill/data/arguments/template_order_model.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/widgets/bill_view.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthReady) {
                    final outletName = state.profile.outlets.first.name;
                    final outletAddress = state.profile.outlets.first.address;

                    return BillView(
                      outletName: outletName,
                      outletAddress: outletAddress,
                      noBill: "LK-0001",
                      order: templateOrder.order,
                    );
                  } else if (state is AuthNotReady) {
                    return Center(child: Text('Failed to load outlet info.'));
                  }
                  return CircularProgressIndicator();
                },
              ),
              const TextBodyS(
                "Ini hanya contoh tampilan struk",
                color: TColors.neutralDarkLightest,
                fontStyle: FontStyle.italic,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: SizedBox(
              height: 48,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/bill/edit");
                },
                child: const TextActionL(
                  "Ubah Catatan Kaki",
                  color: TColors.primary,
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

class _BillPriceItem {
  final String label;
  final String price;

  _BillPriceItem({
    required this.label,
    required this.price,
  });
}
