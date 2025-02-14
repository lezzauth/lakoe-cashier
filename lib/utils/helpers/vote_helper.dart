import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:logman/logman.dart';

class VoteHelper {
  static String spreadsheetId = "1bchrOOp8VZFV1NyBIIoQ27B-avlO7XMUrwOMMRXejIc";
  static String apiKey = dotenv.env['GSHEET_API_KEY'] ?? "";
  static String sheetName = "VoteFeature";

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

  static Future<Map<String, double>> fetchVotesPercentage({
    required String featureName,
  }) async {
    final url = Uri.parse(
        "https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/$sheetName!D:E?key=$apiKey");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> values = jsonDecode(response.body)['values'];
        int totalVotes = 0;
        Map<String, int> voteCounts = {"LESS": 0, "MODERATELY": 0, "HIGHLY": 0};

        for (var row in values.skip(1)) {
          if (row.length >= 2) {
            String feature = row[0];
            String vote = row[1];

            if (feature == featureName) {
              totalVotes++;
              if (voteCounts.containsKey(vote)) {
                voteCounts[vote] = voteCounts[vote]! + 1;
              }
            }
          }
        }

        Map<String, double> votePercentages = {};
        if (totalVotes > 0) {
          voteCounts.forEach((key, count) {
            votePercentages[key] = (count / totalVotes) * 100;
          });
        }

        Logman.instance.info("Vote percentages: $votePercentages");
        return votePercentages;
      }
    } catch (e) {
      Logman.instance.error("Error fetching votes: $e");
    }

    return {"LESS": 0, "MODERATELY": 0, "HIGHLY": 0};
  }

  static Future<int> fetchVotesCount({required String featureName}) async {
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
            if (feature == featureName) {
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
