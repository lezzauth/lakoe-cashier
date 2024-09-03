import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/features/categories/presentation/widgets/forms/field/category_icon_picker.dart';

class CategoryForm extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  final Map<String, dynamic> initialValue;

  const CategoryForm({
    super.key,
    required this.formKey,
    this.initialValue = const <String, dynamic>{},
  });

  @override
  State<CategoryForm> createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final List<String> _icons = [
    "fork-spoon",
    "water-glass",
    "beer-mug",
    "beer-pitch",
    "tea-cup",
    "cheese",
    "coffee-bean",
    "burger",
    "chicken-grilled",
    "donut",
    "ice-cream",
    "milkshake",
    "popcorn",
    "shrimp",
    "toast",
    "cake-slice"
  ];

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: widget.formKey,
      initialValue: widget.initialValue,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormLabel("Nama Kategori"),
                FormBuilderTextField(
                  name: "name",
                  decoration: const InputDecoration(
                    hintText: "Buat nama kategori",
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
                  "Pilih Icon",
                  optional: true,
                ),
                FormBuilderField<String>(
                  name: "icon",
                  initialValue: widget.initialValue["icon"],
                  builder: (field) {
                    return GridView.extent(
                      maxCrossAxisExtent: 80,
                      shrinkWrap: true,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: _icons.map((icon) {
                        return CategoryIconPicker(
                          selected: field.value == icon,
                          icon: icon,
                          onSelected: () {
                            field.didChange(icon);
                          },
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
