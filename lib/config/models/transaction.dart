import 'package:magic_power_sales/config/constant.dart';

class Transaction {
  int? id, distributionId, totalPrice;
  DateTime? transactionDate;
  String? noInvoice, phoneNumber;
  bool paid;
  StatusTransaction status;

  Transaction({
    this.id,
    this.status = StatusTransaction.notScanned,
    this.distributionId,
    this.noInvoice,
    this.paid = false,
    this.totalPrice,
    this.transactionDate,
    this.phoneNumber,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        distributionId: int.parse(json["distribution_id"].toString()),
        paid: json["paid"],
        status: json["status"] == "not-scanned"
            ? StatusTransaction.notScanned
            : StatusTransaction.scanned,
        totalPrice: int.parse(json["total_price"].toString()),
        transactionDate: json["transaction_date"] != null
            ? DateTime.parse(json["transaction_date"])
            : null,
        noInvoice: json["no_invoice"],
      );
}
