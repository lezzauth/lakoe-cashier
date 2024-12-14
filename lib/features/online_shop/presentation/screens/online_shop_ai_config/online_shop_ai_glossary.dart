import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/buttons/tertiary_button.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/online_shop/presentation/widgets/forms/fields/glossary_field.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class OnlineShopAIGlossaryScreen extends StatefulWidget {
  const OnlineShopAIGlossaryScreen({super.key});

  @override
  State<OnlineShopAIGlossaryScreen> createState() =>
      _OnlineShopAIGlossaryScreenState();
}

class _OnlineShopAIGlossaryScreenState
    extends State<OnlineShopAIGlossaryScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  List<GlossaryField> glossarium = [
    GlossaryField(id: "1"),
    GlossaryField(id: "2"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Kata Istilah",
        actions: [
          TertiaryButton(
            label: "SIMPAN",
          )
        ],
      ),
      body: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: TextHeading4(
                  "Masukan daftar istilah-istilah yang biasa kamu gunakan saat berkomunikasi dengan pelanggan.",
                  textAlign: TextAlign.justify,
                ),
              ),
              ...glossarium.map(
                (field) {
                  bool isLast = glossarium.last == field;

                  return Column(
                    children: [
                      field,
                      if (!isLast)
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Divider(
                            color: TColors.neutralLightMedium,
                            height: 1,
                          ),
                        ),
                    ],
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  //
                },
                child: const TextActionL(
                  "Tambah Istilah Baru",
                  color: TColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
