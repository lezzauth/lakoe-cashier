import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/buttons/tertiary_button.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/online_shop/presentation/widgets/forms/fields/faq_field.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class OnlineShopAIFAQScreen extends StatefulWidget {
  const OnlineShopAIFAQScreen({super.key});

  @override
  State<OnlineShopAIFAQScreen> createState() => _OnlineShopAIFAQScreenState();
}

class _OnlineShopAIFAQScreenState extends State<OnlineShopAIFAQScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  List<FAQField> faqs = [
    FAQField(id: "1"),
    FAQField(id: "2"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "FAQ",
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
                  "Masukan daftar pertanyaan yang sering ditanyakan konsumen beserta jawabannya",
                  textAlign: TextAlign.justify,
                ),
              ),
              ...faqs.map(
                (field) {
                  bool isLast = faqs.last == field;

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
                  "Tambah FAQ Baru",
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
