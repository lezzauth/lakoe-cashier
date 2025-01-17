import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/error_display/error_display.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_cubit.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:pinput/pinput.dart';

class NewOtpInputScreen extends StatefulWidget {
  const NewOtpInputScreen({super.key});

  @override
  State<NewOtpInputScreen> createState() => _NewOtpInputScreenState();
}

class _NewOtpInputScreenState extends State<NewOtpInputScreen>
    with SingleTickerProviderStateMixin {
  final OwnerRepository _ownerRepository = OwnerRepositoryImpl();
  final TextEditingController _otpController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _animation;

  String messageError = "Kode OTP Salah. Cek lagi.";
  bool isRepeat = false;
  DateTime countdownDate = DateTime.now();

  late String token;
  RequestOTPRes? data;

  @override
  void initState() {
    super.initState();
    CustomToast.init(context);

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null) {
      final RequestOTPRes otpData = args['otpData'];

      setState(() {
        data = otpData;
        token = args['token'];
      });
    } else {
      Navigator.pop(context);
    }
  }

  Future<void> _onRequestOTP() async {
    await _ownerRepository.requestOTP(RequestOTPDto(
      phoneNumber: data!.target,
    ));

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

    return BlocConsumer<OwnerCubit, OwnerState>(
        listener: (context, state) async {
      if (state is OwnerActionSuccess) {
        CustomToast.showWithContext(
          context,
          "Nomor WA berhasil diubah",
          duration: 1,
          backgroundColor: TColors.success,
        );
        await Future.delayed(Duration(seconds: 1));

        if (!context.mounted) return;
        Navigator.pop(context, true);
        Navigator.pop(context, true);
      } else if (state is OwnerActionFailure) {
        if (state.error.contains("expired")) {
          showModalBottomSheet(
            context: context,
            enableDrag: false,
            isDismissible: false,
            builder: (context) {
              return PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) async {},
                child: CustomBottomsheet(
                  hasGrabber: false,
                  child: ErrorDisplay(
                    imageSrc: TImages.generalIllustration,
                    title: "Ups, Terjadi sedikit masalah!",
                    description:
                        "Kamu perlu mengulangi prosesnya dengan mamasukan ulang PIN kamu.",
                    actionTitlePrimary: "Masukan Ulang PIN",
                    onActionPrimary: () {
                      Navigator.pop(context, true);
                      Navigator.pop(context, true);
                      Navigator.pop(context, true);
                    },
                  ),
                ),
              );
            },
          );
        } else {
          CustomToast.showWithContext(
            context,
            "Nomor WA gagal diubah",
            duration: 1,
            backgroundColor: TColors.error,
          );
          await Future.delayed(Duration(seconds: 1));

          if (!context.mounted) return;
          Navigator.pop(context, true);
          Navigator.pop(context, true);
        }
      }
    }, builder: (context, state) {
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
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: TextHeading2(
                              "Verifikasi Nomor Baru",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          TextBodyM(
                            "Masukkan 4 angka kode OTP yang sudah kami kirimkan ke nomor WhatsApp dibawah ini:",
                            color: TColors.neutralDarkMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              UiIcons(
                                TIcons.whatsapp,
                                size: 16,
                                color: Color(0xFF25D366),
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 8),
                              TextBodyM(
                                TFormatter.censoredPhoneNumber(data!.target),
                                color: TColors.neutralDarkMedium,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.center,
                              ),
                            ],
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

                              context.read<OwnerCubit>().updatePhoneNumber(
                                    UpdatePhoneNumberDto(
                                      token: token,
                                      phoneNumber: data!.target,
                                      otp: value,
                                    ),
                                  );
                            },
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: (state is OwnerActionFailure)
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
