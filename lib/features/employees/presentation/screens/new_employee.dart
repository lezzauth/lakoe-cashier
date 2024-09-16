import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_container.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_item.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/employees/presentation/widgets/forms/access_right_form.dart';
import 'package:point_of_sales_cashier/features/employees/presentation/widgets/forms/new_employee_form.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class NewEmployeeScreen extends StatefulWidget {
  const NewEmployeeScreen({super.key});

  @override
  State<NewEmployeeScreen> createState() => _NewEmployeeScreenState();
}

class _NewEmployeeScreenState extends State<NewEmployeeScreen>
    with SingleTickerProviderStateMixin {
  final _employeeFormKey = GlobalKey<FormBuilderState>();
  final _accessFormKey = GlobalKey<FormBuilderState>();

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Karyawan Baru",
        actions: const [
          TextActionL(
            "SIMPAN",
            color: TColors.primary,
          ),
        ],
        bottom: TabContainer(
          controller: _tabController,
          tabs: const [
            TabItem(
              title: "Info Karyawan",
            ),
            TabItem(title: "Hak Akses"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0),
            child: NewEmployeeForm(
              formKey: _employeeFormKey,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0),
            child: AccessRightForm(
              formKey: _accessFormKey,
            ),
          ),
        ],
      ),
    );
  }
}
