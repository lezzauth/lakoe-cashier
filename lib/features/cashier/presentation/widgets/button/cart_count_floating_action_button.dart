import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_state.dart';
import 'package:point_of_sales_cashier/features/cart/data/models/cart_model.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class CartCountFloatingAction extends StatelessWidget {
  const CartCountFloatingAction({super.key, required this.onPressed});

  final void Function() onPressed;

  String _getTotalPrice(List<CartModel> carts) {
    return TFormatter.formatToRupiah(carts.fold(0,
        (sum, item) => sum + (item.quantity * int.parse(item.product.price))));
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
                        "Proses Pesanan (${cartState.carts.length.toString()})",
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
