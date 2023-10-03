// To parse this JSON data, do
//
//     final cashModel = cashModelFromJson(jsonString);

import 'dart:convert';

CashModel cashModelFromJson(String str) => CashModel.fromJson(json.decode(str));

String cashModelToJson(CashModel data) => json.encode(data.toJson());

class CashModel {
    int? status;
    List<CashDataModel>? data;

    CashModel({
         this.status,
         this.data,
    });

    factory CashModel.fromJson(Map<String, dynamic> json) => CashModel(
        status: json["status"],
        data: List<CashDataModel>.from(json["data"].map((x) => CashDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class CashDataModel {
    int id;
    String customerName;
    String accountName;
    int amount;
    String? remarks;

    CashDataModel({
        required this.id,
        required this.customerName,
        required this.accountName,
        required this.amount,
        required this.remarks,
    });

    factory CashDataModel.fromJson(Map<String, dynamic> json) => CashDataModel(
        id: json["id"],
        customerName: json["customer_name"],
        accountName: json["account_name"],
        amount: json["amount"],
        remarks: json["remarks"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_name": customerName,
        "account_name": accountName,
        "amount": amount,
        "remarks": remarks,
    };
}
