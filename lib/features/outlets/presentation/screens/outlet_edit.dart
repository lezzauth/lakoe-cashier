import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/form/form_label.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/outlets/application/outlet_cubit.dart';
import 'package:lakoe_pos/features/outlets/application/outlet_state.dart';
import 'package:lakoe_pos/features/outlets/presentation/widgets/image_picker_field.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:responsive_framework/responsive_framework.dart';

class OutletEditScreen extends StatefulWidget {
  const OutletEditScreen({super.key});

  @override
  State<OutletEditScreen> createState() => _OutletEditScreenState();
}

class _OutletEditScreenState extends State<OutletEditScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  OutletModel? arg;

  final List<String> businessTypes = [
    "Kuliner",
    "Toko Online",
    "Retail",
    "Lainnya"
  ];

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

  Color getColor(int index) {
    colors;
    return Color(colors[index % colors.length]);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)!.settings.arguments as OutletModel;
      setState(() {
        arg = args;
      });

      if (args.color != null) {
        int argColorInt =
            int.parse(args.color!.replaceFirst("0x", ""), radix: 16);
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
    });
  }

  onSubmit() {
    bool isFormValid = formKey.currentState?.saveAndValidate() ?? false;

    if (!isFormValid) {
      if (kDebugMode) {
        print("Is valid form: $isFormValid");
      }
    }

    dynamic outletValue = formKey.currentState?.value;
    ImagePickerValue? image = outletValue["image_logo"] as ImagePickerValue;

    String colorHex = '0x${selectedColor.toRadixString(16).toUpperCase()}';

    if (colorHex != "0x10000000") {
      context.read<OutletCubit>().update(
            image.file,
            UpdateOutletDto(
              name: outletValue["outletName"],
              address: outletValue["outletAddress"],
              type: outletValue["outletType"],
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
        if (state is OutletActionSuccess) {
          Navigator.pop(context, true);
        }
      },
      child: BlocBuilder<OutletCubit, OutletState>(builder: (context, state) {
        return Scaffold(
          appBar: CustomAppbar(
            title: "Profil Bisnis",
            actions: [
              TextButton(
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
              )
            ],
          ),
          body: SingleChildScrollView(
            child: FormBuilder(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FormLabel("Nama Usaha"),
                            FormBuilderTextField(
                              name: "outletName",
                              initialValue: arg!.name,
                              decoration: const InputDecoration(
                                hintText: "Contoh: Warung Madura",
                              ),
                              validator: FormBuilderValidators.required(
                                  errorText: ErrorTextStrings.required(
                                      name: "Nama Usaha")),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FormLabel("Jenis Usaha"),
                              FormBuilderField(
                                name: "outletType",
                                initialValue: arg!.type,
                                builder: (field) {
                                  return Wrap(
                                    alignment: WrapAlignment.start,
                                    spacing: 8.0,
                                    children: businessTypes.map((type) {
                                      bool selected = type == field.value;

                                      return InputChip(
                                        label: selected
                                            ? TextHeading4(
                                                type,
                                                color: TColors.primary,
                                              )
                                            : TextBodyM(type),
                                        selected: selected,
                                        onPressed: () {
                                          field.didChange(type);
                                        },
                                      );
                                    }).toList(),
                                  );
                                },
                                validator: FormBuilderValidators.required(
                                    errorText: ErrorTextStrings.required(
                                        name: "Jenis Usaha")),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FormLabel("Alamat"),
                            FormBuilderTextField(
                              name: "outletAddress",
                              initialValue: arg!.address,
                              decoration: const InputDecoration(
                                hintText:
                                    "Masukan alamat dengan format [Kecamatan], [Kabupaten], [Provinsi]\nContoh: Banjarsari, Solo, Jawa Tengah",
                              ),
                              maxLines: 3,
                              validator: FormBuilderValidators.required(
                                  errorText: ErrorTextStrings.required(
                                      name: "Alamat")),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: TColors.neutralLightMedium,
                    height: 4,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FormLabel(
                              "Logo Usaha/Bisnis",
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
                                                      ColorPickerType.wheel:
                                                          true,
                                                    },
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: SizedBox(
                                                      height: 48,
                                                      child: OutlinedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child:
                                                            const TextActionL(
                                                                "Pilih Warna"),
                                                      ),
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
                                      child:
                                          selectedColor == getColor(index).value
                                              ? Center(
                                                  child: UiIcons(
                                                    TIcons.check,
                                                    color: TColors
                                                        .neutralLightLightest,
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
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
