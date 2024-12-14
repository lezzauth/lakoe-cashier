import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_1.dart';
import 'package:lakoe_pos/features/ai_chatbot/application/cubit/whatsapp/whatsapp_auth_cubit.dart';
import 'package:lakoe_pos/features/ai_chatbot/application/cubit/whatsapp/whatsapp_auth_state.dart';
import 'package:lakoe_pos/features/ai_chatbot/presentation/widgets/common/instruction.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:whatsapp_repository/whatsapp_repository.dart';
import 'common/whatsapp_code.dart';

class AddCustomerService extends StatefulWidget {
  const AddCustomerService({super.key});

  @override
  State<AddCustomerService> createState() => _AddCustomerServiceState();
}

class _AddCustomerServiceState extends State<AddCustomerService> {
  bool isRepeat = false;
  DateTime countdownDate = DateTime.now();

  Future<void> _onRequestCode() async {
    AuthReady authState = context.read<AuthCubit>().state as AuthReady;

    context.read<WhatsappAuthCubit>().getCode(
          WAAuthRequestCodeDto(
            phoneNumber: authState.profile.phoneNumber,
          ),
        );

    setState(() {
      isRepeat = false;
      countdownDate = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WhatsappAuthCubit, WhatsappAuthState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: const TextHeading1(
                  "Tambahkan customer service",
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "Masukkan kode di telepon",
                  style: GoogleFonts.inter(
                    color: TColors.neutralDarkLight,
                    fontSize: TSizes.fontSizeBodyS,
                  ),
                ),
              ),
              Instruction(
                no: 1,
                text: RichText(
                  text: TextSpan(
                    text: "Buka WhatsApp di telepon Anda",
                    style: GoogleFonts.inter(
                      color: TColors.neutralDarkLight,
                      fontSize: TSizes.fontSizeBodyS,
                    ),
                  ),
                ),
              ),
              Instruction(
                no: 2,
                text: RichText(
                  text: TextSpan(
                    text: "Ketuk ",
                    style: GoogleFonts.inter(
                      color: TColors.neutralDarkLight,
                      fontSize: TSizes.fontSizeBodyS,
                    ),
                    children: [
                      TextSpan(
                        text: "Menu",
                        style: GoogleFonts.inter(
                          color: TColors.neutralDarkLight,
                          fontSize: TSizes.fontSizeBodyS,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: " di Android, atau ",
                        style: GoogleFonts.inter(
                          color: TColors.neutralDarkLight,
                          fontSize: TSizes.fontSizeBodyS,
                        ),
                      ),
                      TextSpan(
                        text: "Pengaturan",
                        style: GoogleFonts.inter(
                          color: TColors.neutralDarkLight,
                          fontSize: TSizes.fontSizeBodyS,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: " di Iphone",
                        style: GoogleFonts.inter(
                          color: TColors.neutralDarkLight,
                          fontSize: TSizes.fontSizeBodyS,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Instruction(
                no: 3,
                text: RichText(
                  text: TextSpan(
                    text: "Ketuk ",
                    style: GoogleFonts.inter(
                      color: TColors.neutralDarkLight,
                      fontSize: TSizes.fontSizeBodyS,
                    ),
                    children: [
                      TextSpan(
                        text: "Perangkat tertaut",
                        style: GoogleFonts.inter(
                          color: TColors.neutralDarkLight,
                          fontSize: TSizes.fontSizeBodyS,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: " lalu ",
                        style: GoogleFonts.inter(
                          color: TColors.neutralDarkLight,
                          fontSize: TSizes.fontSizeBodyS,
                        ),
                      ),
                      TextSpan(
                        text: "Tautkan perangkat",
                        style: GoogleFonts.inter(
                          color: TColors.neutralDarkLight,
                          fontSize: TSizes.fontSizeBodyS,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Instruction(
                no: 4,
                text: RichText(
                  text: TextSpan(
                    text: "Ketuk ",
                    style: GoogleFonts.inter(
                      color: TColors.neutralDarkLight,
                      fontSize: TSizes.fontSizeBodyS,
                    ),
                    children: [
                      TextSpan(
                        text: "Tautkan dengan nomor telepon saja,",
                        style: GoogleFonts.inter(
                          color: TColors.neutralDarkLight,
                          fontSize: TSizes.fontSizeBodyS,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: " lalu masukkan kode ini di telepon Anda",
                        style: GoogleFonts.inter(
                          color: TColors.neutralDarkLight,
                          fontSize: TSizes.fontSizeBodyS,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    switch (state) {
                      WhatsappAuthRequestCodeSuccess(:final response) =>
                        Expanded(
                          child: WhatsappCode(
                            code: response.code,
                          ),
                        ),
                      _ => const CircularProgressIndicator(),
                    }
                  ],
                ),
              ),
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
                      onPressed: _onRequestCode,
                      child: const TextActionL(
                        "Kirim Ulang Kode",
                        color: TColors.primary,
                      ),
                    )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
