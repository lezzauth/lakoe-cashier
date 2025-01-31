import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_state.dart';
import 'package:lakoe_pos/features/cart/data/models/cart_model.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class CartCountFloatingAction extends StatelessWidget {
  const CartCountFloatingAction({
    super.key,
    required this.onPressed,
    this.labelButton = "Proses Pesanan",
  });

  final void Function() onPressed;
  final String? labelButton;

  String _getTotalPrice(List<CartModel> carts) {
    return TFormatter.formatToRupiah(carts.fold(
      0,
      (sum, item) => sum + (item.quantity * int.parse(item.product.price)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, cartState) {
        return Visibility(
          visible: cartState.carts.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 52,
              width: double.maxFinite,
              child: FloatingActionButton(
                onPressed: onPressed,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextHeading3(
                        _getTotalPrice(cartState.carts),
                        color: TColors.neutralLightLightest,
                      ),
                      TextHeading3(
                        "$labelButton (${cartState.carts.length.toString()})",
                        color: TColors.neutralLightLightest,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
