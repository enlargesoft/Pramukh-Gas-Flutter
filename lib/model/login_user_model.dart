// To parse this JSON data, do
//
//     final loginUserModel = loginUserModelFromJson(jsonString);

import 'dart:convert';

import 'supplier_model.dart';

LoginUserModel loginUserModelFromJson(String str) =>
    LoginUserModel.fromJson(json.decode(str));

String loginUserModelToJson(LoginUserModel data) => json.encode(data.toJson());

class LoginUserModel {
  String? message;
  int? status;
  SupplierModel? supplier;

  LoginUserModel({
    required this.message,
    required this.status,
    required this.supplier,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
        message: json["message"],
        status: json["status"],
        supplier: json["supplier"] != null
            ? SupplierModel.fromJson(json["supplier"])
            : json["supplier"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "supplier": supplier!.toJson(),
      };
}

