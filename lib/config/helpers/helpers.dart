import 'package:magic_power_sales/config/string.dart';

bool isEmpty(dynamic data) {
  String? dataString = '$data';
  return ['', 'null', '{}', '0', '[]'].contains(dataString);
}

bool lengthMoreThan(String value, [int length = 8]) {
  return value.length >= length;
}

bool containLowerCase(String value, [int length = 1]) {
  return value.contains(RegExp("(?:[^a-z]*[a-z]){$length}"));
}

bool containUpperCase(String value, [int length = 1]) {
  return value.contains(RegExp("(?:[^A-Z]*[A-Z]){$length}"));
}

bool containNumber(String value) {
  return value.contains(RegExp(r'\d'));
}

bool containSpecialCharacter(String value) {
  return !value.contains(RegExp(r'([!@#$%&*]+$){1}'));
}

String? validateEmail(String? val) {
  if (val == null || val.isEmpty) {
    return 'Required';
  } else if (!val.contains("@") || !val.contains(".")) {
    return 'Wrong email format';
  }
  return null;
}

String? validateRequiredNumber(String? val) {
  if (val == null || val.isEmpty) {
    return 'Required';
  } else if (!isNumeric(val)) {
    return 'Only Number';
  }
  return null;
}

bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

String? validateRequired(dynamic val) {
  if (val == null || val.toString().isEmpty) {
    return 'Required';
  }
  return null;
}

String formatPhotoUrl(String? pathUrl) {
  pathUrl ??= Strings.samplePhoto;
  if (!['http', 'https'].any((e) => pathUrl!.contains(e))) {
    String baseUrl = Strings.baseUrl.replaceAll("/api", "");
    return baseUrl + pathUrl;
  }
  return pathUrl;
}
