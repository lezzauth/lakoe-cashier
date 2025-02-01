import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/form/form_label.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:logman/logman.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

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

  final Map<String, String> categoryFeedback = {
    "Bug/Error": "Bug/Error",
    "Masalah Penggunaan": "Usage Issues",
    "Saran Fitur Baru": "Request Feature",
    "Performa Aplikasi": "Performance",
    "Desain & Tampilan": "User Experience",
    "Lainnya": "Other"
  };

  final Map<String, String> hasReviewedOption = {
    "Belum, nih.": "NO",
    "Sudah, dong!": "YES",
  };

  List<String> selectedCategories = [];
  String? hasReviewed;
  String? appVersion;

  final String googleFormUrl =
      "https://docs.google.com/forms/d/e/1FAIpQLSdhokOn133kQoxEojThSoVKRaonzQCXZFkGIdeMyLeZxaJp7Q/formResponse";

  final String entryUserName = "entry.421927269";
  final String entryUserPhone = "entry.1876757369";
  final String entryAppVersion = "entry.663759347";
  final String entryMessage = "entry.787265980";
  final String entryCategories = "entry.1168889554";
  final String entryReviewed = "entry.587950110";

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
    final packageInfo = await PackageInfo.fromPlatform();
    return "v${packageInfo.version}";
  }

  void _onSubmit() {
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

      _sendFeedbackToGoogleForm(feedbackData);
    } else {
      Logman.instance.error("Form tidak valid!");
    }
  }

  Future<void> _sendFeedbackToGoogleForm(
      Map<String, dynamic> feedbackData) async {
    try {
      Map<String, String> requestBody = {
        entryUserName: feedbackData["userName"] ?? "",
        entryUserPhone: feedbackData["phoneNumber"] ?? "",
        entryAppVersion: feedbackData["appVersion"] ?? "N/A",
        entryMessage: feedbackData["messageFeedback"] ?? "",
        entryReviewed: feedbackData["hasReviewed"] ?? "",
      };

      List<String> categoryParams = [];
      for (var category in selectedCategories) {
        categoryParams.add(
            "${Uri.encodeComponent(entryCategories)}=${Uri.encodeComponent(category)}");
      }

      String requestBodyString = Uri(queryParameters: requestBody).query;
      if (categoryParams.isNotEmpty) {
        requestBodyString += "&${categoryParams.join("&")}";
      }

      final response = await http.post(
        Uri.parse(googleFormUrl),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: requestBodyString,
      );

      Logman.instance.info("statusCode: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 302) {
        openBottomsheetSuccessSubmit();

        setState(() {
          _isSubmitting = false;
          selectedCategories = [];
        });

        _formKey.currentState?.reset();
      } else {
        throw Exception("Gagal mengirim feedback: ${response.statusCode}");
      }
    } catch (e) {
      Logman.instance.error("Error while sending feedback: $e");

      CustomToast.show(
        "Gagal mengirim feedback, coba lagi!",
        position: "bottom",
      );

      setState(() {
        _isSubmitting = false;
      });
    }
  }

  void openBottomsheetSuccessSubmit() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CustomBottomsheet(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      TImages.feedbackSuccess,
                      height: 72,
                    ),
                    SizedBox(height: 16),
                    TextHeading3(
                      "Terimakasih atas masukannya",
                      color: TColors.neutralDarkDark,
                    ),
                    SizedBox(height: 4),
                    TextBodyM(
                      "Masukan kamu udah kita terima dan akan kita pelajari. Yuk, tetap pakai Lakoe POS dan bantu kami jadi lebih baik!",
                      color: TColors.neutralDarkDark,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: TextActionL("Oke, Sip!"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
