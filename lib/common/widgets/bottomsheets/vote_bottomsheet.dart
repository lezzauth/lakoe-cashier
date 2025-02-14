import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/form/custom_checkbox.dart';
import 'package:lakoe_pos/common/widgets/form/custom_radio.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_cubit.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_state.dart';
import 'package:lakoe_pos/features/print/common/helpers/animated_dots_text.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/feedback_constants.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:lakoe_pos/utils/helpers/google_form_helper.dart';
import 'package:lakoe_pos/utils/helpers/vote_helper.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:lakoe_pos/common/widgets/bottomsheets/suggest_feature_bottomsheet.dart';

class VoteBottomSheetHelper {
  static void show({
    required BuildContext context,
    String title = "Seberapa kamu butuh fitur ini?",
    required String featureName,
    required String featureDesc,
  }) {
    if (featureName != "MultiOutlet") {
      context.read<OwnerCubit>().getOwner();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _VoteBottomSheetContent(
        title: title,
        featureName: featureName,
        featureDesc: featureDesc,
      ),
    );
  }
}

class _VoteBottomSheetContent extends StatefulWidget {
  final String title;
  final String featureName;
  final String featureDesc;

  const _VoteBottomSheetContent({
    required this.title,
    required this.featureName,
    required this.featureDesc,
  });

  @override
  State<_VoteBottomSheetContent> createState() =>
      _VoteBottomSheetContentState();
}

