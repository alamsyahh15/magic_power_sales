// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

import 'dart:convert';

import 'package:magic_power_sales/config/constant.dart';
import 'package:magic_power_sales/config/models/product.dart';
import 'package:magic_power_sales/config/models/user.dart';

Transaction transactionFromJson(String str) =>
    Transaction.fromJson(json.decode(str));

String transactionToJson(Transaction data) => json.encode(data.toJson());

class Transaction {
  int? id;
  String? distributionId;
  DateTime? transactionDate;
  String? noInvoice;
  String? totalPrice;
  StatusTransaction status;
  DateTime? dueDate;
  String? city;
  DateTime? fakturDate;
  bool? paid;
  String? phoneNumber;
  dynamic comment;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  UserData? merchant;
  List<ProductHistory> products;

  Transaction({
    this.id,
    this.distributionId,
    this.transactionDate,
    this.noInvoice,
    this.totalPrice,
    required this.status,
    this.dueDate,
    this.city,
    this.fakturDate,
    this.paid,
    this.phoneNumber,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.merchant,
    this.products = const [],
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        distributionId: json["distribution_id"],
        transactionDate: json["transaction_date"] == null
            ? null
            : DateTime.parse(json["transaction_date"]),
        noInvoice: json["no_invoice"],
        totalPrice: json["total_price"],
        status: json["status"] == "scanned"
            ? StatusTransaction.scanned
            : StatusTransaction.notScanned,
        dueDate:
            json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        city: json["city"],
        fakturDate: json["faktur_date"] == null
            ? null
            : DateTime.parse(json["faktur_date"]),
        paid: json["paid"],
        phoneNumber: json["phone_number"],
        comment: json["comment"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        merchant: json["merchant"] == null
            ? null
            : UserData.fromJson(json["merchant"]),
        products: json["products"] == null
            ? []
            : List<ProductHistory>.from(
                json["products"].map((x) => ProductHistory.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "distribution_id": distributionId,
        "transaction_date": transactionDate?.toIso8601String(),
        "no_invoice": noInvoice,
        "total_price": totalPrice,
        "status":
            status == StatusTransaction.scanned ? "scanned" : "not scanned",
        "due_date":
            "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
        "city": city,
        "faktur_date":
            "${fakturDate!.year.toString().padLeft(4, '0')}-${fakturDate!.month.toString().padLeft(2, '0')}-${fakturDate!.day.toString().padLeft(2, '0')}",
        "paid": paid,
        "phone_number": phoneNumber,
        "comment": comment,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "merchant": merchant?.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class ProductHistory {
  int? id;
  int? count;
  Product? product;

  ProductHistory({
    this.id,
    this.count,
    this.product,
  });

  factory ProductHistory.fromJson(Map<String, dynamic> json) => ProductHistory(
        id: json["id"],
        count: json["count"],
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "count": count,
        "product": product?.toJson(),
      };
}
