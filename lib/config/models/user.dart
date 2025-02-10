import 'package:magic_power_sales/config/string.dart';

class User {
  String? jwt;
  UserData? user;

  User({
    this.jwt,
    this.user,
  });

  User copyWith({
    String? jwt,
    UserData? user,
  }) =>
      User(
        jwt: jwt ?? this.jwt,
        user: user ?? this.user,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        jwt: json["jwt"],
        user: json["user"] == null ? null : UserData.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "jwt": jwt,
        "user": user?.toJson(),
      };
}

class UserData {
  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? isVerified;
  bool? blocked;
  String? fullName;
  String? address;
  String? phoneNumber;
  dynamic initDistributorId;
  String? shopName;
  int? level;
  double? totalCartons;
  double? totalCartonsPending;
  int? totalTransactionsPending;
  DateTime? createdAt;
  DateTime? updatedAt;
  ProfilePic? profilePic;
  int? sprayPcs;
  int? tissuePcs;
  int? pointZenny;

  UserData({
    this.id,
    this.username,
    this.email,
    this.provider,
    this.confirmed,
    this.isVerified,
    this.blocked,
    this.fullName,
    this.address,
    this.phoneNumber,
    this.initDistributorId,
    this.shopName,
    this.level,
    this.totalCartons,
    this.totalCartonsPending,
    this.totalTransactionsPending,
    this.createdAt,
    this.updatedAt,
    this.profilePic,
    this.sprayPcs,
    this.tissuePcs,
    this.pointZenny,
  });

  UserData copyWith(
          {int? id,
          String? username,
          String? email,
          String? provider,
          bool? confirmed,
          bool? isVerified,
          bool? blocked,
          dynamic fullName,
          String? address,
          String? phoneNumber,
          dynamic initDistributorId,
          String? shopName,
          int? level,
          double? totalCartons,
          double? totalCartonsPending,
          int? totalTransactionsPending,
          DateTime? createdAt,
          DateTime? updatedAt,
          ProfilePic? profilePic,
          int? sprayPcs,
          int? tissuePcs,
          int? pointZenny}) =>
      UserData(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        provider: provider ?? this.provider,
        confirmed: confirmed ?? this.confirmed,
        isVerified: isVerified ?? this.isVerified,
        blocked: blocked ?? this.blocked,
        fullName: fullName ?? this.fullName,
        address: address ?? this.address,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        initDistributorId: initDistributorId ?? this.initDistributorId,
        shopName: shopName ?? this.shopName,
        level: level ?? this.level,
        totalCartons: totalCartons ?? this.totalCartons,
        totalCartonsPending: totalCartonsPending ?? this.totalCartonsPending,
        totalTransactionsPending:
            totalTransactionsPending ?? this.totalTransactionsPending,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        profilePic: profilePic ?? this.profilePic,
        sprayPcs: sprayPcs ?? this.sprayPcs,
        tissuePcs: tissuePcs ?? this.tissuePcs,
        pointZenny: pointZenny ?? this.pointZenny,
      );

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        provider: json["provider"],
        confirmed: json["confirmed"],
        isVerified: json["isVerified"],
        blocked: json["blocked"],
        fullName: json["full_name"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        initDistributorId: json["init_distributor_id"],
        shopName: json["shop_name"],
        level: json["level"] ?? 0,
        totalCartons: double.parse("${json["total_cartons"] ?? 0}"),
        totalCartonsPending:
            double.parse("${json['total_cartons_pending'] ?? 0}"),
        totalTransactionsPending:
            int.parse("${json['total_transaction_pending'] ?? "0"}"),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        profilePic: json["profile_pic"] == null
            ? null
            : ProfilePic.fromJson(json["profile_pic"]),
        sprayPcs: int.parse("${json['spray_pcs'] ?? 0}"),
        tissuePcs: int.parse("${json['tissue_pcs'] ?? 0}"),
        pointZenny: int.parse("${json['point_zenny'] ?? 0}"),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "provider": provider,
        "confirmed": confirmed,
        "isVerified": isVerified,
        "blocked": blocked,
        "full_name": fullName,
        "address": address,
        "phone_number": phoneNumber,
        "init_distributor_id": initDistributorId,
        "shop_name": shopName,
        "level": level,
        "total_cartons": totalCartons,
        "total_cartons_pending": totalCartonsPending,
        "total_transaction_pending": totalTransactionsPending,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "profile_pic": profilePic?.toJson(),
        "spray_pcs": sprayPcs,
        "tissue_pcs": tissuePcs,
        "point_zenny": pointZenny,
      };
}

class ProfilePic {
  int? id;
  String? name;
  dynamic alternativeText;
  dynamic caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  String? provider;
  dynamic providerMetadata;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProfilePic({
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

  ProfilePic copyWith({
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
      ProfilePic(
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

  factory ProfilePic.fromJson(Map<String, dynamic> json) => ProfilePic(
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
        url: "${Strings.baseUrl}/${json["url"]}",
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
  Large? large;
  Large? small;
  Large? medium;
  Large? thumbnail;

  Formats({
    this.large,
    this.small,
    this.medium,
    this.thumbnail,
  });

  Formats copyWith({
    Large? large,
    Large? small,
    Large? medium,
    Large? thumbnail,
  }) =>
      Formats(
        large: large ?? this.large,
        small: small ?? this.small,
        medium: medium ?? this.medium,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        large: json["large"] == null ? null : Large.fromJson(json["large"]),
        small: json["small"] == null ? null : Large.fromJson(json["small"]),
        medium: json["medium"] == null ? null : Large.fromJson(json["medium"]),
        thumbnail: json["thumbnail"] == null
            ? null
            : Large.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "large": large?.toJson(),
        "small": small?.toJson(),
        "medium": medium?.toJson(),
        "thumbnail": thumbnail?.toJson(),
      };
}

class Large {
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  dynamic path;
  double? size;
  int? width;
  int? height;

  Large({
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

  Large copyWith({
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
      Large(
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

  factory Large.fromJson(Map<String, dynamic> json) => Large(
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
