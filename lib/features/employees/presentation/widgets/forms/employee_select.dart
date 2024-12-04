import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/tiles/custom_radio_tile.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/features/employees/application/cubit/employee_master/employee_master_cubit.dart';
import 'package:lakoe_pos/features/employees/application/cubit/employee_master/employee_master_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/device/device_uility.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

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
                const TextHeading2("Pilih Kasir"),
              ],
            ),
          ),
          BlocBuilder<EmployeeMasterCubit, EmployeeMasterState>(
            builder: (context, state) {
              if (state is EmployeeMasterLoadSuccess) {
                return Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.employees.length,
                      itemBuilder: (context, i) {
                        EmployeeModel data = state.employees.elementAt(i);
                        return CustomRadioTile(
                          value: data.phoneNumber,
                          title: data.name,
                          subtitle: PhoneNumberFormatter.formatForDisplay(
                              data.phoneNumber),
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                            });
                          },
                        );
                      },
                    ),
                    SizedBox(height: 20),
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
                      child: SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            widget.onChanged(_value);
                          },
                          child: const TextActionL("Lanjutkan"),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
