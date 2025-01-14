import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/form/custom_checkbox.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_cubit.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_state.dart';
import 'package:lakoe_pos/features/account/manage_account/application/delete_account_cubit.dart';
import 'package:lakoe_pos/features/account/manage_account/application/delete_account_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:owner_repository/owner_repository.dart';

class DeleteAccountReasonScreen extends StatefulWidget {
  const DeleteAccountReasonScreen({super.key});

  @override
  State<DeleteAccountReasonScreen> createState() =>
      _DeleteAccountReasonScreenState();
}

class _DeleteAccountReasonScreenState extends State<DeleteAccountReasonScreen> {
  bool isOtherSelected = false;
  final _formKey = GlobalKey<FormBuilderState>();
  final FocusNode _otherReasonFocusNode = FocusNode();

  String phoneNumber = "";

  List<_ItemReason> listItemReason = [
    _ItemReason(isSelected: false, label: "Tutup Usaha/Tidak Lagi Membutuhkan"),
    _ItemReason(isSelected: false, label: "Masalah Teknis atau Ketidakpuasan"),
    _ItemReason(isSelected: false, label: "Perubahan Kebutuhan Bisnis"),
    _ItemReason(isSelected: false, label: "Privasi dan Keamanan Data"),
    _ItemReason(isSelected: false, label: "Lainnya"),
  ];

  @override
  initState() {
    super.initState();
    context.read<OwnerCubit>().getOwner();
  }

  @override
  void dispose() {
    _otherReasonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OwnerCubit, OwnerState>(
          listener: (context, state) async {
            if (state is OwnerLoadSuccess) {
              setState(() {
                phoneNumber = state.owner.phoneNumber;
              });
            }
            if (state is RequestFailure) {
              if (state.error.contains("429")) {
                CustomToast.show(
                  "Tunggu 10 detik lagi, ya!",
                  position: "center",
                );
              }
            }

            if (state is RequestSuccess) {
              Navigator.pushNamed(
                context,
                "/otp-input-delete-account",
                arguments: RequestOTPRes(
                  id: state.res.id,
                  target: state.res.target,
                  type: state.res.type,
                  action: state.res.action,
                ),
              );
            }
          },
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: const CustomAppbar(
            title: "Hapus Akun",
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Wrap(
                        runSpacing: 20,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextHeading3(
                                "Sebelum pergi, boleh tau alasannya?",
                                color: TColors.neutralDarkDark,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(height: 4),
                              TextBodyM(
                                "Kamu boleh pilih lebih dari satu, ya",
                                color: TColors.neutralDarkDark,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...listItemReason.map(
                                (item) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      BlocBuilder<ReasonsCubit, ReasonsState>(
                                        builder: (context, state) {
                                          return CustomCheckbox(
                                            value: item.isSelected,
                                            onChanged: (bool value) {
                                              setState(() {
                                                item.isSelected = value;
                                                context
                                                    .read<ReasonsCubit>()
                                                    .toggleReason(
                                                        item.label, value);

                                                if (item.label == "Lainnya") {
                                                  isOtherSelected = value;
                                                  if (value) {
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            _otherReasonFocusNode);
                                                  }
                                                }
                                              });
                                            },
                                          );
                                        },
                                      ),
                                      const SizedBox(width: 12),
                                      Flexible(
                                        child: TextHeading4(
                                          item.label,
                                          color: TColors.neutralDarkDark,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                margin: const EdgeInsets.only(bottom: 16.0),
                                child: FormBuilderTextField(
                                  name: "other_reason",
                                  focusNode: _otherReasonFocusNode,
                                  decoration: InputDecoration(
                                    hintText: "Tuliskan alasanmu disini",
                                    fillColor: isOtherSelected == true
                                        ? TColors.neutralLightLightest
                                        : TColors.neutralLightLight,
                                  ),
                                  maxLines: 3,
                                  onChanged: (value) {
                                    setState(() {
                                      if (value != null && value.isNotEmpty) {
                                        isOtherSelected = true;
                                        listItemReason.last.isSelected = true;
                                      } else {
                                        isOtherSelected = false;
                                        listItemReason.last.isSelected = false;
                                      }
                                      context
                                          .read<ReasonsCubit>()
                                          .updateOtherReason(value ?? '');
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BlocBuilder<ReasonsCubit, ReasonsState>(
              builder: (context, state) {
            return Container(
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: state.reasons.isNotEmpty
                        ? () {
                            context.read<OwnerCubit>().requestOTP(
                                RequestOTPDto(phoneNumber: phoneNumber));
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: TColors.neutralLightLightest,
                      backgroundColor: TColors.error,
                      minimumSize: const Size(double.infinity, 40),
                    ),
                    child: const TextActionL("Lanjut"),
                  ),
                  const SizedBox(height: 6),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: TColors.error,
                      side: const BorderSide(color: TColors.error),
                      minimumSize: const Size(double.infinity, 40),
                    ),
                    child: const TextActionL("Batal"),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _ItemReason {
  bool isSelected;
  final String label;

  _ItemReason({
    required this.isSelected,
    required this.label,
  });
}
