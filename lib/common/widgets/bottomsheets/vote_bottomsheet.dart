import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/widgets/bottomsheets/suggest_feature_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/form/custom_checkbox.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_cubit.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_state.dart';
import 'package:lakoe_pos/features/print/common/helpers/animated_dots_text.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:lakoe_pos/utils/helpers/vote_helper.dart';
import 'package:owner_repository/owner_repository.dart';

class VoteBottomSheetHelper {
  static void show({
    required BuildContext context,
    required String featureName,
    required String featureDesc,
    required Function() onVoteSuccess,
  }) {
    bool willingToPay = false;
    context.read<OwnerCubit>().getOwner();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CustomBottomsheet(
          child: StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      TImages.vote,
                      height: 72,
                    ),
                    SizedBox(height: 16),
                    TextHeading2(
                      "Kamu butuh fitur ini?",
                      color: TColors.neutralDarkDark,
                    ),
                    SizedBox(height: 4),
                    TextBodyM(
                      "Kami berencana menambahkan fitur $featureDesc. Kalau menurutmu ini penting, kasih vote supaya kami tahu!",
                      color: TColors.neutralDarkDark,
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          willingToPay = !willingToPay;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16, 12, 12, 12),
                        decoration: BoxDecoration(
                          color: TColors.neutralLightLight,
                          border: Border.all(
                            color: TColors.neutralLightMedium,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextHeading4(
                                "Bersedia membayar untuk fitur ini?",
                                color: TColors.neutralDarkDark,
                              ),
                            ),
                            SizedBox(width: 20),
                            CustomCheckbox(
                              value: willingToPay,
                              onChanged: (bool value) {
                                setState(() {
                                  willingToPay = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    FutureBuilder<int>(
                      future: VoteHelper.fetchYesVotesCount(
                        featureName: featureName,
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Row(
                            children: [
                              SvgPicture.asset(
                                TImages.voteCount,
                                height: 16,
                              ),
                              SizedBox(width: 4),
                              AnimatedLoadingText(
                                "Vote YES: ",
                                style: TextStyle(
                                  fontSize: TSizes.fontSizeBodyM,
                                  color: TColors.neutralDarkDark,
                                ),
                              )
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Row(
                            children: [
                              SvgPicture.asset(
                                TImages.voteCount,
                                height: 16,
                              ),
                              SizedBox(width: 4),
                              Row(
                                children: [
                                  TextBodyM("Vote masuk: "),
                                  TextHeading4("-"),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return Row(
                            children: [
                              SvgPicture.asset(
                                TImages.voteCount,
                                height: 16,
                              ),
                              SizedBox(width: 4),
                              Row(
                                children: [
                                  TextBodyM("Vote masuk: "),
                                  TextHeading4("${snapshot.data} Orang"),
                                ],
                              ),
                            ],
                          );
                        }
                      },
                    ),
                    SizedBox(height: 24),
                    BlocBuilder<OwnerCubit, OwnerState>(
                        builder: (context, state) {
                      OwnerProfileModel? owner;
                      bool isSuccessGetOwner = false;

                      if (state is OwnerLoadSuccess) {
                        owner = state.owner;
                        isSuccessGetOwner = true;
                      } else if (state is OwnerLoadInProgress) {
                        owner = null;
                        isSuccessGetOwner = false;
                      } else {
                        owner = null;
                        isSuccessGetOwner = false;
                      }
                      return Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed:
                                  (!isSuccessGetOwner || willingToPay == true)
                                      ? null
                                      : () async {
                                          bool success =
                                              await VoteHelper.submitVote(
                                            userName: owner?.name ?? "",
                                            userPhone: owner?.phoneNumber ?? "",
                                            featureName: featureName,
                                            vote: "NO",
                                            willingToPay: willingToPay,
                                          );
                                          if (!context.mounted) return;
                                          if (success) {
                                            onVoteSuccess();
                                            Navigator.pop(context);
                                            SuggestFeatureBottomsheet.show(
                                                context, owner!);
                                          } else {
                                            Navigator.pop(context);
                                          }
                                        },
                              child: TextActionL("Belum Butuh"),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: !isSuccessGetOwner
                                  ? null
                                  : () async {
                                      bool success =
                                          await VoteHelper.submitVote(
                                        userName: owner?.name ?? "",
                                        userPhone: owner?.phoneNumber ?? "",
                                        featureName: featureName,
                                        vote: "YES",
                                        willingToPay: willingToPay,
                                      );
                                      if (!context.mounted) return;
                                      if (success) {
                                        onVoteSuccess();
                                        Navigator.pop(context);
                                      } else {
                                        Navigator.pop(context);
                                      }
                                    },
                              child: TextActionL("Butuh Banget"),
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: 16),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
