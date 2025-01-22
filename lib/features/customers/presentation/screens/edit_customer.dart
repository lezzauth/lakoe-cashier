import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_master/customer_master_cubit.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_master/customer_master_state.dart';
import 'package:lakoe_pos/features/customers/presentation/widgets/forms/customer_form.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class EditCustomerScreen extends StatefulWidget {
  const EditCustomerScreen({super.key});

  @override
  State<EditCustomerScreen> createState() => _EditCustomerScreenState();
}

class _EditCustomerScreenState extends State<EditCustomerScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _onSubmit(String id) async {
    FocusScope.of(context).unfocus();

    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) return;

    dynamic value = _formKey.currentState?.value;

    String phoneNumber =
        PhoneNumberFormatter.formatForRequest(value["phoneNumber"]);

    await context.read<CustomerMasterCubit>().update(
          id,
          CustomerDto(
            name: value["name"],
            phoneNumber: phoneNumber,
            address: value["address"],
            email: value["email"],
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CustomerModel;

    return BlocListener<CustomerMasterCubit, CustomerMasterState>(
      listener: (context, state) {
        if (state is CustomerMasterActionSuccess) {
          Navigator.pop(context, state.data);
        }
      },
      child: Scaffold(
        appBar: CustomAppbar(
          title: "Ubah Data Pelanggan",
          actions: [
            BlocBuilder<CustomerMasterCubit, CustomerMasterState>(
              builder: (context, state) {
                return TextButton(
                  onPressed: state is CustomerMasterActionInProgress
                      ? null
                      : () {
                          _onSubmit(args.id);
                        },
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
          child: CustomerForm(
            formKey: _formKey,
            initialValue: {
              "id": args.id,
              "name": args.name,
              "phoneNumber":
                  PhoneNumberFormatter.formatForDisplay(args.phoneNumber),
              "email": args.email,
              "address": args.address,
            },
          ),
        ),
      ),
    );
  }
}
