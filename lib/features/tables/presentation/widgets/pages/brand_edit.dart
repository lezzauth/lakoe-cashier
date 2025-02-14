import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/form/form_label.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/features/outlets/application/outlet_cubit.dart';
import 'package:lakoe_pos/features/outlets/application/outlet_state.dart';
import 'package:lakoe_pos/features/outlets/presentation/widgets/image_picker_field.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BrandEditScreen extends StatefulWidget {
  const BrandEditScreen({super.key});

  @override
  State<BrandEditScreen> createState() => _BrandEditScreenState();
}

class _BrandEditScreenState extends State<BrandEditScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  OutletModel? arg;

  bool isCustomColor = false;
  int selectedColor = 0xFFFD6E00;

  List<int> colors = [
    0xFFFD6E00,
    0xFFEF4444,
    0xFFF59E0B,
    0xFF84CC16,
    0xFF10B981,
    0xFF06B6D4,
    0xFF3B82F6,
    0xFF8B5CF6,
    0xFFEC4899,
  ];

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  void _onInit() {
    context.read<OutletCubit>().init();
  }

  Color getColor(int index) {
    colors;
    return Color(colors[index % colors.length]);
  }

  onSubmit() {
    bool isFormValid = formKey.currentState?.saveAndValidate() ?? false;

    if (!isFormValid) return;

    dynamic outletValue = formKey.currentState?.value;
    ImagePickerValue? image = outletValue["image_logo"] as ImagePickerValue;

    String colorHex = '0x${selectedColor.toRadixString(16).toUpperCase()}';

    if (colorHex != "0x10000000") {
      context.read<OutletCubit>().update(
            image.file,
            UpdateOutletDto(
              name: arg!.name,
              address: arg!.address,
              type: arg!.type,
              color: colorHex,
            ),
          );
    } else {
      CustomToast.show(
        "Kamu harus pilih warna dulu, ya!",
        duration: 2,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double circleSize = ResponsiveBreakpoints.of(context).smallerThan(TABLET)
        ? screenWidth / 5 - 16
        : screenWidth / 10 - 16;

    return BlocListener<OutletCubit, OutletState>(
      listener: (context, state) {
        if (state is OutletLoadSuccess) {
          setState(() {
            arg = state.outlet;
          });

          if (state.outlet.color != null) {
            int argColorInt = int.parse(
                state.outlet.color!.replaceFirst("0x", ""),
                radix: 16);
            bool isColorInList = colors.contains(argColorInt);

            setState(() {
              selectedColor = argColorInt;
              isCustomColor = !isColorInList;
            });
          } else {
            setState(() {
              selectedColor = 0x10000000;
            });
          }
        }

        if (state is OutletActionSuccess) {
          Navigator.pop(context, true);
        }
      },
      child: Scaffold(
        appBar: CustomAppbar(
          title: "Logo & Warna",
          actions: [
            BlocBuilder<OutletCubit, OutletState>(builder: (context, state) {
              return TextButton(
                onPressed: () => onSubmit(),
                child: state is OutletActionInProgress
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(),
                      )
                    : TextActionL(
                        "SIMPAN",
                        color: TColors.primary,
                      ),
              );
            })
          ],
        ),
        body: BlocBuilder<OutletCubit, OutletState>(builder: (context, state) {
          if (state is OutletLoadSuccess || state is OutletActionInProgress) {
            return SingleChildScrollView(
              child: FormBuilder(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormLabel(
                            "Logo Brand",
                            description:
                                "Logo ini akan digunakan untuk keperluan branding.",
                          ),
                          SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FormBuilderField<ImagePickerValue>(
                                name: "image_logo",
                                initialValue: arg!.logo!.isEmpty
                                    ? ImagePickerValue()
                                    : ImagePickerValue(url: arg!.logo),
                                builder: (field) {
                                  return Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                        child: Image.asset(
                                          TImages.checkeredBg,
                                          fit: BoxFit.cover,
                                          width: 120,
                                          height: 120,
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: ImagePickerField(
                                          bgColor: Color(selectedColor),
                                          value: field.value,
                                          onChanged: field.didChange,
                                          errorText: field.errorText ?? "",
                                          onError: (errorText) {
                                            formKey.currentState
                                                ?.fields["image_logo"]
                                                ?.invalidate(errorText);
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: TColors.neutralLightLight,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: TextBodyM(
                                    "• Berwarna putih\n• Logo tanpa background\n• Rasio foto 1:1 (Kotak)\n• Format harus .jpg .jpeg .png \n• Ukuran min. 300x300px",
                                    color: TColors.neutralDarkDark,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormLabel(
                            "Warna Brand",
                            description:
                                "Warna ini akan pakai sebagai warna utama di QR Meja, toko online dan kebutuhan branding lainnya.",
                          ),
                          SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: List.generate(10, (index) {
                              if (index == 9) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: TColors.neutralLightLight,
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        useSafeArea: true,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return CustomBottomsheet(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 20,
                                                    vertical: 16,
                                                  ),
                                                  child: const TextHeading2(
                                                    "Pilih warna brand bisnis kamu",
                                                  ),
                                                ),
                                                ColorPicker(
                                                  color: Color(selectedColor),
                                                  columnSpacing: 12,
                                                  padding: EdgeInsets.all(20),
                                                  wheelDiameter: screenWidth,
                                                  wheelWidth: 12,
                                                  wheelHasBorder: true,
                                                  onColorChanged:
                                                      (Color value) {
                                                    setState(() {
                                                      isCustomColor = true;
                                                      selectedColor =
                                                          value.value;
                                                    });
                                                  },
                                                  pickersEnabled: {
                                                    ColorPickerType.primary:
                                                        false,
                                                    ColorPickerType.accent:
                                                        false,
                                                    ColorPickerType.wheel: true,
                                                  },
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(20),
                                                  child: OutlinedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: TextActionL(
                                                        "Pilih Warna"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: Container(
                                    height: circleSize,
                                    width: circleSize,
                                    decoration: BoxDecoration(
                                      color: isCustomColor
                                          ? Color(selectedColor)
                                          : TColors.neutralLightMedium,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: UiIcons(
                                        isCustomColor
                                            ? TIcons.check
                                            : TIcons.pipette,
                                        color: isCustomColor
                                            ? TColors.neutralLightLightest
                                            : TColors.neutralDarkDark,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: TColors.neutralLightLight,
                                  onTap: () {
                                    setState(() {
                                      isCustomColor = false;
                                      selectedColor = getColor(index).value;
                                    });
                                  },
                                  child: Container(
                                    height: circleSize,
                                    width: circleSize,
                                    decoration: BoxDecoration(
                                      color: getColor(index),
                                      shape: BoxShape.circle,
                                    ),
                                    child: selectedColor ==
                                            getColor(index).value
                                        ? Center(
                                            child: UiIcons(
                                              TIcons.check,
                                              color:
                                                  TColors.neutralLightLightest,
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                  ),
                                );
                              }
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is OutletLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SizedBox.shrink();
          }
        }),
      ),
    );
  }
}
