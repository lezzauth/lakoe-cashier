import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/widgets/bill_view.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/widgets/list_price.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class BillEditScreen extends StatefulWidget {
  const BillEditScreen({super.key});

  @override
  State<BillEditScreen> createState() => _BillEditScreenState();
}

class _BillEditScreenState extends State<BillEditScreen> {
  String _textGreeting = "Terimakasih\nDitunggu kembali kedatangannya";

  List<_BillPriceItem> listBillPriceItem = [
    _BillPriceItem(label: "Subtotal", price: "Rp20.000"),
    _BillPriceItem(label: "Pajak", price: "5%"),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const CustomAppbar(
          title: "Ubah Struk (Bill)",
          actions: [
            TextButton(
              onPressed: null,
              child: TextActionL(
                "SIMPAN",
                color: TColors.primary,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FormLabel("Catatan Kaki"),
                    FormBuilderTextField(
                      name: "description",
                      initialValue:
                          "Terimakasih\nDitunggu kembali kedatangannya",
                      onChanged: (value) {
                        setState(() {
                          _textGreeting = value ?? '';
                        });
                      },
                      decoration: const InputDecoration(),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 300,
                  child: ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white.withOpacity(0.0), Colors.white],
                      stops: const [0.0, 0.5],
                    ).createShader(bounds),
                    blendMode: BlendMode.dstIn,
                    child: SingleChildScrollView(
                      reverse: true,
                      physics: const NeverScrollableScrollPhysics(),
                      child: BillView(
                        isEdit: true,
                        outletName: "Warmindo Cak Tho",
                        outletAddress: "Tebet,Jakarta Selatan, DKI Jakarta",
                        orderNumber: "2563",
                        cashierName: "Dimas",
                        noBill: "GS731",
                        orderType: "DineIn",
                        noTable: "T-12",
                        dateTime: "28/12/2024 - 20:18",
                        paymentMetod: 'Cash (Tunai)',
                        totalPrice: "Rp20.000",
                        moneyReceived: "Rp50.000",
                        changeMoney: "Rp30.000",
                        closeBill: "Close Bill: 28/12/2024 - 21:37",
                        greeting: _textGreeting,
                        children: listBillPriceItem
                            .map(
                              (item) => BillListPrice(
                                label: item.label,
                                price: item.price,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BillPriceItem {
  final String label;
  final String price;

  _BillPriceItem({
    required this.label,
    required this.price,
  });
}
