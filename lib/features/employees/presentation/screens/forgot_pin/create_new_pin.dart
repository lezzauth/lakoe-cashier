import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/form/dotted_pin.dart';
import 'package:lakoe_pos/common/widgets/form/number_pad.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/features/employees/data/arguments/forgot_pin_dto.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';

class CreateNewPinScreen extends StatelessWidget {
  const CreateNewPinScreen({super.key, required this.arguments});

  final ForgotPinArguments arguments;

  @override
  Widget build(BuildContext context) {
    return CreateNewPin(arguments: arguments);
  }
}

class CreateNewPin extends StatefulWidget {
  const CreateNewPin({super.key, required this.arguments});

  final ForgotPinArguments arguments;

  @override
  State<CreateNewPin> createState() => _CreateNewPinState();
}

class _CreateNewPinState extends State<CreateNewPin> {
  final TextEditingController _controller = TextEditingController();

  String firstValue = "";
  bool isRepeat = false;
  bool loading = false;
  bool isPinNotMatch = false;
  bool pinUpdated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: TextHeading2(
                            !isRepeat
                                ? "Buat PIN Baru"
                                : "Masukan Ulang PIN Baru",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const TextBodyM(
                          "Pastikan PIN baru ini mudah kamu ingat.",
                          color: TColors.neutralDarkMedium,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  if (!loading && !pinUpdated)
                    DottedPin(
                      length: 6,
                      controller: _controller,
                      onCompleted: (value) async {
                        if (isRepeat) {
                          setState(() {
                            loading = true;
                          });

                          await Future.delayed(Duration(seconds: 1));

                          if (value != firstValue) {
                            setState(() {
                              isPinNotMatch = true;
                              loading = false;
                            });
                            _controller.clear();
                            return;
                          }

                          setState(() {
                            isPinNotMatch = false;
                            isRepeat = false;
                          });

                          Navigator.pushNamed(
                            context,
                            "/employee/forgot/input_otp",
                            arguments: ForgotPinArguments(
                              phoneNumber: widget.arguments.phoneNumber,
                              pin: value,
                            ),
                          );

                          // context
                          //     .read<OwnerCubit>()
                          //     .updatePIN(UpdatePinDto(
                          //       token: token,
                          //       pin: value,
                          //     ));

                          _controller.clear();

                          setState(() {
                            loading = false;
                          });
                        } else {
                          setState(() {
                            loading = true;
                          });

                          await Future.delayed(Duration(seconds: 1));

                          setState(() {
                            firstValue = value;
                            isRepeat = true;
                            loading = false;
                          });

                          _controller.clear();
                        }
                      },
                    ),
                  if (pinUpdated)
                    Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        color: TColors.success,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: UiIcons(
                          TIcons.check,
                          size: 24,
                          color: TColors.neutralLightLightest,
                        ),
                      ),
                    ),
                  if (loading)
                    const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(TColors.primary),
                      ),
                    ),
                  if (isPinNotMatch && !loading)
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        "Masukan PIN yang sama dengan sebelumnya.",
                        style: GoogleFonts.inter(
                          fontSize: TSizes.fontSizeBodyS,
                          color: TColors.error,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: NumberPad(
              controller: _controller,
              maxLength: 6,
              isShowForgot: false,
            ),
          ),
        ],
      ),
    );
  }
}
