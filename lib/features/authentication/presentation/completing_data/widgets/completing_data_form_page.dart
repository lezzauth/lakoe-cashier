import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/features/authentication/application/bloc/completing_data/completing_data_page_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/bloc/completing_data/completing_data_page_event.dart';
import 'package:point_of_sales_cashier/features/authentication/application/bloc/completing_data/completing_data_page_state.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/widgets/completing_data_form/business_information_form.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/widgets/completing_data_form/owner_information_form.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class CompletingDataFormPage extends StatefulWidget {
  const CompletingDataFormPage({super.key});

  @override
  State<CompletingDataFormPage> createState() => _CompletingDataFormPageState();
}

class _CompletingDataFormPageState extends State<CompletingDataFormPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompletingDataPageBloc, CompletingDataPageState>(
      builder: (context, state) => Form(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<CompletingDataPageBloc>().add(
                        CompletingDataChangePageEvent(
                            page: CompletingDataPage.pinInput));
                  },
                  child: Text(
                    "Lanjutkan",
                    style: GoogleFonts.inter(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
