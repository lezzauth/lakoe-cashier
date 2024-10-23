import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/data/models.dart';
import 'package:point_of_sales_cashier/common/widgets/tiles/custom_radio_tile.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class PaymentBottomSheet extends StatefulWidget {
  final List<PaymentCategory> paymentCategories;
  final PaymentCategory? selectedCategory;
  final PaymentMethod? selectedMethod;
  final Function(PaymentCategory, PaymentMethod) onSelected;

  const PaymentBottomSheet({
    super.key,
    required this.paymentCategories,
    required this.selectedCategory,
    required this.selectedMethod,
    required this.onSelected,
  });

  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  PaymentCategory? selectedCategory;
  PaymentMethod? selectedMethod;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.selectedCategory;
    selectedMethod = widget.selectedMethod;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: const TextHeading2("Pilih metode pembayaran"),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.paymentCategories.length,
            itemBuilder: (context, index) {
              final category = widget.paymentCategories[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextHeading3(
                      category.categoryName,
                      color: TColors.neutralDarkDark,
                    ),
                  ),
                  ...category.methods.map((method) {
                    return CustomRadioTile(
                      leading: Image.asset(method.logo, width: 24, height: 24),
                      title: method.name,
                      value: method,
                      groupValue: selectedMethod,
                      onChanged: (dynamic value) {
                        setState(() {
                          selectedCategory = category;
                          selectedMethod = value as PaymentMethod?;
                        });
                        widget.onSelected(selectedCategory!, selectedMethod!);
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
