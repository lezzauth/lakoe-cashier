import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/bottomsheets/vote_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/form/form_label.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_cubit.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_state.dart';
import 'package:lakoe_pos/features/products/application/cubit/product_master/form/product_form_cubit.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/forms/field/category_field.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/forms/field/image_picker_field.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:lakoe_pos/utils/helpers/vote_helper.dart';

class ProductInformationForm extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  final Map<String, dynamic> initialValue;
  final Function()? onChanged;

  const ProductInformationForm({
    super.key,
    required this.formKey,
    this.initialValue = const <String, dynamic>{},
    this.onChanged,
  });

  @override
  State<ProductInformationForm> createState() => _ProductInformationFormState();
}

class _ProductInformationFormState extends State<ProductInformationForm>
    with AutomaticKeepAliveClientMixin<ProductInformationForm> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _modalController = TextEditingController();

  final CurrencyTextInputFormatter _priceFormatter =
      CurrencyTextInputFormatter.currency(
    locale: "id_ID",
    symbol: "Rp",
    decimalDigits: 0,
  );
  final CurrencyTextInputFormatter _modalFormatter =
      CurrencyTextInputFormatter.currency(
    locale: "id_ID",
    symbol: "Rp",
    decimalDigits: 0,
  );

  final List<LabelValue> _availability = [
    const LabelValue(label: "Tersedia", value: "AVAILABLE"),
    const LabelValue(label: "Tidak Tersedia", value: "UNAVAILABLE"),
  ];

  // final List<Map<String, String>> _units = [
  //   {"id": "serving", "name": "Porsi"},
  //   {"id": "cup", "name": "Cup/Gelas/Cangkir"},
  //   {"id": "pcs", "name": "Pcs"},
  //   {"id": "bottle", "name": "Botol"},
  //   {"id": "slice", "name": "Slice/Potong"},
  //   {"id": "set", "name": "Set"},
  //   {"id": "scoop", "name": "Ball/Scoop"},
  // ];

  bool _hasVoted = false;
  bool _stopCheckVoted = false;

  @override
  void initState() {
    super.initState();
    context.read<OwnerCubit>().getOwner();
    if (widget.initialValue["price"] != null) {
      _priceController.text =
          _priceFormatter.formatString(widget.initialValue["price"]);
    }
    if (widget.initialValue["modal"] != null) {
      _modalController.text =
          _modalFormatter.formatString(widget.initialValue["modal"]);
    }

    _modalController.addListener(_updateProfitInfo);
    _priceController.addListener(_updateProfitInfo);
  }

  @override
  void dispose() {
    _priceController.dispose();
    _modalController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  String _getProfitInfo() {
    int sellingPrice = _priceFormatter.getUnformattedValue().toInt();
    int costPrice = _modalFormatter.getUnformattedValue().toInt();
    int profit = sellingPrice - costPrice;
    return "Keuntungan penjualan sebesar ${profit > 0 ? TFormatter.formatToRupiah(profit) : "Rp0"}/produk";
  }

  void _updateProfitInfo() {
    Future.delayed(Duration(milliseconds: 50), () {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FormBuilder(
      key: widget.formKey,
      initialValue: widget.initialValue,
      // onChanged: widget.onChanged,
      onChanged: () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          bool isFormValid = widget.formKey.currentState?.isValid ?? false;
          context.read<ProductFormCubit>().onChangeProduct(
                widget.formKey.currentState?.instantValue,
                isFormValid,
                true,
              );
        });
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormBuilderField<ImagePickerValue>(
                        name: "images",
                        builder: (field) {
                          return ImagePickerField(
                            value: field.value,
                            onChanged: field.didChange,
                            errorText: field.errorText ?? "",
                            onError: (errorText) {
                              widget.formKey.currentState?.fields["images"]
                                  ?.invalidate(errorText);
                            },
                          );
                        },
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FormLabel("Nama Produk"),
                            FormBuilderTextField(
                              name: "name",
                              decoration: const InputDecoration(
                                hintText: "Contoh: Es Teh",
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  errorText: ErrorTextStrings.required(
                                      name: "Nama Produk"),
                                ),
                                (value) {
                                  if (value != null &&
                                      !RegExp(r'^[a-zA-Z0-9\s]+$')
                                          .hasMatch(value)) {
                                    return "Tidak boleh mengandung karakter khusus";
                                  }
                                  return null;
                                },
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormLabel(
                        "Harga Jual",
                      ),
                      FormBuilderTextField(
                        name: "price",
                        controller: _priceController,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText:
                                ErrorTextStrings.required(name: "Harga Jual"),
                          ),
                          (value) {
                            final unformattedValue =
                                _priceFormatter.getUnformattedValue();
                            if (unformattedValue <= 0) {
                              return "Nilai tidak boleh Rp0. Minimal Rp1";
                            }
                            return null;
                          },
                        ]),
                        keyboardType: TextInputType.number,
                        inputFormatters: [_priceFormatter],
                        decoration: InputDecoration(
                          hintText: 'Rp 0',
                          helperText:
                              "Harga ini yang akan digunakan untuk transaksi.",
                        ),
                        valueTransformer: (value) {
                          return _priceFormatter.getUnformattedValue().toInt();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormLabel(
                        "Deskripsi",
                        optional: true,
                      ),
                      FormBuilderTextField(
                        name: "description",
                        decoration: const InputDecoration(
                          hintText: "Tuliskan deskripsi produk",
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                BlocBuilder<OwnerCubit, OwnerState>(builder: (context, state) {
                  final owner = state is OwnerLoadSuccess ? state.owner : null;
                  final isOwnerLoaded = owner != null;

                  if (isOwnerLoaded && !_hasVoted && !_stopCheckVoted) {
                    VoteHelper.hasUserVoted(
                      owner.phoneNumber,
                      "Add-Ons Product",
                    ).then((alreadyVoted) {
                      if (mounted) {
                        setState(() {
                          _hasVoted = alreadyVoted;
                          _stopCheckVoted = true;
                        });
                      }
                      return false;
                    });
                  }

                  return Visibility(
                    visible: !_hasVoted,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 20.0,
                      ),
                      margin: const EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: TColors.neutralLightMedium,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Row(children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextHeading3(
                                "Opsi Tambahan",
                                color: TColors.neutralDarkDarkest,
                              ),
                              TextBodyS(
                                "Topping, ekstra bahan, atau pilihan khusus untuk produk ini.",
                                color: TColors.neutralDarkLight,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          height: 36,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: TColors.primary,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: TextButton(
                            onPressed: () {
                              VoteBottomSheetHelper.show(
                                context: context,
                                featureName: "Add-Ons Product",
                                highlightMessage: "opsi tambahan untuk produk",
                                featureDesc:
                                    "seperti topping, ekstra bahan, atau level pedas. Dengan fitur ini, kamu bisa lebih fleksibel dalam mengatur variasi menu",
                                onVoteSuccess: () {
                                  setState(() {
                                    _hasVoted = true;
                                    _stopCheckVoted = true;
                                  });
                                },
                              );
                            },
                            child: TextActionL("Atur"),
                          ),
                        ),
                      ]),
                    ),
                  );
                }),
              ],
            ),
          ),
          Container(
            color: TColors.neutralLightMedium,
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormLabel(
                        "Harga Modal",
                        optional: true,
                      ),
                      FormBuilderTextField(
                        name: "modal",
                        controller: _modalController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [_modalFormatter],
                        decoration: InputDecoration(
                          hintText: 'Rp 0',
                          helperText: _getProfitInfo(),
                        ),
                        valueTransformer: (value) {
                          return _modalFormatter.getUnformattedValue().toInt();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FormLabel("Kategori"),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: CategoryField(
                              initialValue: widget.initialValue["categoryId"],
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FormLabel("Status Produk"),
                            Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: FormBuilderField<String>(
                                name: "availability",
                                initialValue:
                                    widget.initialValue["availability"] ??
                                        "AVAILABLE",
                                builder: (field) {
                                  return Wrap(
                                    direction: Axis.horizontal,
                                    spacing: 8,
                                    children: [
                                      ..._availability.map((item) {
                                        bool selected =
                                            item.value == field.value;
                                        return InputChip(
                                          label: !selected
                                              ? TextBodyM(item.label)
                                              : TextHeading4(
                                                  item.label,
                                                  color: TColors.primary,
                                                ),
                                          selected: selected,
                                          onPressed: () {
                                            field.didChange(item.value);
                                          },
                                        );
                                      }),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // Container(
                //   margin: const EdgeInsets.only(bottom: 8.0),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             const FormLabel("Satuan Dasar"),
                //             Container(
                //               margin: const EdgeInsets.only(bottom: 8),
                //               child: FormBuilderField<String>(
                //                 name: "unit",
                //                 initialValue:
                //                     widget.initialValue["unit"] ?? "pcs",
                //                 builder: (field) {
                //                   return Wrap(
                //                     direction: Axis.horizontal,
                //                     spacing: 8,
                //                     runSpacing: -4,
                //                     children: [
                //                       ..._units.map((unit) {
                //                         bool selected =
                //                             unit["id"] == field.value;
                //                         return InputChip(
                //                           label: !selected
                //                               ? TextBodyM(unit["name"]!)
                //                               : TextHeading4(
                //                                   unit["name"]!,
                //                                   color: TColors.primary,
                //                                 ),
                //                           selected: selected,
                //                           onPressed: () {
                //                             field.didChange(unit["id"]);
                //                           },
                //                         );
                //                       }),
                //                       Padding(
                //                         padding:
                //                             const EdgeInsets.only(top: 8.0),
                //                         child: SizedBox(
                //                           height: 33,
                //                           child: OutlinedButton.icon(
                //                             onPressed: () {},
                //                             label: const TextActionM(
                //                               "Buat Baru",
                //                               color: TColors.primary,
                //                             ),
                //                             style: const ButtonStyle(
                //                                 padding: WidgetStatePropertyAll(
                //                                     EdgeInsets.symmetric(
                //                                         horizontal: 14.0)),
                //                                 side: WidgetStatePropertyAll(
                //                                     BorderSide(
                //                                   width: 1,
                //                                   color: TColors.primary,
                //                                 ))),
                //                             icon: const UiIcons(
                //                               TIcons.add,
                //                               size: 12,
                //                               color: TColors.primary,
                //                             ),
                //                           ),
                //                         ),
                //                       )
                //                     ],
                //                   );
                //                 },
                //               ),
                //             ),
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
