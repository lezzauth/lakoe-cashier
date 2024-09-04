import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/completing_data/completing_data_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/widgets/completing_data_form/business_information_form.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/widgets/completing_data_form/owner_information_form.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class CompletingDataFormPage extends StatefulWidget {
  final String phoneNumber;

  const CompletingDataFormPage({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<CompletingDataFormPage> createState() => _CompletingDataFormPageState();
}

class _CompletingDataFormPageState extends State<CompletingDataFormPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  onSubmit() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      dynamic value = _formKey.currentState?.value;

      context.read<CompletingDataCubit>().submitBusinessInformation(
            name: value["name"],
            phoneNumber: value["phoneNumber"],
            email: value["email"],
            outletAddress: value["outletAddress"],
            outletName: value["outletName"],
            outletType: value["outletType"],
          );
    } else {
      const snackBar = SnackBar(
        content: Text('Validation failed'),
        showCloseIcon: true,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          snackBar,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      // onChanged: _onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: {
        "phoneNumber": widget.phoneNumber,
        "outletType": "Kuliner"
      },
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: ElevatedButton(
                onPressed:
                    (_formKey.currentState?.isValid ?? false) ? onSubmit : null,
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
