import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/widgets/completing_data_form.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class CompletingDataScreen extends StatelessWidget {
  const CompletingDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: TColors.primary,
                      ),
                      height: 8,
                    ),
                  ),
                  const SizedBox(
                    width: 6.28,
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: TColors.primary,
                      ),
                      height: 8,
                    ),
                  ),
                ],
              ),
            ),
            const CompletingDataForm(),
          ],
        ),
      ),
    );
  }
}
