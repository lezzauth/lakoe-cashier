import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/tiles/custom_radio_tile.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/features/employees/application/cubit/employee_master/employee_master_cubit.dart';
import 'package:lakoe_pos/features/employees/application/cubit/employee_master/employee_master_state.dart';
import 'package:lakoe_pos/utils/device/device_uility.dart';
import 'package:logman/logman.dart';

class EmployeeSelect extends StatefulWidget {
  const EmployeeSelect({
    super.key,
    this.value,
    required this.onChanged,
  });

  final String? value;
  final ValueChanged<String?> onChanged;

  @override
  State<EmployeeSelect> createState() => _EmployeeSelectState();
}

class _EmployeeSelectState extends State<EmployeeSelect> {
  String? _value;
  String search = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      _value = widget.value;
    });

    context.read<EmployeeMasterCubit>().init();
  }

  Future<void> onRefresh() async {
    if (!mounted) return;

    context.read<EmployeeMasterCubit>().findAll(FindAllEmployeeDto());
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
                  child: const TextHeading2("Pilih Kasir"),
                ),
              ],
            ),
          ),
          BlocBuilder<EmployeeMasterCubit, EmployeeMasterState>(
            builder: (context, state) {
              Logman.instance.info("XXX $state");
              if (state is EmployeeMasterLoadSuccess) {
                return ListView.builder(
                  itemCount: state.employees.length,
                  itemBuilder: (context, i) {
                    EmployeeModel data = state.employees.elementAt(i);
                    return CustomRadioTile(
                      value: data.id,
                      title: data.name,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    );
                  },
                );
              } else {
                return Placeholder();
              }
            },
          )
        ],
      ),
    );
  }
}
