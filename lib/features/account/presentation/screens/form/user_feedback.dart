import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/bottomsheets/success_feedback_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/form/form_label.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:lakoe_pos/utils/constants/feedback_constants.dart';
import 'package:lakoe_pos/utils/helpers/app_info_helper.dart';
import 'package:lakoe_pos/utils/helpers/google_form_helper.dart';
import 'package:logman/logman.dart';
import 'package:owner_repository/owner_repository.dart';

class UserFeedbackScreen extends StatelessWidget {
  final OwnerProfileModel arguments;

  const UserFeedbackScreen({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return UserFeedback(profile: arguments);
  }
}

class UserFeedback extends StatefulWidget {
  const UserFeedback({super.key, required this.profile});

  final OwnerProfileModel profile;

  @override
  State<UserFeedback> createState() => _UserFeedbackState();
}

class _UserFeedbackState extends State<UserFeedback> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool _isSubmitting = false;

  List<String> selectedCategories = [];
  String? hasReviewed;
  String? appVersion;

  final Map<String, String> categoryFeedback =
      FeedbackConstants.categoryFeedback;
  final Map<String, String> hasReviewedOption =
      FeedbackConstants.hasReviewedOption;

  final String googleFormUrl = FeedbackConstants.googleFormUrl;
  final String entryUserName = FeedbackConstants.entryUserName;
  final String entryUserPhone = FeedbackConstants.entryUserPhone;
  final String entryAppVersion = FeedbackConstants.entryAppVersion;
  final String entryMessage = FeedbackConstants.entryMessage;
  final String entryCategories = FeedbackConstants.entryCategories;
  final String entryReviewed = FeedbackConstants.entryReviewed;

  @override
  void initState() {
    super.initState();
    getAppVersion().then((version) {
      setState(() {
        appVersion = version;
      });
    });
  }

  Future<String> getAppVersion() async {
    String version = await AppInfoHelper.getAppVersion();
    return "v$version";
  }

  void _onSubmit() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      setState(() {
        _isSubmitting = true;
      });

      FocusScope.of(context).unfocus();

      final formData = _formKey.currentState!.value;

      final feedbackData = {
        "userName": widget.profile.name,
        "phoneNumber": widget.profile.phoneNumber,
        "appVersion": appVersion ?? "N/A",
        "categoryFeedback": selectedCategories,
        "messageFeedback": formData["messageFeedback"],
        "hasReviewed": formData["hasReviewed"],
      };

      bool success = await GoogleFormHelper.sendFeedbackToGoogleForm(
        feedbackData: feedbackData,
        selectedCategories: selectedCategories,
      );

      if (success) {
        if (!mounted) return;
        SuccessFeedbackBottomsheet.show(context);

        setState(() {
          _isSubmitting = false;
          selectedCategories = [];
        });

        _formKey.currentState?.reset();
      } else {
        setState(() {
          _isSubmitting = false;
        });
      }
    } else {
      Logman.instance.error("Form tidak valid!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Kritik & Saran",
      ),
      body: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormLabel("Kategori"),
                          FormBuilderField<List<String>>(
                            name: "categoryFeedback",
                            builder: (field) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    alignment: WrapAlignment.start,
                                    spacing: 8.0,
                                    children: categoryFeedback.keys.map((type) {
                                      bool selected = selectedCategories
                                          .contains(categoryFeedback[type]);

                                      return FilterChip(
                                        label: selected
                                            ? TextHeading4(type,
                                                color: TColors.primary)
                                            : TextBodyM(type),
                                        selected: selected,
                                        onSelected: (bool value) {
                                          setState(() {
                                            if (value) {
                                              selectedCategories
                                                  .add(categoryFeedback[type]!);
                                            } else {
                                              selectedCategories.remove(
                                                  categoryFeedback[type]!);
                                            }
                                            field.didChange(selectedCategories);
                                          });
                                        },
                                      );
                                    }).toList(),
                                  ),
                                  if (field.errorText != null)
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 0, left: 12),
                                      child: TextBodyS(
                                        field.errorText!,
                                        color: TColors.error,
                                      ),
                                    ),
                                ],
                              );
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return ErrorTextStrings.required(
                                    name: "Kategori");
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FormLabel(
                          "Pesan yang mau disampaikan",
                        ),
                        FormBuilderTextField(
                          name: "messageFeedback",
                          decoration: const InputDecoration(
                            hintText: "Tuliskan pesan kamu untuk Lakoe disini…",
                          ),
                          maxLines: 8,
                          validator: FormBuilderValidators.required(
                              errorText:
                                  ErrorTextStrings.required(name: "Pesan")),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormLabel(
                              "Apa kamu sudah kasih review di Playstore?"),
                          FormBuilderField(
                            name: "hasReviewed",
                            builder: (field) {
                              return Wrap(
                                alignment: WrapAlignment.start,
                                spacing: 8.0,
                                children: hasReviewedOption.keys.map((type) {
                                  bool selected =
                                      hasReviewedOption[type] == field.value;

                                  return InputChip(
                                    label: selected
                                        ? TextHeading4(
                                            type,
                                            color: TColors.primary,
                                          )
                                        : TextBodyM(type),
                                    selected: selected,
                                    onPressed: () {
                                      field.didChange(hasReviewedOption[type]);
                                      setState(() {
                                        hasReviewed = hasReviewedOption[type];
                                      });
                                    },
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: TColors.neutralLightMedium,
                  ),
                ),
              ),
              width: double.infinity,
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _onSubmit,
                  child: _isSubmitting
                      ? SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                            color: TColors.neutralLightLightest,
                            strokeWidth: 2,
                          ),
                        )
                      : const TextActionL("Kirimkan"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
