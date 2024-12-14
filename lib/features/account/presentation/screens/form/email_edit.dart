import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
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
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:owner_repository/owner_repository.dart';

class EmailEditScreen extends StatefulWidget {
  const EmailEditScreen({super.key});

  @override
  State<EmailEditScreen> createState() => _EmailEditScreenState();
}

class _EmailEditScreenState extends State<EmailEditScreen> {
  late String token;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _showClearIcon = true;

  @override
  void initState() {
    super.initState();
    CustomToast.init(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    setState(() {
      token = args!['token'];
    });
  }

  Future<void> _onSubmit() async {
    FocusScope.of(context).unfocus();

    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) {
      return;
    }
    dynamic value = _formKey.currentState?.value;

    context.read<OwnerCubit>().updateEmail(UpdateEmailDto(
          token: token,
          email: value['email'],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String field = args!.keys.first;
    final String value = args[field];

    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context, true);
        });
      },
      child: BlocListener<OwnerCubit, OwnerState>(
        listener: (context, state) async {
          if (state is OwnerActionSuccess) {
            CustomToast.showWithContext(
              context,
              "Email berhasil diubah",
              duration: 1,
              backgroundColor: TColors.success,
            );
            await Future.delayed(Duration(seconds: 1));
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
                          context.read<OwnerCubit>().getOwner();
                        },
                      ),
                    ),
                  );
                },
              );
            } else {
              CustomToast.showWithContext(
                context,
                "Email gagal diubah",
                duration: 1,
                backgroundColor: TColors.error,
              );
              await Future.delayed(Duration(seconds: 1));
              Navigator.pop(context, true);
            }
          }
        },
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
                                "Ubah Email",
                                color: TColors.neutralDarkDark,
                              ),
                              TextBodyM(
                                "Silahkan masukkan email baru untuk menggantikan email sebelumnya.",
                                color: TColors.neutralDarkDark,
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          FormBuilderTextField(
                            name: "email",
                            initialValue: value,
                            decoration: InputDecoration(
                              hintText: "Contoh: warmindo@gmail.com",
                              suffixIcon: _showClearIcon
                                  ? IconButton(
                                      icon: UiIcons(
                                        TIcons.close,
                                        size: 12,
                                      ),
                                      onPressed: () {
                                        _formKey.currentState?.fields['email']
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
                            keyboardType: TextInputType.emailAddress,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.conditional((value) {
                                if (value == null) return false;
                                if (value.isEmpty) return false;
                                return true;
                              },
                                  FormBuilderValidators.email(
                                    errorText: ErrorTextStrings.email(),
                                  ))
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: TColors.neutralLightMedium,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: state is OwnerActionInProgress
                          ? null
                          : () {
                              // showModalBottomSheet(
                              //   context: context,
                              //   builder: (context) {
                              //     return CustomBottomsheet(
                              //       child: GeneralInformation(
                              //         imageSrc: TImages.generalIllustration,
                              //         title: "Cek email kamu untuk verifikasi",
                              //         description:
                              //             "Silahkan cek kontak masuk warmindo@gmail.com. Email hanya berlaku selamam 15 menit, lebih dari itu kamu perlu verifikasi ulang.",
                              //         onRequest: () {
                              //           Navigator.pop(context);
                              //           showModalBottomSheet(
                              //             context: context,
                              //             builder: (context) {
                              //               return CustomBottomsheet(
                              //                 child: GeneralInformation(
                              //                   imageSrc: TImages.successIllustration,
                              //                   title: "Berhasil verifikasi email baru",
                              //                   description:
                              //                       "Email kamu berhasil terverifikasi dan aktif untuk bisa digunakan.",
                              //                   onRequest: () {
                              //                     Navigator.pop(context);
                              //                     Navigator.pop(context);
                              //                   },
                              //                   actionTitle: "Selesai",
                              //                 ),
                              //               );
                              //             },
                              //           );
                              //         },
                              //         actionTitle: "Buka Aplikasi Email",
                              //       ),
                              //     );
                              //   },
                              // );

                              _onSubmit();
                            },
                      child: state is OwnerActionInProgress
                          ? SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                              ),
                            )
                          : TextActionL("Simpan"),
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
