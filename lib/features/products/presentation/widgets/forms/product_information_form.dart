import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_cubit.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_state.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/forms/field/image_picker_field.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class ProductInformationForm extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  final Map<String, dynamic> initialValue;

  const ProductInformationForm({
    super.key,
    required this.formKey,
    this.initialValue = const <String, dynamic>{},
  });

  @override
  State<ProductInformationForm> createState() => _ProductInformationFormState();
}

class _ProductInformationFormState extends State<ProductInformationForm>
    with AutomaticKeepAliveClientMixin<ProductInformationForm> {
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
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) => switch (state) {
        CategoryLoadSuccess(:final categories) => FormBuilder(
            key: widget.formKey,
            initialValue: widget.initialValue,
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
                                    widget
                                        .formKey.currentState?.fields["images"]
                                        ?.invalidate(errorText);
                                  },
                                );
                              },
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
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
                                    validator: FormBuilderValidators.required(),
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
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                // FormBuilderValidators.positiveNumber()
                              ]),
                              keyboardType: TextInputType.number,
                              inputFormatters: [_priceFormatter],
                              decoration: const InputDecoration(
                                hintText: 'Rp 0',
                              ),
                              initialValue: _priceFormatter.format.format(
                                  widget.initialValue["price"].runtimeType ==
                                          String
                                      ? int.parse(widget.initialValue['price'])
                                      : 0),
                              valueTransformer: (value) {
                                return _priceFormatter
                                    .getUnformattedValue()
                                    .toInt();
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
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                // FormBuilderValidators.positiveNumber()
                              ]),
                              keyboardType: TextInputType.number,
                              inputFormatters: [_modalFormatter],
                              decoration: const InputDecoration(
                                hintText: 'Rp 0',
                              ),
                              initialValue: _modalFormatter.format.format(
                                  widget.initialValue["modal"].runtimeType ==
                                          String
                                      ? int.parse(widget.initialValue['modal'])
                                      : 0),
                              valueTransformer: (value) {
                                return _priceFormatter
                                    .getUnformattedValue()
                                    .toInt();
                              },
                            ),
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
                                const FormLabel("Kategori"),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: FormBuilderField<int>(
                                    name: "categoryId",
                                    initialValue:
                                        widget.initialValue["categoryId"] ??
                                            categories[0].id,
                                    builder: (field) {
                                      return Wrap(
                                        direction: Axis.horizontal,
                                        spacing: 8,
                                        children: categories.map((category) {
                                          bool selected =
                                              field.value == category.id;
                                          return InputChip(
                                            label: !selected
                                                ? TextBodyS(category.name)
                                                : TextHeading5(
                                                    category.name,
                                                    color: TColors.primary,
                                                  ),
                                            selected: selected,
                                            onPressed: () {
                                              field.didChange(category.id);
                                            },
                                          );
                                        }).toList(),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 36,
                                  child: OutlinedButton.icon(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        "/categories/new",
                                      );
                                    },
                                    label: const TextActionM(
                                      "Buat Baru",
                                      color: TColors.primary,
                                    ),
                                    style: const ButtonStyle(
                                      padding: WidgetStatePropertyAll(
                                        EdgeInsets.symmetric(horizontal: 14.0),
                                      ),
                                      side: WidgetStatePropertyAll(
                                        BorderSide(
                                          width: 1,
                                          color: TColors.primary,
                                        ),
                                      ),
                                    ),
                                    icon: const UiIcons(
                                      TIcons.add,
                                      height: 12,
                                      width: 12,
                                      color: TColors.primary,
                                    ),
                                  ),
                                )
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
                                          children: _units.map((unit) {
                                            bool selected =
                                                unit["id"] == field.value;
                                            return InputChip(
                                              label: !selected
                                                  ? TextBodyS(unit["name"]!)
                                                  : TextHeading5(
                                                      unit["name"]!,
                                                      color: TColors.primary,
                                                    ),
                                              selected: selected,
                                              onPressed: () {
                                                field.didChange(unit["id"]);
                                              },
                                            );
                                          }).toList(),
                                          // children: [
                                          //   InputChip(
                                          //     label: TextBodyS("Pcs"),
                                          //     onPressed: () {},
                                          //   ),
                                          //   InputChip(
                                          //     label: TextBodyS("Kilogram"),
                                          //     onPressed: () {},
                                          //   ),
                                          //   InputChip(
                                          //     label: TextBodyS("Box"),
                                          //     onPressed: () {},
                                          //   ),
                                          //   InputChip(
                                          //     label: TextBodyS("Gram"),
                                          //     onPressed: () {},
                                          //   ),
                                          //   InputChip(
                                          //     label: TextBodyS("Liter"),
                                          //     onPressed: () {},
                                          //   ),
                                          // ],
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 36,
                                    child: OutlinedButton.icon(
                                      onPressed: () {},
                                      label: TextActionM(
                                        "Buat Baru",
                                        color: TColors.primary,
                                      ),
                                      style: ButtonStyle(
                                          padding: WidgetStatePropertyAll(
                                            EdgeInsets.symmetric(
                                                horizontal: 14.0),
                                          ),
                                          side:
                                              WidgetStatePropertyAll(BorderSide(
                                            width: 1,
                                            color: TColors.primary,
                                          ))),
                                      icon: UiIcons(
                                        TIcons.add,
                                        height: 12,
                                        width: 12,
                                        color: TColors.primary,
                                      ),
                                    ),
                                  )
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
          ),
        _ => Center(
            child: CircularProgressIndicator(),
          ),
      },
    );
  }
}
