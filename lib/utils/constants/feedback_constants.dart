class FeedbackConstants {
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

  /// URL Google Form untuk mengirim feedback
  static const String googleFormUrl =
      "https://docs.google.com/forms/d/e/1FAIpQLSdhokOn133kQoxEojThSoVKRaonzQCXZFkGIdeMyLeZxaJp7Q/formResponse";

  /// Entry ID dari form Google untuk tiap field
  static const String entryUserName = "entry.421927269";
  static const String entryUserPhone = "entry.1876757369";
  static const String entryAppVersion = "entry.663759347";
  static const String entryMessage = "entry.787265980";
  static const String entryCategories = "entry.1168889554";
  static const String entryReviewed = "entry.587950110";
}
