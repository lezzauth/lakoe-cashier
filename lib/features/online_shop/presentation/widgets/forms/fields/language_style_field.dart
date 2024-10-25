import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

List<LanguageStyleItem> items = [
  LanguageStyleItem(
    title: "Formal",
    description:
        'Contoh: "Selamat pagi, Bapak/Ibu. Ada yang bisa saya bantu hari ini?"',
    value: "formal",
  ),
  LanguageStyleItem(
    title: "Santai",
    description: 'Contoh: "Hai! Ada yang bisa aku bantu hari ini?"',
    value: "casual",
  ),
  LanguageStyleItem(
    title: "Ceria",
    description:
        'Contoh: "Halo! Terima kasih sudah mampir, ada yang bisa dibantu hari ini? 😊"',
    value: "cheerful",
  ),
  LanguageStyleItem(
    title: "Profesional",
    description: 'Contoh: "Selamat siang, bagaimana saya bisa membantu Anda?"',
    value: "professional",
  ),
  LanguageStyleItem(
    title: "Gaul",
    description: 'Contoh: "Halo, sob! Ada yang bisa dibantu nih?"',
    value: "trendy",
  ),
  LanguageStyleItem(
    title: "Humoris",
    description:
        'Contoh: "Waduh, hari yang sibuk ya? Apa yang bisa aku bantu sebelum kopi kedua? 😄"',
    value: "humorous",
  ),
];

class LanguageStyleField extends StatelessWidget {
  const LanguageStyleField({
    super.key,
    this.value,
    required this.onChanged,
  });

  final String? value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        bool selected = item.value == value;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: () {
              onChanged(item.value);
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 1,
                  color:
                      selected ? TColors.primary : TColors.neutralLightMedium,
                ),
                color: selected ? TColors.highlightLightest : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: TextHeading4(item.title)),
                  Row(
                    children: [
                      Expanded(
                        child: TextBodyS(
                          item.description,
                          color: TColors.neutralDarkLight,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class LanguageStyleItem {
  final String title;
  final String description;
  final String value;

  LanguageStyleItem({
    required this.title,
    required this.description,
    required this.value,
  });
}
