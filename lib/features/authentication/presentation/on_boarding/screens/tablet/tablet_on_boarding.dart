import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/on_boarding/on_boarding_cubit.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/on_boarding/on_boarding_state.dart';
import 'package:lakoe_pos/features/authentication/presentation/on_boarding/widgets/forms/terms_agreement_checkbox.dart';
import 'package:lakoe_pos/features/authentication/presentation/on_boarding/widgets/item_page_view.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class TabletOnBoarding extends StatefulWidget {
  const TabletOnBoarding({
    super.key,
    required this.state,
    this.isFormValid = false,
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;
  final OnBoardingState state;
  final bool isFormValid;

  @override
  State<TabletOnBoarding> createState() => _TabletOnBoardingState();
}

class _TabletOnBoardingState extends State<TabletOnBoarding> {
  final int maxPage = 3;
  int pageIndex = 0;
  PageController pageController = PageController();
  final FocusNode _focusNode = FocusNode();
  bool _isTextInputActive = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (pageController.page == 2) {
        pageController.jumpToPage(0);
      } else {
        pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });

    _focusNode.addListener(() {
      setState(() {
        _isTextInputActive = _focusNode.hasFocus;
      });
    });
  }

  onPageUpdate(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  onDotNavigation(int index) {
    pageController.jumpToPage(index);
  }

  onSubmit() {
    FocusScope.of(context).unfocus();
    bool isFormValid = widget.formKey.currentState?.saveAndValidate() ?? false;

    if (!isFormValid) {
      return;
    }

    dynamic value = widget.formKey.currentState?.value;
    String phoneNumber =
        PhoneNumberFormatter.formatForRequest(value["phoneNumber"]);
    context.read<OnBoardingCubit>().requestOTP(
          RequestOTPDto(
            phoneNumber: phoneNumber,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: PageView(
            allowImplicitScrolling: true,
            onPageChanged: onPageUpdate,
            controller: pageController,
            children: [
              ItemPageView(
                withLogo: true,
                description:
                    "Solusi POS Terbaik untuk Bisnis F&B. Kelola bisnis Anda dengan lebih mudah, efisien, dan menguntungkan.",
                asset: TImages.onboarding1,
                isTextInputActive: _isTextInputActive,
              ),
              ItemPageView(
                title: "QR Order dari Meja",
                description:
                    "Cukup scan QR di meja, pelanggan bisa pesan langsung dari HP customer.",
                asset: TImages.onboarding2,
                isTextInputActive: _isTextInputActive,
              ),
              ItemPageView(
                title: "Cek Laporan Penjualan",
                description:
                    "Semua data penjualan dan keuntungan ada di tanganmu, lebih mudah dan cepat.",
                asset: TImages.onboarding3,
                isTextInputActive: _isTextInputActive,
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    "Mulailah dari sini...",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w900,
                      fontSize: TSizes.fontSizeHeading1,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 24.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 48,
                        width: 85,
                        decoration: BoxDecoration(
                          color: TColors.neutralLightLight,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: TColors.neutralLightDarkest,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 8,
                            direction: Axis.horizontal,
                            children: [
                              Image.asset(
                                TImages.indoFlag,
                                height: 20,
                                width: 20,
                              ),
                              const TextHeading4("+62"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: FormBuilderTextField(
                          name: "phoneNumber",
                          focusNode: _focusNode,
                          decoration: const InputDecoration(
                            hintText: "Masukan nomor WA",
                          ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            PhoneNumberFormatter(),
                            LengthLimitingTextInputFormatter(14),
                          ],
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.startsWith("8",
                                errorText: "Nomor dimulai dengan angka 8"),
                            FormBuilderValidators.maxLength(14,
                                errorText: ErrorTextStrings.maxLength(
                                    maxLength: 14, isNumber: true)),
                            FormBuilderValidators.minLength(9,
                                errorText: ErrorTextStrings.minLength(
                                    minLength: 9, isNumber: true)),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 24.0),
                  child: FormBuilderField<bool>(
                    name: "isTermsAgreementAgreed",
                    builder: (field) {
                      return TermsAgreementCheckbox(
                        value: field.value ?? false,
                        onChanged: field.didChange,
                        isError: field.hasError,
                      );
                    },
                    validator: FormBuilderValidators.isTrue(),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: widget.isFormValid ? onSubmit : null,
                    child: widget.state is OnBoardingActionInProgress
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(
                              color: TColors.neutralLightLightest,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            "Lanjutkan",
                          ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _focusNode.dispose();
    pageController.dispose();
    super.dispose();
  }
}
