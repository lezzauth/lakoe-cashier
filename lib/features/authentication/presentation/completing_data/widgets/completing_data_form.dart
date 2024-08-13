import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/widgets/completing_data_form/business_information_form.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/widgets/completing_data_form/owner_information_form.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class CompletingDataForm extends StatefulWidget {
  const CompletingDataForm({super.key});

  @override
  State<CompletingDataForm> createState() => _CompletingDataFormState();
}

class _CompletingDataFormState extends State<CompletingDataForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Expanded(
        child: ListView(
          padding: const EdgeInsets.only(top: 16),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              margin: const EdgeInsets.only(bottom: 22),
              child: Text(
                "Informasi usaha",
                style: GoogleFonts.inter(
                  fontSize: TSizes.fontSizeHeading1,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const OwnerInformationForm(),
            Container(
              height: 4,
              width: double.infinity,
              color: TColors.neutralLightDark,
            ),
            const BusinessInformationForm(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Lanjutkan",
                  style: GoogleFonts.inter(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
