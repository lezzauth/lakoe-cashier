import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/form/dotted_pin.dart';
import 'package:lakoe_pos/common/widgets/form/number_pad.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';

class EditAcccountPinScreen extends StatefulWidget {
  const EditAcccountPinScreen({super.key});

  @override
  State<EditAcccountPinScreen> createState() => _EditAcccountPinScreenState();
}

class _EditAcccountPinScreenState extends State<EditAcccountPinScreen> {
  final TextEditingController _pinController = TextEditingController();

  late String routeName;
  late String currentValue;

  String messsageError = "PIN Salah. Coba Lagi.";
  bool checkPIN = false;
  bool isPinWrong = false;

  @override
  void initState() {
    super.initState();
    _pinController.addListener(() {
      if (isPinWrong) {
        setState(() {
          isPinWrong = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final String field = args!.keys.first;
    final String value = args[field];

    setState(() {
      routeName = args['routeName'];
      currentValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is GenerateTokenInProgress) {
          setState(() {
            checkPIN = true;
            isPinWrong = false;
          });
        } else if (state is GenerateTokenFailure) {
          _pinController.clear();
          if (state.error.contains("denied")) {
            setState(() {
              checkPIN = false;
              isPinWrong = true;
              messsageError = "PIN Salah. Coba Lagi.";
            });
          } else {
            setState(() {
              checkPIN = false;
              isPinWrong = true;
              messsageError = "Terjadi kesalahan. Coba lagi.";
            });
          }
        } else if (state is GenerateTokenSuccess) {
          Navigator.pushNamed(context, routeName, arguments: {
            'field': currentValue,
            'token': state.res.token,
          });
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 40, top: 56),
                        child: Column(
                          children: [
                            UiIcons(
                              TIcons.lock,
                              size: 32,
                              color: TColors.neutralLightDarkest,
                            ),
                            SizedBox(height: 20),
                            Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: const TextHeading3(
                                "Masukan PIN saat ini",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const TextBodyM(
                              "Untuk alasan keamanan data diri kamu.",
                              color: TColors.neutralDarkMedium,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      if (checkPIN && !isPinWrong)
                        const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(TColors.primary),
                          ),
                        ),
                      if (!checkPIN || isPinWrong)
                        DottedPin(
                          length: 6,
                          controller: _pinController,
                          onCompleted: (value) {
                            setState(() {
                              checkPIN = false;
                              isPinWrong = false;
                            });

                            context.read<AuthCubit>().generateToken(
                                  GenerateTokenDto(pin: value),
                                );
                          },
                        ),
                      if (isPinWrong)
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          child: Text(
                            messsageError,
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
                  controller: _pinController,
                  maxLength: 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
