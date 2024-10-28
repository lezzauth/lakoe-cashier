import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/bill/application/cubit/bill_master/bill_master_cubit.dart';
import 'package:point_of_sales_cashier/features/bill/application/cubit/bill_master/bill_master_state.dart';
import 'package:point_of_sales_cashier/features/bill/data/arguments/template_order_model.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/widgets/bill_view.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class BillEditScreen extends StatefulWidget {
  const BillEditScreen({super.key});

  @override
  State<BillEditScreen> createState() => _BillEditScreenState();
}

class _BillEditScreenState extends State<BillEditScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _onSubmitted() async {
    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) {
      return;
    }

    await context.read<BillMasterCubit>().onSave();

    if (!mounted) return;
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    TemplateOrderModel templateOrder = TemplateOrderModel();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocBuilder<BillMasterCubit, BillMasterState>(
          builder: (context, state) {
        return FormBuilder(
          key: _formKey,
          onChanged: () {
            context.read<BillMasterCubit>().setFootNote(
                _formKey.currentState?.instantValue["footNote"] ?? "");
          },
          child: Scaffold(
            appBar: CustomAppbar(
              title: "Ubah Struk (Bill)",
              actions: [
                TextButton(
                  onPressed: _onSubmitted,
                  child: const TextActionL(
                    "SIMPAN",
                    color: TColors.primary,
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FormLabel("Catatan Kaki"),
                        FormBuilderTextField(
                          name: "footNote",
                          initialValue: state.footNote,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.maxLength(100,
                                errorText: 'Maksimal 100 karakter'),
                          ]),
                          decoration: const InputDecoration(),
                          maxLines: 3,
                          maxLength: 100,
                          buildCounter: (
                            BuildContext context, {
                            required int currentLength,
                            required bool isFocused,
                            required int? maxLength,
                          }) {
                            return TextBodyS(
                              '$currentLength/$maxLength',
                              color: currentLength > (maxLength ?? 100)
                                  ? Colors.red
                                  : Colors.grey,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 500,
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
                          child: BillView(order: templateOrder.order),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
