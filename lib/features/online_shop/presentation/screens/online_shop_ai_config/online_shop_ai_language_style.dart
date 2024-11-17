import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/buttons/tertiary_button.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/online_shop/presentation/widgets/forms/fields/language_style_field.dart';

class OnlineShopAILanguageStyleScreen extends StatefulWidget {
  const OnlineShopAILanguageStyleScreen({super.key});

  @override
  State<OnlineShopAILanguageStyleScreen> createState() =>
      _OnlineShopAILanguageStyleScreenState();
}

class _OnlineShopAILanguageStyleScreenState
    extends State<OnlineShopAILanguageStyleScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Gaya bahasa",
        actions: [
          TertiaryButton(
            label: "SIMPAN",
          )
        ],
      ),
      body: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: {
          "languageStyle": "formal",
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: TextHeading4(
                  "Gaya bahasa ini menentukan bagaimana cara AI  nanti dalam berkomunikasi dengan pembeli. ",
                  textAlign: TextAlign.justify,
                ),
              ),
              FormBuilderField<String>(
                name: "languageStyle",
                builder: (field) => LanguageStyleField(
                  onChanged: field.didChange,
                  value: field.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
