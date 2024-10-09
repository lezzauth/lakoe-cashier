import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/ai_chatbot/application/cubit/whatsapp/whatsapp_auth_cubit.dart';
import 'package:point_of_sales_cashier/features/ai_chatbot/application/cubit/whatsapp/whatsapp_auth_state.dart';
import 'package:point_of_sales_cashier/features/ai_chatbot/application/cubit/whatsapp/whatsapp_session_cubit.dart';
import 'package:point_of_sales_cashier/features/ai_chatbot/application/cubit/whatsapp/whatsapp_session_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:whatsapp_repository/whatsapp_repository.dart';

class AIChatbotMasterScreen extends StatelessWidget {
  const AIChatbotMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WhatsappAuthCubit(),
      child: AIChatbotMaster(),
    );
  }
}

class AIChatbotMaster extends StatefulWidget {
  const AIChatbotMaster({super.key});

  @override
  State<AIChatbotMaster> createState() => _AIChatbotMasterState();
}

class _AIChatbotMasterState extends State<AIChatbotMaster> {
  late WhatsappSessionCubit sessionCubit;

  Future<void> _onInit() async {
    context.read<WhatsappSessionCubit>().fetchSession();
  }

  @override
  void initState() {
    super.initState();

    _onInit();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    sessionCubit = context.read<WhatsappSessionCubit>();
  }

  @override
  void dispose() {
    sessionCubit.stopFetch();

    super.dispose();
  }

  Widget _buildCustomerService(WASessionModel session) {
    if (session.status == "SCAN_QR_CODE") {
      return BlocBuilder<WhatsappAuthCubit, WhatsappAuthState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: const TextHeading2(
                    "Lengkapi data dulu, yuk!",
                  ),
                ),
                TextBodyM(
                  "Scan QR Code dibawah melalui WhatsApp customer service yang akan ditambahkan, tutorial (lihat disini)",
                  color: TColors.neutralDarkMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    switch (state) {
                      WhatsappAuthQRLoadSuccess(:final response) => QrImageView(
                          data: response.value,
                          size: 170,
                        ),
                      WhatsappAuthQRLoadFailure(:final error) => TextBodyS(
                          error,
                          color: TColors.error,
                        ),
                      _ => const SizedBox(
                          height: 32,
                          width: 32,
                          child: CircularProgressIndicator(
                            color: TColors.info,
                          ),
                        ),
                    }
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    if (session.status == "WORKING") {
      return Row(
        children: [
          SvgPicture.asset(
            TImages.contactAvatar,
            height: 46,
            width: 46,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: TextHeading3(
                    '${session.me!.pushName} (CS)',
                    color: TColors.neutralDarkDark,
                  ),
                ),
                TextBodyS(
                  session.me!.id.split("@")[0],
                  color: TColors.neutralDarkLightest,
                )
              ],
            ),
          )
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [const CircularProgressIndicator()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "AI Chatbot",
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  BlocConsumer<WhatsappSessionCubit, WhatsappSessionState>(
                    listener: (context, state) {
                      if (state is! WhatsappSessionLoadSuccess) return;

                      if (state.session.status == 'SCAN_QR_CODE') {
                        context.read<WhatsappAuthCubit>().getQR();
                      }
                    },
                    builder: (context, state) => switch (state) {
                      WhatsappSessionLoadSuccess(:final session) =>
                        _buildCustomerService(session),
                      _ => const SizedBox(
                          height: 32,
                          width: 32,
                          child: CircularProgressIndicator(),
                        ),
                    },
                  ),
                  // CheckItem(
                  //   checked: isProductCompleted,
                  //   title: "Satu data produk",
                  //   onTap:
                  //       isProductCompleted ? null : _onGoToCreateProduct,
                  // ),
                  // SizedBox(height: 8),
                  // CheckItem(
                  //   checked: isBankAccountCompleted,
                  //   title: "Satu rekening bank",
                  //   onTap: isBankAccountCompleted
                  //       ? null
                  //       : _onGoToCreateBankAccount,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
