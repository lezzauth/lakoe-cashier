class ErrorTextStrings {
  ErrorTextStrings._();

  static String required({String? name}) {
    return "Kolom ${name ?? "ini"} wajib diisi.";
  }

  static String email({String? name}) {
    return "Masukkan alamat email yang valid";
  }

  static String minLength(
      {String? name, bool isNumber = false, required int minLength}) {
    return "Minimal $minLength ${isNumber ? "angka" : "karakter"}.";
  }

  static String maxLength(
      {String? name, bool isNumber = false, required int maxLength}) {
    return "Maksimal $maxLength ${isNumber ? "angka" : "karakter"}.";
  }

  static String equalLength(
      {String? name, bool isNumber = false, required int maxLength}) {
    return "Harus $maxLength ${isNumber ? "angka" : "karakter"}.";
  }

  static String min({String? name, required int min}) {
    return "Nilai minimal $min.";
  }

  static String max({String? name, required int max}) {
    return "Nilai maksimal $max.";
  }

  static String url({String? name}) {
    return "Masukkan URL yang valid.";
  }

  static String numeric({String? name}) {
    return "Nilai harus berupa angka.";
  }

  static String formInvalid() {
    return "Form tidak valid.";
  }
}
