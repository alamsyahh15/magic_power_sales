import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  final int? id;
  final String? name;
  final String? price;
  final int? cartonUnit;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final ProductImage? image;

  Product({
    this.id,
    this.name,
    this.price,
    this.cartonUnit,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.image,
  });

  Product copyWith({
    int? id,
    String? name,
    String? price,
    int? cartonUnit,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    ProductImage? image,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        cartonUnit: cartonUnit ?? this.cartonUnit,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        publishedAt: publishedAt ?? this.publishedAt,
        image: image ?? this.image,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        cartonUnit: json["carton_unit"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        image:
            json["image"] == null ? null : ProductImage.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "carton_unit": cartonUnit,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "image": image?.toJson(),
      };
}

class ProductImage {
  final int? id;
  final String? name;
  final dynamic alternativeText;
  final dynamic caption;
  final int? width;
  final int? height;
  final Formats? formats;
  final String? hash;
  final String? ext;
  final String? mime;
  final double? size;
  final String? url;
  final dynamic previewUrl;
  final String? provider;
  final dynamic providerMetadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProductImage({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  ProductImage copyWith({
    int? id,
    String? name,
    dynamic alternativeText,
    dynamic caption,
    int? width,
    int? height,
    Formats? formats,
    String? hash,
    String? ext,
    String? mime,
    double? size,
    String? url,
    dynamic previewUrl,
    String? provider,
    dynamic providerMetadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ProductImage(
        id: id ?? this.id,
        name: name ?? this.name,
        alternativeText: alternativeText ?? this.alternativeText,
        caption: caption ?? this.caption,
        width: width ?? this.width,
        height: height ?? this.height,
        formats: formats ?? this.formats,
        hash: hash ?? this.hash,
        ext: ext ?? this.ext,
        mime: mime ?? this.mime,
        size: size ?? this.size,
        url: url ?? this.url,
        previewUrl: previewUrl ?? this.previewUrl,
        provider: provider ?? this.provider,
        providerMetadata: providerMetadata ?? this.providerMetadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats:
            json["formats"] == null ? null : Formats.fromJson(json["formats"]),
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats?.toJson(),
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Formats {
  final Small? small;
  final Small? thumbnail;

  Formats({
    this.small,
    this.thumbnail,
  });

  Formats copyWith({
    Small? small,
    Small? thumbnail,
  }) =>
      Formats(
        small: small ?? this.small,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        small: json["small"] == null ? null : Small.fromJson(json["small"]),
        thumbnail: json["thumbnail"] == null
            ? null
            : Small.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "small": small?.toJson(),
        "thumbnail": thumbnail?.toJson(),
      };
}

class Small {
  final String? ext;
  final String? url;
  final String? hash;
  final String? mime;
  final String? name;
  final dynamic path;
  final double? size;
  final int? width;
  final int? height;

  Small({
    this.ext,
    this.url,
    this.hash,
    this.mime,
    this.name,
    this.path,
    this.size,
    this.width,
    this.height,
  });

  Small copyWith({
    String? ext,
    String? url,
    String? hash,
    String? mime,
    String? name,
    dynamic path,
    double? size,
    int? width,
    int? height,
  }) =>
      Small(
        ext: ext ?? this.ext,
        url: url ?? this.url,
        hash: hash ?? this.hash,
        mime: mime ?? this.mime,
        name: name ?? this.name,
        path: path ?? this.path,
        size: size ?? this.size,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  factory Small.fromJson(Map<String, dynamic> json) => Small(
        ext: json["ext"],
        url: json["url"],
        hash: json["hash"],
        mime: json["mime"],
        name: json["name"],
        path: json["path"],
        size: json["size"]?.toDouble(),
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "ext": ext,
        "url": url,
        "hash": hash,
        "mime": mime,
        "name": name,
        "path": path,
        "size": size,
        "width": width,
        "height": height,
      };
}
