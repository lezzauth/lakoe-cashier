class AppConfigProvider {
  AppConfigProvider._();

  static String apiUrl = "https://api.staging.lakoe.id";
  static String wahaApiUrl = "http://207.148.117.219:3000/api";

  static void setFlavor(String flavor) {
    if (flavor == 'dev') {
      apiUrl = "https://api.staging.lakoe.id";
    } else if (flavor == 'prod') {
      apiUrl = "https://api.lakoe.id";
    }
  }
}
