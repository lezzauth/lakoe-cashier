import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_cubit.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:owner_repository/owner_repository.dart';

class NameEditScreen extends StatefulWidget {
  const NameEditScreen({super.key});

  @override
  State<NameEditScreen> createState() => _NameEditScreenState();
}

class _NameEditScreenState extends State<NameEditScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _showClearIcon = true;

  @override
  void initState() {
    super.initState();
    CustomToast.init(context);
  }

  Future<void> _onSubmit() async {
    FocusScope.of(context).unfocus();

    bool isFormValidated = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValidated) {
      return;
    }
    dynamic value = _formKey.currentState?.value;

    context.read<OwnerCubit>().updateName(UpdateNameDto(name: value['name']));
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String field = args!.keys.first;
    final String value = args[field];

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
            key: _formKey,
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
                          initialValue: value,
                          decoration: InputDecoration(
                            hintText: "Masukan nama lengkap",
                            suffixIcon: _showClearIcon
                                ? IconButton(
                                    icon: UiIcons(
                                      TIcons.close,
                                      size: 12,
                                    ),
                                    onPressed: () {
                                      _formKey.currentState?.fields['name']
                                          ?.didChange('');
                                    },
                                  )
                                : null,
                          ),
                          onChanged: (val) {
                            setState(() {
                              _showClearIcon = val?.isNotEmpty ?? false;
                            });
                          },
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
