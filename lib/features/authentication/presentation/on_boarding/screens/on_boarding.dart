import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/on_boarding/on_boarding_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/on_boarding/on_boarding_state.dart';
import 'package:point_of_sales_cashier/features/authentication/data/arguments/otp_input_argument.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/on_boarding/widgets/forms/terms_agreement_checkbox.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/on_boarding/widgets/item_page_view.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: OnBoarding(),
    );
  }
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final int maxPage = 3;
  int pageIndex = 0;
  final _formKey = GlobalKey<FormBuilderState>();
  PageController pageController = PageController();
  final FocusNode _focusNode = FocusNode();
  bool _isTextInputActive = false;
  bool _isFormValid = false;
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
    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;

    if (!isFormValid) {
      SnackBar snackBar = SnackBar(
        content: Text(ErrorTextStrings.formInvalid()),
        showCloseIcon: true,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          snackBar,
        );

      return;
    }

    dynamic value = _formKey.currentState?.value;
    context
        .read<OnBoardingCubit>()
        .requestOTP(RequestOTPDto(phoneNumber: "+62${value["phoneNumber"]}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {
          if (state is OnBoardingActionFailure) {
            const snackBar = SnackBar(
              content: Text('OTP Request Failed'),
              showCloseIcon: true,
            );
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                snackBar,
              );
          }

          if (state is OnBoardingActionSuccess) {
            Navigator.pushNamed(
              context,
              "/otp-input",
              arguments: OtpInputArgument(
                id: state.response.id,
                target: state.response.target,
                type: state.response.type,
                action: state.response.action,
              ),
            );
          }
        },
        builder: (context, state) {
          return FormBuilder(
            key: _formKey,
            onChanged: () {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                _isFormValid = _formKey.currentState?.isValid ?? false;
                setState(() {});
              });
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Expanded(
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
                        title: "Jualan Makin Gampang!",
                        description:
                            "Atur penjualan toko fisik dan online secara bersamaan. Semua lebih praktis!",
                        asset: TImages.onboarding2,
                        isTextInputActive: _isTextInputActive,
                      ),
                      ItemPageView(
                        title: "Hasil Jualan Saat Ini",
                        description:
                            "Semua data penjualan dan keuntungan ada di tanganmu, lebih mudah dan cepat.",
                        asset: TImages.onboarding2,
                        isTextInputActive: _isTextInputActive,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: 24.0,
                        ),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: maxPage,
                          onDotClicked: onDotNavigation,
                          effect: const SlideEffect(
                            activeDotColor: TColors.primary,
                            dotHeight: 8,
                            dotWidth: 8,
                            dotColor: TColors.neutralLightMedium,
                          ),
                        ),
                      ),
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
                                inputFormatters: [PhoneNumberFormatter()],
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.startsWith("8",
                                      errorText:
                                          "Nomor dimulai dengan angka 8"),
                                  FormBuilderValidators.maxLength(12,
                                      errorText: ErrorTextStrings.maxLength(
                                          maxLength: 12, isNumber: true)),
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
                          onPressed: _isFormValid ? onSubmit : null,
                          child: state is OnBoardingActionInProgress
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
                )
              ],
            ),
          );
        },
      ),
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
