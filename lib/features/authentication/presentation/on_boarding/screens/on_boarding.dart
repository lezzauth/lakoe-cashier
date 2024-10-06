import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/responsive/responsive_layout.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/on_boarding/on_boarding_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/on_boarding/on_boarding_state.dart';
import 'package:point_of_sales_cashier/features/authentication/data/arguments/otp_input_argument.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/on_boarding/screens/mobile/mobile_on_boarding.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/on_boarding/screens/tablet/tablet_on_boarding.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';

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
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
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
            child: ResponsiveLayout(
              mobile: MobileOnBoarding(
                formKey: _formKey,
                state: state,
                isFormValid: _isFormValid,
              ),
              tablet: TabletOnBoarding(
                formKey: _formKey,
                state: state,
                isFormValid: _isFormValid,
              ),
            ),
          );
        },
      ),
    );
  }
}
