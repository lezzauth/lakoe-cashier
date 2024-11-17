import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lakoe_pos/common/widgets/form/form_label.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/products/application/cubit/product_master/form/product_form_cubit.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/forms/field/category_field.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/forms/field/image_picker_field.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

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

  final List<Map<String, String>> _units = [
    {"id": "pcs", "name": "Pcs"},
    {"id": "kilogram", "name": "Kilogram"},
    {"id": "box", "name": "Box"},
    {"id": "gram", "name": "Gram"},
    {"id": "liter", "name": "Liter"},
  ];

  @override
  void initState() {
    super.initState();
    if (widget.initialValue["price"] != null) {
      _priceController.text =
          _priceFormatter.formatString(widget.initialValue["price"]);
    }
    if (widget.initialValue["modal"] != null) {
      _modalController.text =
          _modalFormatter.formatString(widget.initialValue["modal"]);
    }
  }

  @override
  void dispose() {
    _priceController.dispose();
    _modalController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

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
                        decoration: const InputDecoration(hintText: 'Rp 0'),
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
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
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
                        decoration: const InputDecoration(
                          hintText: 'Rp 0',
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
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FormLabel("Satuan Dasar"),
                            Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: FormBuilderField<String>(
                                name: "unit",
                                initialValue:
                                    widget.initialValue["unit"] ?? "pcs",
                                builder: (field) {
                                  return Wrap(
                                    direction: Axis.horizontal,
                                    spacing: 8,
                                    runSpacing: -4,
                                    children: [
                                      ..._units.map((unit) {
                                        bool selected =
                                            unit["id"] == field.value;
                                        return InputChip(
                                          label: !selected
                                              ? TextBodyM(unit["name"]!)
                                              : TextHeading4(
                                                  unit["name"]!,
                                                  color: TColors.primary,
                                                ),
                                          selected: selected,
                                          onPressed: () {
                                            field.didChange(unit["id"]);
                                          },
                                        );
                                      }),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: SizedBox(
                                          height: 33,
                                          child: OutlinedButton.icon(
                                            onPressed: () {},
                                            label: const TextActionM(
                                              "Buat Baru",
                                              color: TColors.primary,
                                            ),
                                            style: const ButtonStyle(
                                                padding: WidgetStatePropertyAll(
                                                    EdgeInsets.symmetric(
                                                        horizontal: 14.0)),
                                                side: WidgetStatePropertyAll(
                                                    BorderSide(
                                                  width: 1,
                                                  color: TColors.primary,
                                                ))),
                                            icon: const UiIcons(
                                              TIcons.add,
                                              size: 12,
                                              color: TColors.primary,
                                            ),
                                          ),
                                        ),
                                      )
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
