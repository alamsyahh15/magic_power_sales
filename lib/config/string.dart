import 'package:flutter/foundation.dart';

class Strings {
  Strings._();

  static const String appName = "Magic Power Sales";
  static const String copyRight =
      "©2021 Magic Power Indonesia. All Rights Reserved. Magic Power Wet Tissue merupakan brand yang berada di bawah naungan PT. Etica Sari Pratama.";
  static const String prodUrl = "http://159.65.130.83:1337/api";
  static const String devUrl = "http://152.42.179.244:1337/api";

  static const String baseUrl = kDebugMode ? devUrl : prodUrl;

  static const String pendingStatus = "Pending";
  static const String approvedStatus = "Approved";
  static const String rejectStatus = "Rejected";
  static const String samplePhoto =
      "https://cdn.hasselblad.com/f/77891/1000x1000/8a10055e43/hasselblad-xcd-75p-sample-image-0.jpg";
}
