import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_cubit.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:owner_repository/owner_repository.dart';

class PhoneNumberEditScreen extends StatefulWidget {
  const PhoneNumberEditScreen({super.key});

  @override
  State<PhoneNumberEditScreen> createState() => _PhoneNumberEditScreenState();
}

class _PhoneNumberEditScreenState extends State<PhoneNumberEditScreen> {
  late String token;
  late String originalPhoneNumber;
  late String phoneNumber;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isFormValid = false;
  bool _showClearIcon = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String field = args!.keys.first;
    String value = args[field];

    final formattedValue = formatterPhoneNumber(value);
    originalPhoneNumber = formattedValue;

    setState(() {
      token = args['token'];
      phoneNumber = formattedValue;
    });
  }

  String formatterPhoneNumber(String value) {
    if (value.startsWith('+628')) {
      value = value.replaceFirst('+628', '8');
    } else if (value.startsWith('628')) {
      value = value.replaceFirst('628', '8');
    } else if (value.startsWith('08')) {
      value = value.replaceFirst('08', '8');
    }

    value = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (value.length > 10) {
      value =
          '${value.substring(0, 3)}-${value.substring(3, 7)}-${value.substring(7, 11)}';
    } else if (value.length > 7) {
      value =
          '${value.substring(0, 3)}-${value.substring(3, 7)}-${value.substring(7)}';
    } else if (value.length > 3) {
      value = '${value.substring(0, 3)}-${value.substring(3)}';
    }

    return value;
  }

  Future<void> _onSubmit() async {
    FocusScope.of(context).unfocus();
    _isFormValid = _formKey.currentState?.saveAndValidate() ?? false;

    if (!_isFormValid) {
      return;
    }

    String? newPhoneNumber =
        _formKey.currentState?.fields['phoneNumber']?.value;

    String formattedPhoneNumber = formatterPhoneNumber(newPhoneNumber ?? "");

    String phoneNumber =
        PhoneNumberFormatter.formatForRequest(newPhoneNumber ?? "");

    if (formattedPhoneNumber == originalPhoneNumber) {
      CustomToast.show(
        "Nomor WA tidak boleh sama.",
        backgroundColor: TColors.error,
        position: "center",
      );
      return;
    }

    context
        .read<OwnerCubit>()
        .requestOTP(RequestOTPDto(phoneNumber: phoneNumber));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context, true);
        });
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<OwnerCubit, OwnerState>(
            listener: (context, state) async {
              if (state is RequestFailure) {
                if (state.error.contains("too many")) {
                  CustomToast.show(
                    "Tunggu 10 detik lagi, ya!",
                    position: "center",
                  );
                }
              }

              if (state is RequestSuccess) {
                Navigator.pushNamed(context, "/account/edit/input_otp",
                    arguments: {
                      "otpData": RequestOTPRes(
                        id: state.res.id,
                        target: state.res.target,
                        type: state.res.type,
                        action: state.res.action,
                      ),
                      "token": token,
                    });
              }
            },
          ),
        ],
        child: BlocBuilder<OwnerCubit, OwnerState>(builder: (context, state) {
          return Scaffold(
            appBar: CustomAppbar(),
            body: FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextHeading2(
                                "Ubah Nomor WA",
                                color: TColors.neutralDarkDark,
                              ),
                              TextBodyM(
                                "Silahkan masukkan nomor WA baru untuk menggantikan nomor sebelumnya.",
                                color: TColors.neutralDarkDark,
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 48,
                                width: 85,
                                decoration: BoxDecoration(
                                  color: TColors.neutralLightLight,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: TColors.neutralLightDarkest,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Wrap(
                                    alignment: WrapAlignment.center,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    spacing: 8,
                                    direction: Axis.horizontal,
                                    children: [
                                      Image.asset(
                                        TImages.indoFlag,
                                        height: 20,
                                        width: 20,
                                      ),
                                      const TextHeading4("+62"),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: FormBuilderTextField(
                                  name: "phoneNumber",
                                  initialValue: phoneNumber,
                                  decoration: InputDecoration(
                                    hintText: "Masukan nomor WA",
                                    suffixIcon: _showClearIcon
                                        ? IconButton(
                                            icon: UiIcons(
                                              TIcons.close,
                                              size: 12,
                                            ),
                                            onPressed: () {
                                              _formKey.currentState
                                                  ?.fields['phoneNumber']
                                                  ?.didChange('');
                                            },
                                          )
                                        : null,
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      _showClearIcon = val?.isNotEmpty ?? false;
                                    });
                                  },
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [PhoneNumberFormatter()],
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.startsWith("8",
                                        errorText:
                                            "Nomor dimulai dengan angka 8"),
                                    FormBuilderValidators.maxLength(14,
                                        errorText: ErrorTextStrings.maxLength(
                                            maxLength: 14, isNumber: true)),
                                    FormBuilderValidators.minLength(9,
                                        errorText: ErrorTextStrings.minLength(
                                            minLength: 9, isNumber: true)),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: TColors.neutralLightMedium,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: state is RequestInProgress
                          ? null
                          : () {
                              _onSubmit();
                            },
                      child: state is RequestInProgress
                          ? SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                              ),
                            )
                          : TextActionL(
                              "Lanjut Verifikasi OTP",
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