class _VoteBottomSheetContentState extends State<_VoteBottomSheetContent> {
  String selectedVote = "";
  bool willingToContacted = false;
  late Future<Map<String, double>> votePercentageFuture;
  late Future<int> voteCountFuture;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    votePercentageFuture =
        VoteHelper.fetchVotesPercentage(featureName: widget.featureName);
    voteCountFuture =
        VoteHelper.fetchVotesCount(featureName: widget.featureName);
  }

  Future<void> _handleSubmit(OwnerProfileModel owner) async {
    final feedbackData = {
      "userName": owner.name,
      "phoneNumber": owner.phoneNumber,
      "featureName": widget.featureName,
      "vote": selectedVote,
      "willingToContacted": willingToContacted,
      "willingToPay": null,
    };

    final success =
        await GoogleFormHelper.submitVote(feedbackData: feedbackData);

    if (success) {
      setState(_initializeData);
      CustomToast.show(
        "Vote berhasil dikirim.",
        position: "bottom",
        backgroundColor: TColors.success,
      );
      if (!mounted) return;
      Navigator.pop(context);
    } else {
      if (!mounted) return;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomsheet(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(widget.title),
            const SizedBox(height: 4),
            _buildDescription(),
            const SizedBox(height: 16),
            _buildVoteOptions(),
            const SizedBox(height: 16),
            _buildVoteCount(),
            const SizedBox(height: 20),
            _buildContactConsent(),
            const SizedBox(height: 20),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String title) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(TImages.vote, height: 72),
          const SizedBox(height: 16),
          TextHeading2(
            title,
            color: TColors.neutralDarkDark,
          ),
        ],
      );

  Widget _buildDescription() => Text.rich(
        style: GoogleFonts.inter(
          fontSize: TSizes.fontSizeBodyM,
          color: TColors.neutralDarkDark,
        ),
        TextSpan(
          text: "Kami ingin menambahkan fitur ",
          children: [
            TextSpan(
              text: widget.featureDesc,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                color: TColors.neutralDarkDark,
              ),
            ),
            TextSpan(
              text:
                  ". Kalau menurutmu ini penting, kasih vote supaya kami tahu!",
            ),
          ],
        ),
      );

  Widget _buildVoteOptions() => Column(
        children:
            GoogleFormConstans.featureNecessityOptions.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: _VoteOptionItem(
              entry: entry,
              selectedValue: selectedVote,
              votePercentageFuture: votePercentageFuture,
              onChanged: (value) => setState(() {
                selectedVote = value;
                if (value == "LESS") willingToContacted = false;
              }),
            ),
          );
        }).toList(),
      );

  Widget _buildVoteCount() => FutureBuilder<int>(
        future: voteCountFuture,
        builder: (context, snapshot) => Row(
          children: [
            SvgPicture.asset(TImages.voteCount, height: 16),
            const SizedBox(width: 4),
            _buildVoteCountText(snapshot),
          ],
        ),
      );

  Widget _buildVoteCountText(AsyncSnapshot<int> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return AnimatedLoadingText(
        "Vote masuk: ",
        style: TextStyle(
          fontSize: TSizes.fontSizeBodyM,
          color: TColors.neutralDarkDark,
        ),
      );
    }

    return Text.rich(
      style: GoogleFonts.inter(
        fontSize: TSizes.fontSizeHeading4,
      ),
      TextSpan(
        children: [
          TextSpan(
            text: "Vote masuk: ",
          ),
          TextSpan(
            text: snapshot.hasData ? "${snapshot.data} Orang" : "-",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactConsent() => Visibility(
        visible: selectedVote != 'LESS',
        child: _ContactConsentCheckbox(
          value: willingToContacted,
          onChanged: (value) => setState(() => willingToContacted = value),
        ),
      );

  Widget _buildActionButtons() => BlocBuilder<OwnerCubit, OwnerState>(
        builder: (context, state) {
          final owner = state is OwnerLoadSuccess ? state.owner : null;
          final isOwnerLoaded = owner != null;

          return Row(
            children: [
              Expanded(child: _SkipButton(owner: owner)),
              const SizedBox(width: 16),
              Expanded(
                  child: _SubmitButton(
                isEnabled: isOwnerLoaded && selectedVote.isNotEmpty,
                onPressed: () => _handleSubmit(owner!),
              )),
            ],
          );
        },
      );
}

class _VoteOptionItem extends StatelessWidget {
  final MapEntry<String, String> entry;
  final String selectedValue;
  final Future<Map<String, double>> votePercentageFuture;
  final ValueChanged<String> onChanged;

  const _VoteOptionItem({
    required this.entry,
    required this.selectedValue,
    required this.votePercentageFuture,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(entry.value),
      child: FutureBuilder<Map<String, double>>(
        future: votePercentageFuture,
        builder: (context, snapshot) => Stack(
          children: [
            _buildBackgroundBar(),
            _buildPercentageBar(snapshot),
            _buildOptionContent(snapshot),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundBar() => Container(
        height: 48,
        decoration: BoxDecoration(
          color: TColors.neutralLightLight,
          border: Border.all(
            color: TColors.neutralLightMedium,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      );

  Widget _buildPercentageBar(AsyncSnapshot<Map<String, double>> snapshot) {
    final percentage = snapshot.data?[entry.value] ?? 0;
    return FractionallySizedBox(
      widthFactor: percentage / 100,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: TColors.warningMedium,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildOptionContent(AsyncSnapshot<Map<String, double>> snapshot) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
      child: Row(
        children: [
          CustomRadio(
            value: entry.value,
            groupValue: selectedValue,
            onChanged: (value) => onChanged(value.toString()),
          ),
          const SizedBox(width: 8),
          Expanded(child: TextHeading4(entry.key)),
          const SizedBox(width: 8),
          _buildPercentageText(snapshot),
        ],
      ),
    );
  }

  Widget _buildPercentageText(AsyncSnapshot<Map<String, double>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return AnimatedLoadingText("");
    }

    final percentage = snapshot.data?[entry.value] ?? 0;
    return TextBodyM("${percentage.toStringAsFixed(0)}%");
  }
}

class _ContactConsentCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ContactConsentCheckbox({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
        decoration: BoxDecoration(
          color: TColors.neutralLightLight,
          border: Border.all(color: TColors.neutralLightMedium),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(child: TextHeading4("Bersedia untuk kita dihubungi?")),
            const SizedBox(width: 20),
            CustomCheckbox(value: value, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  final OwnerProfileModel? owner;

  const _SkipButton({this.owner});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: owner == null
          ? null
          : () {
              Navigator.pop(context);
              SuggestFeatureBottomsheet.show(context, owner!);
            },
      child: TextActionL("Skip Dulu"),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onPressed;

  const _SubmitButton({
    required this.isEnabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      child: TextActionL("Kirim Vote"),
    );
  }
}
