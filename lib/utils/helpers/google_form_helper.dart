import 'package:http/http.dart' as http;
import 'package:lakoe_pos/utils/constants/feedback_constants.dart';
import 'package:logman/logman.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';

class GoogleFormHelper {
  static Future<bool> sendFeedbackToGoogleForm({
    required Map<String, dynamic> feedbackData,
    required List<String> selectedCategories,
  }) async {
    try {
      // Data yang akan dikirim
      Map<String, String> requestBody = {
        FeedbackConstants.entryUserName: feedbackData["userName"] ?? "",
        FeedbackConstants.entryUserPhone: feedbackData["phoneNumber"] ?? "",
        FeedbackConstants.entryAppVersion: feedbackData["appVersion"] ?? "N/A",
        FeedbackConstants.entryMessage: feedbackData["messageFeedback"] ?? "",
        FeedbackConstants.entryReviewed: feedbackData["hasReviewed"] ?? "",
      };

      // Kategori dalam bentuk multiple choice
      Map<String, List<String>> multiSelectEntries = {
        FeedbackConstants.entryCategories: selectedCategories,
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
        Uri.parse(FeedbackConstants.googleFormUrl),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: requestBodyString,
      );

      Logman.instance.info("Google Form Response Code: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 302) {
        return true;
      } else {
        throw Exception("Gagal mengirim feedback: ${response.statusCode}");
      }
    } catch (e) {
      Logman.instance.error("Error while sending feedback: $e");

      CustomToast.show(
        "Gagal mengirim feedback, coba lagi!",
        position: "bottom",
      );

      return false;
    }
  }
}
