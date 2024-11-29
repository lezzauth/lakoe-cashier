import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_cubit.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:owner_repository/owner_repository.dart';

class NameEditScreen extends StatefulWidget {
  const NameEditScreen({super.key});

  @override
  State<NameEditScreen> createState() => _NameEditScreenState();
}

class _NameEditScreenState extends State<NameEditScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  final FocusNode _focusNode = FocusNode();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    CustomToast.init(context);

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _controller.text.length,
        );
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String field = args!.keys.first;
    final String value = args[field];

    _controller = TextEditingController(text: value);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    FocusScope.of(context).unfocus();

    bool isFormValidated = formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValidated) {
      return;
    }
    dynamic value = formKey.currentState?.value;

    context.read<OwnerCubit>().updateName(UpdateNameDto(name: value['name']));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OwnerCubit, OwnerState>(
      listener: (context, state) async {
        if (state is OwnerActionSuccess) {
          CustomToast.showWithContext(
            context,
            "Nama berhasil diubah",
            duration: 1,
            backgroundColor: TColors.success,
          );
          await Future.delayed(Duration(seconds: 1));
          Navigator.pop(context, true);
          context.read<OwnerCubit>().getOwner();
        } else if (state is OwnerActionFailure) {
          CustomToast.showWithContext(
            context,
            "Nama gagal diubah",
            duration: 1,
            backgroundColor: TColors.error,
          );
          await Future.delayed(Duration(seconds: 1));
          Navigator.pop(context);
          context.read<OwnerCubit>().getOwner();
        }
      },
      child: BlocBuilder<OwnerCubit, OwnerState>(builder: (context, state) {
        return Scaffold(
          appBar: CustomAppbar(),
          body: FormBuilder(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextHeading2(
                              "Ubah Nama Lengkap",
                              color: TColors.neutralDarkDark,
                            ),
                            TextBodyM(
                              "Kamu bisa mengganti nama lengkap kamu",
                              color: TColors.neutralDarkDark,
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        FormBuilderTextField(
                          name: "name",
                          controller: _controller,
                          focusNode: _focusNode,
                          decoration: InputDecoration(
                            hintText: "Masukan nama lengkap",
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText:
                                  ErrorTextStrings.required(name: "Nama"),
                            ),
                            (value) {
                              if (value != null &&
                                  !RegExp(r'^[a-zA-Z0-9\s]+$')
                                      .hasMatch(value)) {
                                return "Tidak boleh mengandung karakter khusus";
                              }
                              return null;
                            },
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: TColors.neutralLightMedium,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: state is OwnerActionInProgress
                        ? null
                        : () {
                            _onSubmit();
                          },
                    child: state is OwnerActionInProgress
                        ? SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 1.5,
                            ),
                          )
                        : TextActionL("Simpan"),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
