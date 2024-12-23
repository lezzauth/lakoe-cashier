import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logman/logman.dart';
import 'package:pinput/pinput.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/otp_input/otp_input_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/otp_input/otp_input_state.dart';
import 'package:point_of_sales_cashier/features/authentication/data/arguments/completing_data_argument.dart';
import 'package:point_of_sales_cashier/features/authentication/data/arguments/otp_input_argument.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class OtpInputScreen extends StatelessWidget {
  const OtpInputScreen({super.key, required this.arguments});
  final OtpInputArgument arguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpInputCubit(),
      child: OtpInput(
        arguments: arguments,
      ),
    );
  }
}

class OtpInput extends StatefulWidget {
  const OtpInput({super.key, required this.arguments});

  final OtpInputArgument arguments;

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput>
    with SingleTickerProviderStateMixin {
  final TextEditingController _optController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _animation;

  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepositoryImpl();

  String messageError = "Kode OTP Salah. Cek lagi.";
  bool isRepeat = false;
  DateTime countdownDate = DateTime.now();

  Future<void> _onRequestOTP() async {
    await _authenticationRepository.requestOTP(RequestOTPDto(
      phoneNumber: widget.arguments.target,
    ));

    setState(() {
      messageError = "";
      isRepeat = false;
      countdownDate = DateTime.now();
    });
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animation = Tween<double>(begin: 0, end: 15)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _optController.dispose();
    _animationController.dispose();
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
        } else if (state is OtpInputActionFailure) {
          _animationController.forward();
          Logman.instance.info(state.res.message!);
          if (state.res.message!.contains("expired") && isRepeat) {
            setState(() {
              messageError = "Kode OTP salah. Silakan kirim ulang.";
            });
          }
        } else if (state is OtpInputActionRegister) {
          Navigator.pushNamed(context, "/completing-data",
              // ModalRoute.withName("/completing-data"),
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
                Container(
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
                      AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(_animation.value, 0),
                            child: Pinput(
                              defaultPinTheme: defaultPinTheme,
                              focusedPinTheme: focusedPinTheme,
                              length: 4,
                              autofocus: true,
                              obscureText: true,
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
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: (state is OtpInputActionFailure)
                            ? Container(
                                margin: const EdgeInsets.only(top: 12),
                                child: Text(
                                  messageError,
                                  style: GoogleFonts.inter(
                                    fontSize: TSizes.fontSizeBodyS,
                                    color: TColors.error,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Row(
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
                        // endTime: countdownDate,
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
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
