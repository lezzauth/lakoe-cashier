import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class CashPaymentFooter extends StatelessWidget {
  const CashPaymentFooter({
    super.key,
    this.onCanceled,
    required this.onSubmitted,
  });

  final void Function()? onSubmitted;
  final Function()? onCanceled;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: BlocBuilder<CartDetailCubit, CartDetailState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state is CartDetailActionInProgress
                        ? null
                        : onSubmitted,
                    child: const TextActionL("Bayar & Selesaikan"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      tablet: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              color: TColors.neutralLightLightest,
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: TColors.neutralLightMedium,
                ),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 140,
                  child: OutlinedButton(
                    onPressed: onCanceled,
                    child: const TextActionL(
                      "Batalkan",
                      color: TColors.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: BlocBuilder<CartDetailCubit, CartDetailState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state is CartDetailActionInProgress
                            ? null
                            : onSubmitted,
                        child: const TextActionL("Bayar & Selesaikan"),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
