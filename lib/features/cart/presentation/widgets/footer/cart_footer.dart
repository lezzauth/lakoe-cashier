import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class CartFooter extends StatelessWidget {
  const CartFooter({
    super.key,
    required this.onCompleted,
    required this.onSaved,
  });

  final Function() onSaved;
  final ValueChanged<int> onCompleted;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartDetailCubit, CartDetailState>(
      builder: (context, cartState) => Row(
        children: [
          SizedBox(
            height: 48.0,
            child: OutlinedButton(
              onPressed:
                  cartState is CartDetailActionInProgress ? null : onSaved,
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 26),
                ),
              ),
              child: cartState is CartDetailActionInProgress
                  ? const SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    )
                  : const TextActionL(
                      "Simpan",
                      color: TColors.primary,
                    ),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: SizedBox(
              height: 48.0,
              child: ElevatedButton(
                onPressed: cartState is CartDetailActionInProgress
                    ? null
                    : () {
                        if (cartState is CartDetailLoadSuccess) {
                          onCompleted(
                              int.parse(cartState.previewOrderPrice.total));
                        }
                      },
                child: cartState is CartDetailActionInProgress
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                          color: TColors.neutralLightLightest,
                        ),
                      )
                    : const TextActionL(
                        "Bayar & Selesai",
                        color: TColors.neutralLightLightest,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}