import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_cubit.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/radio.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shimmer/shimmer.dart';

class PaymentMethodRadioGroup extends StatefulWidget {
  final String? value;
  final ValueChanged<String?> onChanged;
  final List<String> limitedValues;

  const PaymentMethodRadioGroup({
    super.key,
    required this.value,
    required this.onChanged,
    required this.limitedValues,
  });

  @override
  State<PaymentMethodRadioGroup> createState() =>
      _PaymentMethodRadioGroupState();
}

class _PaymentMethodRadioGroupState extends State<PaymentMethodRadioGroup> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value!;
  }

  @override
  void didUpdateWidget(covariant PaymentMethodRadioGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != selectedValue) {
      setState(() {
        selectedValue = widget.value!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final bottomSheetWidth = constraints.maxWidth;
      return BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
        builder: (context, state) {
          if (state is PaymentMethodLoadSuccess) {
            final items = state.paymentMethod
                .where((method) => method.isActive)
                .map((method) => method.channel)
                .whereType<String>()
                .toSet()
                .map((channel) => {"value": channel})
                .toList();

            if (items.isNotEmpty &&
                !items.any((item) => item["value"] == selectedValue)) {
              selectedValue = items.first["value"]!;
              widget.onChanged(selectedValue);
            }

            return Column(
              children: [
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: List.generate(
                    items.length,
                    (index) {
                      return SizedBox(
                        width: (items.length % 2 != 0 && index == 0)
                            ? bottomSheetWidth
                            : (bottomSheetWidth) / 2 - 6,
                        child: PaymentMethodRadio(
                          value: items[index]["value"]!,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                            widget.onChanged(value);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is PaymentMethodLoadInProgress) {
            return ShimmerPaymentMethodRadio(width: bottomSheetWidth);
          } else {
            return ShimmerPaymentMethodRadio(width: bottomSheetWidth);
          }
        },
      );
    });
  }
}

class ShimmerPaymentMethodRadio extends StatelessWidget {
  const ShimmerPaymentMethodRadio({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return Column(
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: List.generate(
            4,
            (index) => SizedBox(
              width: (4 % 2 != 0 && index == 0) ? width : (width / 2) - 6,
              child: _buildPaymentMethodTile(isMobile),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodTile(bool isMobile) {
    return Container(
      height: 58,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: TColors.neutralLightMedium, width: 1),
      ),
      child: ResponsiveLayout(
        mobile: _buildPaymentContent(isMobile),
        tablet: Center(
          child: _buildPaymentContent(isMobile),
        ),
      ),
    );
  }

  Widget _buildPaymentContent(bool isMobile) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment:
          isMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        Shimmer.fromColors(
          baseColor: const Color(0xFFE8E9F1),
          highlightColor: const Color(0xFFF8F9FE),
          child: Container(
            decoration: BoxDecoration(
              color: TColors.highlightDark,
              borderRadius: BorderRadius.circular(18 / 2),
            ),
            width: 18,
            height: 18,
          ),
        ),
        const SizedBox(width: 12),
        Shimmer.fromColors(
          baseColor: const Color(0xFFE8E9F1),
          highlightColor: const Color(0xFFF8F9FE),
          child: Container(
            decoration: BoxDecoration(
              color: TColors.highlightDark,
              borderRadius: BorderRadius.circular(8),
            ),
            width: 80,
            height: 16,
          ),
        ),
      ],
    );
  }
}
