// To parse this JSON data, do
//
//     final stockModel = stockModelFromJson(jsonString);

import 'dart:convert';

StockModel stockModelFromJson(String str) =>
    StockModel.fromJson(json.decode(str));

String stockModelToJson(StockModel data) => json.encode(data.toJson());

class StockModel {
  int? status;
  List<StockOrderListModel>? orderList;

  StockModel({
    this.status,
    this.orderList,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) => StockModel(
        status: json["status"],
        orderList: List<StockOrderListModel>.from(
            json["orderList"].map((x) => StockOrderListModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "orderList": List<dynamic>.from(orderList!.map((x) => x.toJson())),
      };
}

class StockOrderListModel {
  int? id;
  int? numberOfBottleOrder;
  int? numberOfBottleReceived;
  String? companyName;
  String? productName;
  String? remarks;

  StockOrderListModel({
     this.id,
     this.numberOfBottleOrder,
     this.numberOfBottleReceived,
     this.companyName,
     this.productName,
     this.remarks,
  });

  factory StockOrderListModel.fromJson(Map<String, dynamic> json) =>
      StockOrderListModel(
        id: json["id"],
        numberOfBottleOrder: json["number_of_bottle_order"],
        numberOfBottleReceived: json["number_of_bottle_received"],
        companyName: json["company_name"],
        productName: json["product_name"],
        remarks: json["remarks"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number_of_bottle_order": numberOfBottleOrder,
        "number_of_bottle_received": numberOfBottleReceived,
        "company_name": companyName,
        "product_name": productName,
        "remarks": remarks,
      };
}
