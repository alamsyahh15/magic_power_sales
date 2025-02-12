import 'dart:io';

class ProductModel {
  File? image;
  String? imageUrl;
  int? typeId;
  int? qty;
  int? perKarton;
  int? calKarton;
  int? calPieces;

  ProductModel({
    this.image,
    this.imageUrl,
    this.typeId,
    this.qty,
    this.perKarton,
    this.calKarton,
    this.calPieces,
  });
}
