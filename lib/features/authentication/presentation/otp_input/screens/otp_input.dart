import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/http/http.dart';

class OtpInputScreen extends StatefulWidget {
  const OtpInputScreen({super.key});

  @override
  State<OtpInputScreen> createState() => _OtpInputScreenState();
}

class _OtpInputScreenState extends State<OtpInputScreen> {
  final TextEditingController _optController = TextEditingController();
  bool isRepeat = false;
  DateTime countdownDate = DateTime.now();

  // @override
  // void initState() {
  //   super.initState();

  //   _optController.addListener(() {
  //     if (_optController.text.length == 4) {
  //       // Future.delayed(const Duration(milliseconds: 500), () {
  //       //   Navigator.pushNamed(context, "/completing-data");
  //       // });
  //     }
  //   });
  // }

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

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthVerifyOTPSuccessAndRegister) {
          Navigator.pushNamedAndRemoveUntil(context, "/completing-data",
              ModalRoute.withName("/completing-data"));
          // Navigator.popAndPushNamed(context, "/completing-data");
        } else if (state is AuthVerifyOTPSuccessAndLogin) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/cashier", ModalRoute.withName("/cashier"));
          // Navigator.popAndPushNamed(context, "/cashier");
        }
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
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
                              print('onCompleted:${state}');

                              switch (state) {
                                case AuthRequestOTPSuccess(:final target):
                                case AuthVerifyOTPFailure(:final target):
                                  context.read<AuthCubit>().verifyOTP(
                                        VerifyOTPDto(
                                          phoneNumber: target,
                                          code: value,
                                        ),
                                      );

                                  break;
                                default:
                              }
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
                    padding: const EdgeInsets.symmetric(vertical: 55.0),
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
                              Duration(seconds: 10),
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
                            onPressed: () {
                              switch (state) {
                                case AuthRequestOTPSuccess(:final target):
                                case AuthVerifyOTPFailure(:final target):
                                  context.read<AuthCubit>().requestOTP(
                                      RequestOTPDto(phoneNumber: target));

                                  break;
                                default:
                              }
                              setState(() {
                                isRepeat = false;
                                countdownDate = DateTime.now();
                              });
                            },
                            child: const TextActionL(
                              "Kirim Ulang OTP",
                              color: TColors.primary,
                            ),
                          )
                        // Text(
                        //   "59:00",
                        //   style: GoogleFonts.inter(
                        //     color: TColors.primary,
                        //     fontSize: TSizes.fontSizeActionL,
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
