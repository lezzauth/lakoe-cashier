import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lakoe_pos/common/widgets/buttons/tertiary_button.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/on_boarding/on_boarding_cubit.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/on_boarding/on_boarding_state.dart';
import 'package:lakoe_pos/features/authentication/data/arguments/otp_input_argument.dart';
import 'package:lakoe_pos/features/authentication/presentation/on_boarding/screens/mobile/mobile_on_boarding.dart';
import 'package:lakoe_pos/features/authentication/presentation/on_boarding/screens/tablet/tablet_on_boarding.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:logman/logman.dart';

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

  Future<void> _sendEmail() async {
    String? phoneNumber = PhoneNumberFormatter.formatForDisplay(
        _formKey.currentState?.fields["phoneNumber"]?.value);

    final Email email = Email(
      body: 'Halo Tim Support Lakoe,\n\n'
          'Saya ingin mengajukan permohonan untuk membatalkan proses penghapusan akun saya di aplikasi Lakoe. '
          'Berikut informasi akun yang terdaftar:\n\n'
          '- Nomor Telepon: $phoneNumber\n\n'
          'Mohon konfirmasi jika permohonan ini telah diproses. Terima kasih atas perhatian dan bantuannya.\n\n'
          'Salam,\nPengguna Lakoe',
      subject: 'Permohonan Pembatalan Penghapusan Akun Lakoe',
      recipients: ["support@lakoe.id"],
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'Email berhasil dikirim!';
    } catch (error) {
      Logman.instance.error(error);
      platformResponse = error.toString();
    }

    if (!mounted) return;
    Navigator.pop(context);
    CustomToast.show(platformResponse, position: "bottom");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {
          if (state is OnBoardingActionFailure) {
            if (state.error.contains("429")) {
              CustomToast.show(
                "Tunggu 10 detik lagi, ya!",
                position: "bottom",
              );
            } else if (state.error.contains("delete")) {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CustomBottomsheet(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UiIcons(
                                  TIcons.shieldKeyhole,
                                  size: 40,
                                  fit: BoxFit.contain,
                                  color: TColors.primary,
                                ),
                                SizedBox(height: 16),
                                TextHeading3(
                                  "Proses Penghapusan Akun",
                                  color: TColors.neutralDarkDark,
                                ),
                                SizedBox(height: 4),
                                TextBodyM(
                                  "Nomor ini sedang dalam proses penghapusan akun. Jika ingin membatalkan proses ini, silakan hubungi tim Support Lakoe atau gunakan nomor lain untuk melanjutkan login.",
                                  color: TColors.neutralDarkDark,
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TertiaryButton(
                                    onPressed: () {
                                      _sendEmail();
                                    },
                                    child: TextActionL("Hubungi CS"),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: TextActionL("Oke, Paham"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              Logman.instance.error(state.error);
            }
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
