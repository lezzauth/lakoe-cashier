import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/widgets/forms/fields/language_style_field.dart';

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
      ),
      body: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [
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
