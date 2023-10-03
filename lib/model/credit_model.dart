// To parse this JSON data, do
//
//     final creditModel = creditModelFromJson(jsonString);

import 'dart:convert';

CreditModel creditModelFromJson(String str) => CreditModel.fromJson(json.decode(str));

String creditModelToJson(CreditModel data) => json.encode(data.toJson());

class CreditModel {
    int? status;
    List<CreditDataModel>? data;

    CreditModel({
         this.status,
         this.data,
    });

    factory CreditModel.fromJson(Map<String, dynamic> json) => CreditModel(
        status: json["status"],
        data: List<CreditDataModel>.from(json["data"].map((x) => CreditDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class CreditDataModel {
    String month;
    String amount;

    CreditDataModel({
        required this.month,
        required this.amount,
    });

    factory CreditDataModel.fromJson(Map<String, dynamic> json) => CreditDataModel(
        month: json["month"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "month": month,
        "amount": amount,
    };
}
