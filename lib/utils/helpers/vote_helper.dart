import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'dart:convert';

import 'package:logman/logman.dart';

class VoteHelper {
  static String spreadsheetId = "1bchrOOp8VZFV1NyBIIoQ27B-avlO7XMUrwOMMRXejIc";
  static String apiKey = dotenv.env['GSHEET_API_KEY'] ?? "";
  static String sheetName = "VoteFeature";
  static String googleFormUrl =
      "https://docs.google.com/forms/d/e/1FAIpQLSdOqc5MwCqRQ-x9cYa0sDX5oOB4m04PhRFnNttG2I7yOGpuZA/formResponse";

  // Entry ID from Google Form
  static const String entryUserName = "entry.1156334316";
  static const String entryUserPhone = "entry.1203291499";
  static const String entryFeature = "entry.160047057";
  static const String entryVote = "entry.1838790670";
  static const String entryWillingToPay = "entry.1634682856";

  /// Check whether the user has voted based on the mobile number
  static Future<bool> hasUserVoted(String userPhone, String featureName) async {
    final url = Uri.parse(
        "https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/$sheetName!C:D?key=$apiKey");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> values = jsonDecode(response.body)['values'];

        for (var row in values.skip(1)) {
          if (row.length >= 2) {
            String phone = row[0];
            String feature = row[1];

            if (phone == userPhone && feature == featureName) {
              return true;
            }
          }
        }
      }
    } catch (e) {
      Logman.instance.error("Error checking vote: $e");
    }
    return false;
  }

  static Future<bool> submitVote({
    required String userName,
    required String userPhone,
    required String featureName,
    required String vote,
    required bool willingToPay,
  }) async {
    bool alreadyVoted = await hasUserVoted(userPhone, featureName);
    if (alreadyVoted) {
      Logman.instance.info("Users who have already voted cannot vote again.");
      CustomToast.show(
        "Kamu sudah pernah mengirimkan vote fitur ini.",
        position: "bottom",
      );
      return false;
    }

    final response = await http.post(
      Uri.parse(googleFormUrl),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        entryUserName: userName,
        entryUserPhone: userPhone,
        entryFeature: featureName,
        entryVote: vote,
        entryWillingToPay: willingToPay ? "YES" : "NO",
      },
    );

    return response.statusCode == 200 || response.statusCode == 0;
  }

  static Future<int> fetchYesVotesCount({required String featureName}) async {
    final url = Uri.parse(
        "https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/$sheetName!D:E?key=$apiKey");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> values = jsonDecode(response.body)['values'];
        int yesCount = 0;

        for (var row in values.skip(1)) {
          if (row.length >= 2) {
            String feature = row[0];
            String vote = row[1];
            if (feature == featureName && vote == "YES") {
              yesCount++;
            }
          }
        }
        return yesCount;
      }
    } catch (e) {
      Logman.instance.error("Error fetching votes: $e");
    }
    return 0;
  }
}
