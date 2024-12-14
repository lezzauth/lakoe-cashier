import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/completing_data/completing_data_form_cubit.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/completing_data/completing_data_form_state.dart';
import 'package:lakoe_pos/features/authentication/presentation/completing_data/widgets/completing_data_form/business_information_form.dart';
import 'package:lakoe_pos/features/authentication/presentation/completing_data/widgets/completing_data_form/owner_information_form.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class CompletingDataFormPage extends StatefulWidget {
  const CompletingDataFormPage({
    super.key,
    this.initialValue = const <String, dynamic>{},
    required this.onSubmitted,
  });

  final Map<String, dynamic> initialValue;
  final Function() onSubmitted;

  @override
  State<CompletingDataFormPage> createState() => _CompletingDataFormPageState();
}

class _CompletingDataFormPageState extends State<CompletingDataFormPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _onSubmit() {
    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;

    if (!isFormValid) {
      if (kDebugMode) {
        print('Form complete data invalid');
      }
      return;
    }

    widget.onSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompletingDataFormCubit, CompletingDataFormState>(
        builder: (context, state) {
      return FormBuilder(
        key: _formKey,
        onChanged: () {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            bool isFormValid = _formKey.currentState?.isValid ?? false;
            context.read<CompletingDataFormCubit>().setValue(
                  _formKey.currentState?.instantValue,
                  isFormValid,
                );
          });
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        // initialValue: widget.initialValue,
        initialValue: {
          ...widget.initialValue,
          'phoneNumber': PhoneNumberFormatter.formatForDisplay(
              widget.initialValue['phoneNumber'] ?? ''),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: ElevatedButton(
                  onPressed: state.isFormValid ? _onSubmit : null,
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
    });
  }
}
