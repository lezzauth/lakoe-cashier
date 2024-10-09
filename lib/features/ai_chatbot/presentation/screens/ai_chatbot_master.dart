import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/ai_chatbot/application/cubit/whatsapp/whatsapp_auth_cubit.dart';
import 'package:point_of_sales_cashier/features/ai_chatbot/application/cubit/whatsapp/whatsapp_auth_state.dart';
import 'package:point_of_sales_cashier/features/ai_chatbot/application/cubit/whatsapp/whatsapp_session_cubit.dart';
import 'package:point_of_sales_cashier/features/ai_chatbot/application/cubit/whatsapp/whatsapp_session_state.dart';
import 'package:point_of_sales_cashier/features/ai_chatbot/presentation/widgets/add_customer_service.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
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
  late WhatsappSessionCubit whatsappSessionCubit;

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

    whatsappSessionCubit = context.read<WhatsappSessionCubit>();
  }

  @override
  void dispose() {
    whatsappSessionCubit.stopFetch();

    super.dispose();
  }

  Widget _buildCustomerService(WASessionModel session) {
    if (session.status == "SCAN_QR_CODE") {
      return AddCustomerService();
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
          if (session.me != null)
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

                      AuthReady authState =
                          context.read<AuthCubit>().state as AuthReady;

                      WhatsappAuthState whatsappAuthState =
                          context.read<WhatsappAuthCubit>().state;

                      if (state.session.status == 'SCAN_QR_CODE' &&
                          whatsappAuthState is WhatsappAuthInitial) {
                        context.read<WhatsappAuthCubit>().getCode(
                              WAAuthRequestCodeDto(
                                phoneNumber: authState.profile.phoneNumber,
                              ),
                            );
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
