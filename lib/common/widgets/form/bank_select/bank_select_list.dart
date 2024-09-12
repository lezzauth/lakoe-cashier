import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/application/cubit/bank_list_cubit.dart';
import 'package:point_of_sales_cashier/application/cubit/bank_list_state.dart';
import 'package:point_of_sales_cashier/common/widgets/form/bank_select/bank_radio_tile.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/device/device_uility.dart';
import 'package:public_repository/public_repository.dart';

class BankSelectList extends StatefulWidget {
  const BankSelectList({
    super.key,
    this.initialValue,
    required this.onChanged,
  });
  final String? initialValue;
  final ValueChanged<String?> onChanged;

  @override
  State<BankSelectList> createState() => _BankSelectListState();
}

class _BankSelectListState extends State<BankSelectList> {
  String? _value;
  String search = "";

  List<BankListModel> _getFilteredBanks(List<BankListModel> rawBanks) {
    if (search.isEmpty) return rawBanks;

    return rawBanks.where((bank) {
      bool isNameMatched =
          bank.name.toLowerCase().contains(search.toLowerCase());
      bool isCodeMatched =
          bank.code.toLowerCase().contains(search.toLowerCase());
      bool isBankNameMatched =
          bank.bankName.toLowerCase().contains(search.toLowerCase());
      bool isBankCodeMatched =
          bank.bankCode.toLowerCase().contains(search.toLowerCase());

      return [
        isNameMatched,
        isCodeMatched,
        isBankCodeMatched,
        isBankNameMatched
      ].contains(true);
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _value = widget.initialValue;
    });

    context.read<BankListCubit>().findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: TDeviceUtils.getViewInsets(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: const TextHeading2("Pilih Bank"),
                ),
                SearchField(
                  hintText: "Cari nama bank disini...",
                  debounceTime: 500,
                  onChanged: (value) {
                    setState(() {
                      search = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<BankListCubit, BankListState>(
              builder: (context, state) => switch (state) {
                BankListLoadSuccess(:final banks) => ListView.builder(
                    itemCount: _getFilteredBanks(banks).length,
                    itemBuilder: (context, index) {
                      BankListModel bank =
                          _getFilteredBanks(banks).elementAt(index);

                      return Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: TColors.neutralLightMedium,
                            ),
                          ),
                        ),
                        child: BankRadioTile<String?>(
                          value: bank.name,
                          title: TextHeading4(
                            bank.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          },
                        ),
                      );
                    },
                  ),
                BankListLoadFailure(:final error) => Center(
                    child: TextBodyS(
                      error,
                      color: TColors.error,
                    ),
                  ),
                _ => const Center(child: CircularProgressIndicator()),
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  widget.onChanged(_value);
                },
                child: const TextActionL("Pilih"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
