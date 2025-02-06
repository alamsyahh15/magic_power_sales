import 'dart:convert';

ResponseData responseDataFromJson(String str) =>
    ResponseData.fromJson(json.decode(str));
String responseDataToJson(ResponseData data) => json.encode(data.toJson());

class ResponseData {
  const ResponseData({
    this.code,
    this.message,
    this.data,
  });

  final int? code;
  final String? message;
  final dynamic data;

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
        code: json["code"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data,
      };
}
