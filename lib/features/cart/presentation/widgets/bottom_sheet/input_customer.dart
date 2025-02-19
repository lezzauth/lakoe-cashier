import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/form/custom_checkbox.dart';
import 'package:lakoe_pos/common/widgets/form/form_label.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_l.dart';
import 'package:lakoe_pos/features/cart/application/cubit/customer/cart_customer_filter_cubit.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class InputTemporaryCustomer extends StatelessWidget {
  const InputTemporaryCustomer({super.key, this.value});

  final CustomerModel? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCustomerFilterCubit(),
      child: InputTemporaryCustomerContent(value: value),
    );
  }
}

class InputTemporaryCustomerContent extends StatefulWidget {
  final CustomerModel? value;

  const InputTemporaryCustomerContent({super.key, this.value});

  @override
  State<InputTemporaryCustomerContent> createState() =>
      _InputTemporaryCustomerContentState();
}

class _InputTemporaryCustomerContentState
    extends State<InputTemporaryCustomerContent> {
  final TextEditingController controllerName = TextEditingController();
  final FocusNode _focusNodeName = FocusNode();

  bool saveAsCustomer = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      if (!mounted) return;
      FocusScope.of(context).requestFocus(_focusNodeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        16,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controllerName,
              focusNode: _focusNodeName,
              decoration: InputDecoration(
                hintText: "Pesanan atas nama siapa?",
                hintStyle: GoogleFonts.inter(
                  fontSize: TSizes.fontSizeHeading1,
                  fontWeight: FontWeight.w700,
                  color: TColors.neutralLightDarkest,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              style: GoogleFonts.inter(
                fontSize: TSizes.fontSizeHeading1,
                fontWeight: FontWeight.w700,
                color: TColors.neutralDarkDark,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  CustomCheckbox(
                    value: saveAsCustomer,
                    onChanged: (bool value) {
                      setState(() {
                        saveAsCustomer = value;
                      });
                    },
                  ),
                  SizedBox(width: 12),
                  TextBodyL(
                    "Simpan sebagai pelanggan tetap",
                    color: TColors.neutralDarkDark,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: saveAsCustomer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormLabel("Nomor HP/WA"),
                  FormBuilderTextField(
                    name: "phoneNumber",
                    decoration: const InputDecoration(
                        hintText: "Masukan nomor hp atau wa",
                        helperText:
                            "Jangan lupa minta nomor WA pelanggan kamu, ya!"),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      PhoneNumberFormatter(isDisplayFormat: true),
                      LengthLimitingTextInputFormatter(14),
                    ],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.maxLength(14,
                          errorText: ErrorTextStrings.maxLength(
                              maxLength: 14, isNumber: true)),
                      FormBuilderValidators.minLength(9,
                          errorText: ErrorTextStrings.minLength(
                              minLength: 9, isNumber: true)),
                    ]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: TextActionL("Cari Pelanggan"),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: TextActionL("Lanjutkan"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
