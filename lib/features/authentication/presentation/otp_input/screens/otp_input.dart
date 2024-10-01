import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/otp_input/otp_input_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/otp_input/otp_input_state.dart';
import 'package:point_of_sales_cashier/features/authentication/data/arguments/completing_data_argument.dart';
import 'package:point_of_sales_cashier/features/authentication/data/arguments/otp_input_argument.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class OtpInputScreen extends StatefulWidget {
  const OtpInputScreen({super.key, required this.arguments});

  final OtpInputArgument arguments;

  @override
  State<OtpInputScreen> createState() => _OtpInputScreenState();
}

class _OtpInputScreenState extends State<OtpInputScreen> {
  final TextEditingController _optController = TextEditingController();
  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepositoryImpl();

  bool isRepeat = false;
  DateTime countdownDate = DateTime.now();

  Future<void> _onRequestOTP() async {
    await _authenticationRepository
        .requestOTP(RequestOTPDto(phoneNumber: widget.arguments.target));

    setState(() {
      isRepeat = false;
      countdownDate = DateTime.now().add(Duration(minutes: 1));
    });
  }

  @override
  void dispose() {
    _optController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: const TextStyle(
        fontSize: TSizes.fontSizeBodyM,
        color: TColors.neutralDarkDarkest,
        fontWeight: FontWeight.w400,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: TColors.neutralLightDark),
        borderRadius: BorderRadius.circular(TSizes.inputRadius),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: TColors.primary, width: 1.5),
    );

    return BlocConsumer<OtpInputCubit, OtpInputState>(
      listener: (context, state) async {
        if (!mounted) return;

        if (state is OtpInputActionLogin) {
          await context.read<AuthCubit>().initialize();
          if (!context.mounted) return;

          Navigator.pushNamedAndRemoveUntil(
              context, "/cashier", ModalRoute.withName("/cashier"));
        } else if (state is OtpInputActionRegister) {
          Navigator.pushNamedAndRemoveUntil(context, "/completing-data",
              ModalRoute.withName("/completing-data"),
              arguments: CompletingDataArgument(
                token: state.response.token,
                phoneNumber: widget.arguments.target,
              ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 23.5),
                    margin: const EdgeInsets.only(top: 88.5),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 40),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "Verifikasi Nomor WhatsApp",
                                  style: GoogleFonts.inter(
                                    fontSize: TSizes.fontSizeHeading3,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text(
                                "Masukkan 4 digit kode OTP yang telah kami kirimkan melalui WhatsApp untuk melanjutkan.",
                                style: GoogleFonts.inter(
                                  fontSize: TSizes.fontSizeBodyS,
                                  color: TColors.neutralDarkMedium,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12),
                              if (state is AuthRequestOTPSuccess)
                                Text(
                                  TFormatter.censoredPhoneNumber(
                                      widget.arguments.target),
                                  style: GoogleFonts.inter(
                                    fontSize: TSizes.fontSizeBodyS,
                                    color: TColors.neutralDarkMedium,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                            ],
                          ),
                        ),
                        Pinput(
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          length: 4,
                          autofocus: true,
                          controller: _optController,
                          onCompleted: (value) {
                            context
                                .read<OtpInputCubit>()
                                .verifyOTP(VerifyOTPDto(
                                  phoneNumber: widget.arguments.target,
                                  code: value,
                                ));

                            _optController.clear();
                          },
                        ),
                        if (state is AuthVerifyOTPFailure)
                          Container(
                            margin: const EdgeInsets.only(top: 12),
                            child: Text(
                              "OTP Salah",
                              style: GoogleFonts.inter(
                                fontSize: TSizes.fontSizeBodyS,
                                color: TColors.error,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 55.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!isRepeat) ...[
                        const SizedBox(
                          height: 12,
                          width: 12,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        TimerCountdown(
                          endTime: countdownDate.add(
                            const Duration(minutes: 1),
                          ),
                          format: CountDownTimerFormat.minutesSeconds,
                          enableDescriptions: false,
                          spacerWidth: 2,
                          timeTextStyle: GoogleFonts.inter(
                            color: TColors.primary,
                            fontSize: TSizes.fontSizeActionL,
                            fontWeight: FontWeight.w600,
                          ),
                          colonsTextStyle: GoogleFonts.inter(
                            color: TColors.primary,
                            fontSize: TSizes.fontSizeActionL,
                            fontWeight: FontWeight.w600,
                          ),
                          onEnd: () {
                            setState(() {
                              isRepeat = true;
                            });
                          },
                        )
                      ],
                      if (isRepeat)
                        TextButton(
                          onPressed: _onRequestOTP,
                          child: const TextActionL(
                            "Kirim Ulang OTP",
                            color: TColors.primary,
                          ),
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
