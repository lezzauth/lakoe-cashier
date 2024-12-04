import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/features/employees/application/cubit/employee_master/employee_master_cubit.dart';
import 'package:lakoe_pos/features/employees/application/cubit/employee_master/employee_master_state.dart';
import 'package:lakoe_pos/features/employees/data/arguments/forgot_pin_dto.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:pinput/pinput.dart';

class InputOtpScreen extends StatelessWidget {
  const InputOtpScreen({super.key, required this.arguments});

  final ForgotPinArguments arguments;

  @override
  Widget build(BuildContext context) {
    return InputOtp(arguments: arguments);
  }
}

class InputOtp extends StatefulWidget {
  const InputOtp({super.key, required this.arguments});

  final ForgotPinArguments arguments;

  @override
  State<InputOtp> createState() => _InputOtpState();
}

class _InputOtpState extends State<InputOtp>
    with SingleTickerProviderStateMixin {
  final TextEditingController _otpController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _animation;

  String messageError = "Kode OTP Salah. Cek lagi.";
  bool isRepeat = false;
  DateTime countdownDate = DateTime.now();

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
    _otpController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _onRequestOTP() async {
    setState(() {
      messageError = "";
      isRepeat = false;
      countdownDate = DateTime.now();
    });
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

    String phoneNumber = widget.arguments.phoneNumber!;
    // String newPIN = widget.arguments.pin!;

    return BlocBuilder<EmployeeMasterCubit, EmployeeMasterState>(
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
                            TFormatter.censoredPhoneNumber(phoneNumber),
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
                            controller: _otpController,
                            onCompleted: (value) {
                              _otpController.clear();

                              // context.read<OwnerCubit>().updatePhoneNumber(
                              //       UpdatePhoneNumberDto(
                              //         token: token,
                              //         phoneNumber: data!.target,
                              //         otp: value,
                              //       ),
                              //     );
                            },
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: (state is EmployeeMasterActionFailure)
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
    });
  }
}
