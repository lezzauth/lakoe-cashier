import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_caption_m.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class ProductInformationForm extends StatefulWidget {
  const ProductInformationForm({super.key});

  @override
  State<ProductInformationForm> createState() => _ProductInformationFormState();
}

class _ProductInformationFormState extends State<ProductInformationForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
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
                      GestureDetector(
                        onTap: () {},
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(12),
                          color: TColors.primary,
                          dashPattern: const [4],
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: TColors.highlightLightest,
                              ),
                              height: 100,
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 12.0),
                                    child: const UiIcons(
                                      TIcons.image,
                                      color: TColors.primary,
                                    ),
                                  ),
                                  const TextActionS(
                                    "Tambah Foto",
                                    color: TColors.primary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FormLabel("Nama Produk"),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Contoh: Es Teh",
                                isDense: true,
                              ),
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
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: "0",
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 14, bottom: 14, left: 16, right: 1),
                            child: TextBodyM(
                              "Rp",
                              color: TColors.neutralDarkLightest,
                            ),
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          helperText:
                              "Harga ini yang akan dilihat oleh pembeli",
                        ),
                        keyboardType: TextInputType.number,
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
                          isDense: true,
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
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: "0",
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 14, bottom: 14, left: 16, right: 1),
                            child: TextBodyM(
                              "Rp",
                              color: TColors.neutralDarkLightest,
                            ),
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                        ),
                        keyboardType: TextInputType.number,
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
                            child: Wrap(
                              direction: Axis.horizontal,
                              spacing: 8,
                              children: [
                                InputChip(
                                  label: TextBodyS("Umum"),
                                  onPressed: () {},
                                ),
                                InputChip(
                                  label: TextBodyS("Minuman"),
                                  onPressed: () {},
                                ),
                                InputChip(
                                  label: TextBodyS("Makanan"),
                                  onPressed: () {},
                                ),
                              ],
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
                                    EdgeInsets.symmetric(horizontal: 14.0),
                                  ),
                                  side: WidgetStatePropertyAll(BorderSide(
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
                            child: Wrap(
                              direction: Axis.horizontal,
                              spacing: 8,
                              children: [
                                InputChip(
                                  label: TextBodyS("Pcs"),
                                  onPressed: () {},
                                ),
                                InputChip(
                                  label: TextBodyS("Kilogram"),
                                  onPressed: () {},
                                ),
                                InputChip(
                                  label: TextBodyS("Box"),
                                  onPressed: () {},
                                ),
                                InputChip(
                                  label: TextBodyS("Gram"),
                                  onPressed: () {},
                                ),
                                InputChip(
                                  label: TextBodyS("Liter"),
                                  onPressed: () {},
                                ),
                              ],
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
                                    EdgeInsets.symmetric(horizontal: 14.0),
                                  ),
                                  side: WidgetStatePropertyAll(BorderSide(
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
                      ))
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
