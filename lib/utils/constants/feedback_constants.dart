class GoogleFormConstans {
  /// Kategori Feedback (Map)
  static const Map<String, String> categoryFeedback = {
    "Bug/Error": "Bug/Error",
    "Masalah Penggunaan": "Usage Issues",
    "Saran Fitur Baru": "Feature Request",
    "Performa Aplikasi": "Performance",
    "Desain & Tampilan": "User Experience",
    "Lainnya": "Other",
  };

  /// Opsi apakah sudah review atau belum
  static const Map<String, String> hasReviewedOption = {
    "Belum, nih.": "NO",
    "Sudah, dong!": "YES",
  };

  /// URL Google Form Feedback
  static const String formUrlFeedback =
      "https://docs.google.com/forms/d/e/1FAIpQLSdhokOn133kQoxEojThSoVKRaonzQCXZFkGIdeMyLeZxaJp7Q/formResponse";

  /// URL Google Form Vote
  static String formUrlVote =
      "https://docs.google.com/forms/d/e/1FAIpQLSdOqc5MwCqRQ-x9cYa0sDX5oOB4m04PhRFnNttG2I7yOGpuZA/formResponse";

  /// Entry ID Feedback
  static const String entryUserNameFeedback = "entry.421927269";
  static const String entryUserPhoneFeedback = "entry.1876757369";
  static const String entryAppVersion = "entry.663759347";
  static const String entryMessage = "entry.787265980";
  static const String entryCategories = "entry.1168889554";
  static const String entryReviewed = "entry.587950110";

  // Entry ID Vote Veature
  static const String entryUserNameVote = "entry.1156334316";
  static const String entryUserPhoneVote = "entry.1203291499";
  static const String entryFeature = "entry.160047057";
  static const String entryVote = "entry.1838790670";
  static const String entryWillingToContacted = "entry.1948411224";
  static const String entryWillingToPay = "entry.1761468357";

  static const Map<String, String> featureNecessityOptions = {
    "Tidak terlalu butuh": "LESS",
    "Cukup dibutuhkan": "MODERATELY",
    "Butuh banget": "HIGHLY",
  };
}
