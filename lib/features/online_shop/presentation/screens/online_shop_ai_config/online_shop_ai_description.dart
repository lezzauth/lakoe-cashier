import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/buttons/tertiary_button.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class OnlineShopAIDescriptionScreen extends StatefulWidget {
  const OnlineShopAIDescriptionScreen({super.key});

  @override
  State<OnlineShopAIDescriptionScreen> createState() =>
      _OnlineShopAIDescriptionScreenState();
}

class _OnlineShopAIDescriptionScreenState
    extends State<OnlineShopAIDescriptionScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Deskripsi",
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
          "description":
              "Kamu adalah customer service atau asisten penjual yang membantu melayani pelanggan di sebuah toko via aplikasi Whatsapp."
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: TextHeading4(
                  "Deskripsi ini berfungsi untuk memberi arahan kepada AI bahwa dia akan bertugas sebagai apa.",
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: FormBuilderTextField(
                  name: "description",
                  decoration: InputDecoration(hintText: ""),
                  maxLines: 7,
                ),
              ),
              TextBodyS(
                "Yang terisi diatas adalah deskripsi yang kami sarankan. Kamu bisa menyesuaikan dengan kebutuhanmu.",
                color: TColors.neutralDarkLight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
