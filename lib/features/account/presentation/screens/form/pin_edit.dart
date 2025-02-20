import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/error_display/error_display.dart';
import 'package:lakoe_pos/common/widgets/form/dotted_pin.dart';
import 'package:lakoe_pos/common/widgets/form/number_pad.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/general_information.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_cubit.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:owner_repository/owner_repository.dart';

class PinEditScreen extends StatefulWidget {
  const PinEditScreen({super.key});

  @override
  State<PinEditScreen> createState() => _PinEditScreenState();
}

class _PinEditScreenState extends State<PinEditScreen> {
  final TextEditingController _controller = TextEditingController();
  late String token;
  String firstValue = "";
  bool isRepeat = false;
  bool isLoading = false;
  bool isPinNotMatch = false;
  bool pinUpdated = false;

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

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context, true);
        });
      },
      child: BlocListener<OwnerCubit, OwnerState>(
        listener: (context, state) async {
          if (state is OwnerActionSuccess) {
            setState(() {
              pinUpdated = true;
              isLoading = false;
            });
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
                    child: GeneralInformation(
                      imageSrc: TImages.successIllustration,
                      title: "PIN kamu berhasil diubah",
                      description:
                          "Saat ini kamu harus menggunakan PIN terbaru setiap kali mau akses aplikasi.",
                      onAction: () {
                        Navigator.pop(context, true);
                        Navigator.pop(context, true);
                      },
                      actionTitle: "Selesai",
                    ),
                  ),
                );
              },
            );
            context.read<OwnerCubit>().getOwner();
          } else if (state is OwnerActionFailure) {
            setState(() {
              isLoading = false;
            });
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
                        title: "Yah, terjadi kesalahan!",
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
                "PIN gagal diubah",
                duration: 1,
                backgroundColor: TColors.error,
              );
              await Future.delayed(Duration(seconds: 1));

              Navigator.pop(context, true);
              context.read<OwnerCubit>().getOwner();
            }
          }
        },
        child: BlocBuilder<OwnerCubit, OwnerState>(builder: (context, state) {
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
                                "Silahkan buat PIN baru yang berbeda dengan PIN sebelumnya.",
                                color: TColors.neutralDarkMedium,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        if (!isLoading && !pinUpdated)
                          DottedPin(
                            length: 6,
                            controller: _controller,
                            onCompleted: (value) async {
                              if (isRepeat) {
                                setState(() {
                                  isLoading = true;
                                });

                                await Future.delayed(Duration(seconds: 1));

                                if (value != firstValue) {
                                  setState(() {
                                    isPinNotMatch = true;
                                    isLoading = false;
                                  });
                                  _controller.clear();
                                  return;
                                }

                                setState(() {
                                  isPinNotMatch = false;
                                });

                                context
                                    .read<OwnerCubit>()
                                    .updatePIN(UpdatePinDto(
                                      token: token,
                                      pin: value,
                                    ));

                                _controller.clear();
                              } else {
                                setState(() {
                                  isLoading = true;
                                });

                                await Future.delayed(Duration(seconds: 1));

                                setState(() {
                                  firstValue = value;
                                  isRepeat = true;
                                  isLoading = false;
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
                        if (isLoading)
                          const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  TColors.primary),
                            ),
                          ),
                        if (isPinNotMatch && !isLoading)
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
        }),
      ),
    );
  }
}
