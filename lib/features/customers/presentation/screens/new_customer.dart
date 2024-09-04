import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_cubit.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_state.dart';
import 'package:point_of_sales_cashier/features/customers/presentation/widgets/forms/new_customer_form.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class NewCustomerScreen extends StatefulWidget {
  const NewCustomerScreen({super.key});

  @override
  State<NewCustomerScreen> createState() => _NewCustomerScreenState();
}

class _NewCustomerScreenState extends State<NewCustomerScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _onSubmit() async {
    if (!mounted) return;

    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) return;

    AuthState authState = context.read<AuthCubit>().state;
    if (authState is! AuthReady) return;

    dynamic value = _formKey.currentState?.value;

    await context.read<CustomerCubit>().create(
          CreateCustomerDto(
            name: value["name"],
            phoneNumber: value["phoneNumber"],
            outletId: authState.outletId,
            address: value["address"],
            email: value["email"],
          ),
        );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Pelanggan Baru",
        actions: [
          BlocBuilder<CustomerCubit, CustomerState>(
            builder: (context, state) {
              return TextButton(
                onPressed: state is CustomerActionInProgress ? null : _onSubmit,
                child: state is CustomerActionInProgress
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
    );
  }
}
