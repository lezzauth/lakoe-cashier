import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lakoe_pos/common/widgets/bottomsheets/success_feedback_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:lakoe_pos/utils/helpers/app_info_helper.dart';
import 'package:lakoe_pos/utils/helpers/google_form_helper.dart';
import 'package:owner_repository/owner_repository.dart';

class SuggestFeatureBottomsheet {
  static void show(
    BuildContext context,
    OwnerProfileModel profile,
  ) {
    final formKey = GlobalKey<FormBuilderState>();
    bool isSubmitting = false;
    String? appVersion;
    bool isFormValid = false;

    // Load App Version sebelum submit
    AppInfoHelper.getAppVersion().then((version) {
      appVersion = "v$version";
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CustomBottomsheet(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: StatefulBuilder(builder: (context, setState) {
              return FormBuilder(
                key: formKey,
                onChanged: () {
                  setState(() {
                    isFormValid =
                        formKey.currentState?.saveAndValidate() ?? false;
                  });
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextHeading2("Terus, kamu butuhnya fitur apa?"),
                        SizedBox(height: 20),
                        FormBuilderTextField(
                          name: "messageFeedback",
                          decoration: const InputDecoration(
                            hintText:
                                "Sampaikan fitur apa yang paling kamu butuhkan untuk bisa membantu bisnis kamu lebih baik.",
                          ),
                          maxLines: 8,
                          validator: FormBuilderValidators.required(
                              errorText:
                                  ErrorTextStrings.required(name: "Pesan")),
                        ),
                        SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: isFormValid && !isSubmitting
                                ? () async {
                                    // Disable tombol saat submit
                                    setState(() {
                                      isSubmitting = true;
                                    });

                                    // Ambil nilai input dari form
                                    final formData =
                                        formKey.currentState!.value;

                                    // Siapkan data feedback
                                    final feedbackData = {
                                      "userName": profile.name,
                                      "phoneNumber": profile.phoneNumber,
                                      "appVersion": appVersion ?? "N/A",
                                      "categoryFeedback": ["Feature Request"],
                                      "messageFeedback":
                                          formData["messageFeedback"],
                                      "hasReviewed": null,
                                    };

                                    // Kirim ke Google Form
                                    bool success =
                                        await GoogleFormHelper.submitFeedback(
                                      feedbackData: feedbackData,
                                      selectedCategories: ["Feature Request"],
                                    );

                                    if (success) {
                                      if (!context.mounted) return;
                                      Navigator.pop(context);
                                      SuccessFeedbackBottomsheet.show(
                                        context,
                                        openInFeedbackScreen: false,
                                      );
                                    }

                                    setState(() {
                                      isSubmitting = false;
                                    });
                                  }
                                : null,
                            child: isSubmitting
                                ? SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : TextActionL("Kirimkan"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
