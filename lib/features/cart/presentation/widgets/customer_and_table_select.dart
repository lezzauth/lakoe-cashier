import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/bottom_sheet/customer_list.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/bottom_sheet/table_list.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/cards/card_order.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:table_repository/table_repository.dart';

class CustomerAndTableSelect extends StatefulWidget {
  const CustomerAndTableSelect({
    super.key,
    this.customer,
    this.table,
    required this.onCustomerChanged,
    required this.onTableChanged,
  });

  final CustomerModel? customer;
  final ValueChanged<CustomerModel?> onCustomerChanged;
  final TableModel? table;
  final ValueChanged<TableModel?> onTableChanged;

  @override
  State<CustomerAndTableSelect> createState() => _CustomerAndTableSelectState();
}

class _CustomerAndTableSelectState extends State<CustomerAndTableSelect> {
  Future<void> _onCustomerOpened() async {
    CustomerModel? selectedCustomer =
        await showModalBottomSheet<CustomerModel?>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      useRootNavigator: true,
      builder: (context) {
        return CustomBottomsheet(
          child: Expanded(
            child: CartCustomerList(
              value: widget.customer,
            ),
          ),
        );
      },
    );
    selectedCustomer ??= widget.customer;
    widget.onCustomerChanged(selectedCustomer);
  }

  Future<void> _onTableOpened() async {
    TableModel? selectedTable = await showModalBottomSheet<TableModel?>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      useRootNavigator: true,
      builder: (context) {
        return CustomBottomsheet(
          child: Expanded(
            child: TableList(
              value: widget.table,
            ),
          ),
        );
      },
    );
    selectedTable ??= widget.table;
    widget.onTableChanged(selectedTable);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: CardOrder(
            title: "Pelanggan",
            subTitle: widget.customer == null ? "Tamu" : widget.customer!.name,
            icon: UiIcons(
              TIcons.profile,
              size: 20,
              color: TColors.primary,
            ),
            onTap: _onCustomerOpened,
            // trailing: widget.customer == null
            //     ? null
            //     : SvgPicture.asset(
            //         TImages.lakoeCoin,
            //         height: 24,
            //         width: 24,
            //       ),
          ),
        ),
        SizedBox(width: 12.0),
        Flexible(
          flex: 1,
          child: CardOrder(
            title: "No. Meja",
            subTitle: widget.table == null ? "Bebas" : widget.table!.no,
            icon: UiIcons(
              TIcons.tableRestaurant,
              size: 20,
              color: TColors.primary,
            ),
            onTap: _onTableOpened,
          ),
        ),
      ],
    );
  }
}
