// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);

import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  int? id;
  String? username;
  String? email;
  dynamic resetPasswordToken;
  bool? confirmed;
  bool? blocked;
  String? fullName;
  String? address;
  String? phoneNumber;
  dynamic initDistributorId;
  String? shopName;
  int? level;
  int? totalCartons;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? totalCartonsPending;
  String? totalTransactionPending;
  bool? isVerified;
  int? sprayPcs;
  int? tissuePcs;
  dynamic pointZenny;
  dynamic areaCode;
  String? profilePic;
  List<dynamic>? claimMissions;
  String? role;

  Customer({
    this.id,
    this.username,
    this.email,
    this.resetPasswordToken,
    this.confirmed,
    this.blocked,
    this.fullName,
    this.address,
    this.phoneNumber,
    this.initDistributorId,
    this.shopName,
    this.level,
    this.totalCartons,
    this.createdAt,
    this.updatedAt,
    this.totalCartonsPending,
    this.totalTransactionPending,
    this.isVerified,
    this.sprayPcs,
    this.tissuePcs,
    this.pointZenny,
    this.areaCode,
    this.profilePic,
    this.claimMissions,
    this.role,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        resetPasswordToken: json["resetPasswordToken"],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        fullName: json["full_name"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        initDistributorId: json["init_distributor_id"],
        shopName: json["shop_name"],
        level: json["level"],
        totalCartons: json["total_cartons"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        totalCartonsPending: json["total_cartons_pending"],
        totalTransactionPending: json["total_transaction_pending"],
        isVerified: json["isVerified"],
        sprayPcs: int.tryParse("${json["spray_pcs"]}"),
        tissuePcs: int.tryParse("${json["tissue_pcs"]}"),
        pointZenny: json["point_zenny"],
        areaCode: json["Area_code"],
        profilePic: json["profile_pic"],
        claimMissions: json["claim_missions"] == null
            ? []
            : List<dynamic>.from(json["claim_missions"]!.map((x) => x)),
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "resetPasswordToken": resetPasswordToken,
        "confirmed": confirmed,
        "blocked": blocked,
        "full_name": fullName,
        "address": address,
        "phone_number": phoneNumber,
        "init_distributor_id": initDistributorId,
        "shop_name": shopName,
        "level": level,
        "total_cartons": totalCartons,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "total_cartons_pending": totalCartonsPending,
        "total_transaction_pending": totalTransactionPending,
        "isVerified": isVerified,
        "spray_pcs": sprayPcs,
        "tissue_pcs": tissuePcs,
        "point_zenny": pointZenny,
        "Area_code": areaCode,
        "profile_pic": profilePic,
        "claim_missions": claimMissions == null
            ? []
            : List<dynamic>.from(claimMissions!.map((x) => x)),
        "role": role,
      };
}
