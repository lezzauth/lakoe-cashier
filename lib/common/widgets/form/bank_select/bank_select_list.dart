import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/application/cubit/bank_list_cubit.dart';
import 'package:lakoe_pos/application/cubit/bank_list_state.dart';
import 'package:lakoe_pos/common/widgets/form/bank_select/bank_radio_tile.dart';
import 'package:lakoe_pos/common/widgets/form/search_field.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/common/widgets/wrapper/error_wrapper.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/device/device_uility.dart';
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
  final TextEditingController _searchController = TextEditingController();

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

  Future<void> onRefresh() async {
    if (!mounted) return;

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
                  controller: _searchController,
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
                BankListLoadSuccess(:final banks) => ErrorWrapper(
                    fetchError: state is BankListLoadFailure,
                    onRefresh: onRefresh,
                    child: ListView.builder(
                      itemCount: _getFilteredBanks(banks).length,
                      itemBuilder: (context, index) {
                        BankListModel bank =
                            _getFilteredBanks(banks).elementAt(index);

                        if (search.isNotEmpty) {
                          return BankRadioTile<String?>(
                            value: bank.name,
                            title: bank.name,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            },
                          );
                        }

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BankRadioTile<String?>(
                              value: bank.name,
                              title: bank.name,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                            if (index == 4)
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 20, bottom: 4),
                                child: const TextHeading5(
                                  "BANK LAINNYA",
                                  color: TColors.neutralDarkLightest,
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                _ => const Center(child: CircularProgressIndicator()),
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: TColors.neutralLightMedium,
                  width: 1.0,
                ),
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                widget.onChanged(_value);
              },
              child: const TextActionL("Lanjutkan"),
            ),
          ),
        ],
      ),
    );
  }
}
