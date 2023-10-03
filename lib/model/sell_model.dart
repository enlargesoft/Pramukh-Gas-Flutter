// To parse this JSON data, do
//
//     final sellModel = sellModelFromJson(jsonString);

import 'dart:convert';

SellModel sellModelFromJson(String str) => SellModel.fromJson(json.decode(str));

String sellModelToJson(SellModel data) => json.encode(data.toJson());

class SellModel {
    int? status;
    List<SellDataModel>? data;

    SellModel({
         this.status,
         this.data,
    });

    factory SellModel.fromJson(Map<String, dynamic> json) => SellModel(
        status: json["status"],
        data: List<SellDataModel>.from(json["data"].map((x) => SellDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class SellDataModel {
    int id;
    String yearName;
    String companyName;
    String productName;
    String hsnCode;
    int gst;
    int chNumber;
    int filledBottleDelivered;
    int emptyBottleReceived;
    int ratePerBottle;
    int netPayableAmount;
    int totalPayment;

    SellDataModel({
        required this.id,
        required this.yearName,
        required this.companyName,
        required this.productName,
        required this.hsnCode,
        required this.gst,
        required this.chNumber,
        required this.filledBottleDelivered,
        required this.emptyBottleReceived,
        required this.ratePerBottle,
        required this.netPayableAmount,
        required this.totalPayment,
    });

    factory SellDataModel.fromJson(Map<String, dynamic> json) => SellDataModel(
        id: json["id"],
        yearName: json["year_name"],
        companyName: json["company_name"],
        productName: json["product_name"],
        hsnCode: json["hsn_code"],
        gst: json["gst"],
        chNumber: json["ch_number"],
        filledBottleDelivered: json["filled_bottle_delivered"],
        emptyBottleReceived: json["empty_bottle_received"],
        ratePerBottle: json["rate_per_bottle"],
        netPayableAmount: json["net_payable_amount"],
        totalPayment: json["total_payment"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "year_name": yearName,
        "company_name": companyName,
        "product_name": productName,
        "hsn_code": hsnCode,
        "gst": gst,
        "ch_number": chNumber,
        "filled_bottle_delivered": filledBottleDelivered,
        "empty_bottle_received": emptyBottleReceived,
        "rate_per_bottle": ratePerBottle,
        "net_payable_amount": netPayableAmount,
        "total_payment": totalPayment,
    };
}

