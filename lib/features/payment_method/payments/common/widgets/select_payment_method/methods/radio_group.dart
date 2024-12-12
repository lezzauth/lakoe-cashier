import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_cubit.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/radio.dart';

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
    // Nilai awal dari widget.value yang dijamin non-null
    selectedValue = widget.value!;
  }

  @override
  void didUpdateWidget(covariant PaymentMethodRadioGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update selectedValue jika widget.value berubah
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

            return Wrap(
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
            );
          } else if (state is PaymentMethodLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(
                child: Text("Tidak ada data metode pembayaran"));
          }
        },
      );
    });
  }
}
