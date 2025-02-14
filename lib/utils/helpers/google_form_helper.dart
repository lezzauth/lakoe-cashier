import 'package:http/http.dart' as http;
import 'package:lakoe_pos/utils/constants/feedback_constants.dart';
import 'package:lakoe_pos/utils/helpers/vote_helper.dart';
import 'package:logman/logman.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';

class GoogleFormHelper {
  static Future<bool> submitFeedback({
    required Map<String, dynamic> feedbackData,
    required List<String> selectedCategories,
  }) async {
    try {
      // Data yang akan dikirim
      Map<String, String> requestBody = {
        GoogleFormConstans.entryUserNameFeedback:
            feedbackData["userName"] ?? "",
        GoogleFormConstans.entryUserPhoneFeedback:
            feedbackData["phoneNumber"] ?? "",
        GoogleFormConstans.entryAppVersion: feedbackData["appVersion"] ?? "N/A",
        GoogleFormConstans.entryMessage: feedbackData["messageFeedback"] ?? "",
        GoogleFormConstans.entryReviewed: feedbackData["hasReviewed"] ?? "",
      };

      // Kategori dalam bentuk multiple choice
      Map<String, List<String>> multiSelectEntries = {
        GoogleFormConstans.entryCategories: selectedCategories,
      };

      // Encode data form satuan (input teks biasa)
      String requestBodyString = Uri(queryParameters: requestBody).query;

      // Encode data untuk multiple choice
      if (multiSelectEntries.isNotEmpty) {
        List<String> multiParams = [];
        multiSelectEntries.forEach((entryKey, values) {
          for (var value in values) {
            multiParams.add(
                "${Uri.encodeComponent(entryKey)}=${Uri.encodeComponent(value)}");
          }
        });
        if (multiParams.isNotEmpty) {
          requestBodyString += "&${multiParams.join("&")}";
        }
      }

      // Kirim request ke Google Form
      final response = await http.post(
        Uri.parse(GoogleFormConstans.formUrlFeedback),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: requestBodyString,
      );

      Logman.instance.info("Google Form Response Code: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 302) {
        return true;
      } else {
        throw Exception("Failed to send feedback: ${response.statusCode}");
      }
    } catch (e) {
      Logman.instance.error("Error while sending feedback: $e");

      CustomToast.show(
        "Failed to send feedback, coba lagi!",
        position: "bottom",
      );

      return false;
    }
  }

  static Future<bool> submitVote({
    required Map<String, dynamic> feedbackData,
  }) async {
    try {
      bool alreadyVoted = await VoteHelper.hasUserVoted(
        feedbackData["phoneNumber"],
        feedbackData["featureName"],
      );
      if (alreadyVoted) {
        CustomToast.show(
          "Kamu sudah voting untuk fitur ini!",
          position: "bottom",
          duration: 5,
        );
        return false;
      }

      Map<String, dynamic> requestBody = {
        GoogleFormConstans.entryUserNameVote: feedbackData["userName"] ?? "",
        GoogleFormConstans.entryUserPhoneVote:
            feedbackData["phoneNumber"] ?? "",
        GoogleFormConstans.entryFeature: feedbackData["featureName"] ?? "",
        GoogleFormConstans.entryVote: feedbackData["vote"] ?? "",
        GoogleFormConstans.entryWillingToContacted:
            feedbackData["willingToContacted"] ? "YES" : "NO",
        GoogleFormConstans.entryWillingToPay:
            feedbackData["willingToPay"] ?? "",
      };

      final response = await http.post(
        Uri.parse(GoogleFormConstans.formUrlVote),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: requestBody,
      );

      Logman.instance.info("Google Form Response Code: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 302) {
        return true;
      } else {
        throw Exception("Failed to send vote: ${response.statusCode}");
      }
    } catch (e) {
      Logman.instance.error("Error while sending vote: $e");

      CustomToast.show(
        "Gagal mengirim vote, coba lagi!",
        position: "bottom",
      );

      return false;
    }
  }
}
