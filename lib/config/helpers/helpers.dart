import 'package:magic_power_sales/config/string.dart';

bool isEmpty(dynamic data) {
  String? dataString = '$data';
  return ['', 'null', '{}', '0', '[]'].contains(dataString);
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
