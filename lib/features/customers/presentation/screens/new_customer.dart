import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/error_display/error_display.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_master/customer_master_cubit.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_master/customer_master_state.dart';
import 'package:point_of_sales_cashier/features/customers/presentation/widgets/forms/new_customer_form.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class NewCustomerScreen extends StatefulWidget {
  const NewCustomerScreen({super.key});

  @override
  State<NewCustomerScreen> createState() => _NewCustomerScreenState();
}

class _NewCustomerScreenState extends State<NewCustomerScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _onSubmit() async {
    FocusScope.of(context).unfocus();

    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) return;

    dynamic value = _formKey.currentState?.value;

    String phoneNumber =
        PhoneNumberFormatter.formatForRequest(value["phoneNumber"]);

    await context.read<CustomerMasterCubit>().create(
          CreateCustomerDto(
            name: value["name"],
            phoneNumber: phoneNumber,
            address: value["address"],
            email: value["email"],
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerMasterCubit, CustomerMasterState>(
      listener: (context, state) {
        if (state is CustomerMasterActionSuccess) {
          Navigator.pop(context, true);
        } else if (state is CustomerReachesLimit) {
          showModalBottomSheet(
            context: context,
            enableDrag: false,
            isDismissible: false,
            builder: (context) {
              return CustomBottomsheet(
                hasGrabber: false,
                child: ErrorDisplay(
                  imageSrc: TImages.limitQuota,
                  title: "Pelanggan penuh, nih!",
                  description:
                      "20 pelanggan sudah tersimpan. Upgrade untuk simpan lebih banyak!",
                  actionTitlePrimary: "Lihat Paket",
                  onActionPrimary: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/packages");
                  },
                  actionTitleSecondary: "Nanti Saja",
                  onActionSecondary: () {
                    Navigator.pop(context);
                    Navigator.pop(context, true);
                  },
                ),
              );
            },
          );
        }
      },
      child: Scaffold(
        appBar: CustomAppbar(
          title: "Pelanggan Baru",
          actions: [
            BlocBuilder<CustomerMasterCubit, CustomerMasterState>(
              builder: (context, state) {
                return TextButton(
                  onPressed: state is CustomerMasterActionInProgress
                      ? null
                      : _onSubmit,
                  child: state is CustomerMasterActionInProgress
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(),
                        )
                      : const TextActionL(
                          "SIMPAN",
                          color: TColors.primary,
                        ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: NewCustomerForm(
            formKey: _formKey,
          ),
        ),
      ),
    );
  }
}
