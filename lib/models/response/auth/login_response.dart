// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    String status;
    String message;
    Data data;

    LoginResponse({
        required this.status,
        required this.message,
        required this.data,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    String token;
    User user;

    Data({
        required this.token,
        required this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
    };
}

class User {
    String id;
    String slug;
    String slugId;
    String fullName;
    String photo;
    String email;
    String phoneNumber;
    Wallet wallet;
    String role;
    List<dynamic> fcmToken;
    List<dynamic> socketIds;
    String cus;
    bool isActive;
    bool isOnline;
    bool isVerified;
    String kycVerificationStatus;
    bool isBlockedByAdmin;
    dynamic address;
    bool isDeleted;
    dynamic stripeAccountId;
    bool stripeAccountStatus;
    List<dynamic> uniqueSocketIds;
    DateTime lastLogin;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    DateTime loginAt;
    String creditCheck;
    bool creditStatus;
    bool driverLicenseStatus;
    String driversLicenseStatus;
    DateTime passwordChangedAt;

    User({
        required this.id,
        required this.slug,
        required this.slugId,
        required this.fullName,
        required this.photo,
        required this.email,
        required this.phoneNumber,
        required this.wallet,
        required this.role,
        required this.fcmToken,
        required this.socketIds,
        required this.cus,
        required this.isActive,
        required this.isOnline,
        required this.isVerified,
        required this.kycVerificationStatus,
        required this.isBlockedByAdmin,
        required this.address,
        required this.isDeleted,
        required this.stripeAccountId,
        required this.stripeAccountStatus,
        required this.uniqueSocketIds,
        required this.lastLogin,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.loginAt,
        required this.creditCheck,
        required this.creditStatus,
        required this.driverLicenseStatus,
        required this.driversLicenseStatus,
        required this.passwordChangedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        slug: json["slug"],
        slugId: json["slugId"],
        fullName: json["fullName"],
        photo: json["photo"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        wallet: Wallet.fromJson(json["wallet"]),
        role: json["role"],
        fcmToken: List<dynamic>.from(json["fcmToken"].map((x) => x)),
        socketIds: List<dynamic>.from(json["socketIds"].map((x) => x)),
        cus: json["cus"],
        isActive: json["isActive"],
        isOnline: json["isOnline"],
        isVerified: json["isVerified"],
        kycVerificationStatus: json["kycVerificationStatus"],
        isBlockedByAdmin: json["isBlockedByAdmin"],
        address: json["address"],
        isDeleted: json["isDeleted"],
        stripeAccountId: json["stripeAccountId"],
        stripeAccountStatus: json["stripeAccountStatus"],
        uniqueSocketIds: List<dynamic>.from(json["uniqueSocketIds"].map((x) => x)),
        lastLogin: DateTime.parse(json["lastLogin"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        loginAt: DateTime.parse(json["loginAt"]),
        creditCheck: json["creditCheck"],
        creditStatus: json["creditStatus"],
        driverLicenseStatus: json["driverLicenseStatus"],
        driversLicenseStatus: json["driversLicenseStatus"],
        passwordChangedAt: DateTime.parse(json["passwordChangedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "slug": slug,
        "slugId": slugId,
        "fullName": fullName,
        "photo": photo,
        "email": email,
        "phoneNumber": phoneNumber,
        "wallet": wallet.toJson(),
        "role": role,
        "fcmToken": List<dynamic>.from(fcmToken.map((x) => x)),
        "socketIds": List<dynamic>.from(socketIds.map((x) => x)),
        "cus": cus,
        "isActive": isActive,
        "isOnline": isOnline,
        "isVerified": isVerified,
        "kycVerificationStatus": kycVerificationStatus,
        "isBlockedByAdmin": isBlockedByAdmin,
        "address": address,
        "isDeleted": isDeleted,
        "stripeAccountId": stripeAccountId,
        "stripeAccountStatus": stripeAccountStatus,
        "uniqueSocketIds": List<dynamic>.from(uniqueSocketIds.map((x) => x)),
        "lastLogin": lastLogin.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "loginAt": loginAt.toIso8601String(),
        "creditCheck": creditCheck,
        "creditStatus": creditStatus,
        "driverLicenseStatus": driverLicenseStatus,
        "driversLicenseStatus": driversLicenseStatus,
        "passwordChangedAt": passwordChangedAt.toIso8601String(),
    };
}

class Wallet {
    int totalEarnings;
    String id;
    DateTime createdAt;
    DateTime updatedAt;

    Wallet({
        required this.totalEarnings,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        totalEarnings: json["totalEarnings"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "totalEarnings": totalEarnings,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
