import 'dart:convert';

BottleStockModel bottleStockModelFromJson(String str) =>
    BottleStockModel.fromJson(json.decode(str));

String bottleStockModelToJson(BottleStockModel data) =>
    json.encode(data.toJson());

class BottleStockModel {
  int? status;
  List<BottleStockDataModel>? data;

  BottleStockModel({
    this.status,
    this.data,
  });

  factory BottleStockModel.fromJson(Map<String, dynamic> json) =>
      BottleStockModel(
        status: json["status"],
        data: List<BottleStockDataModel>.from(
            json["data"].map((x) => BottleStockDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BottleStockDataModel {
  int id;
  String companyName;
  String productName;
  int numOfFilledBottle;
  int numOfEmptyBottle;
  int totalBottle;

  BottleStockDataModel({
    required this.id,
    required this.companyName,
    required this.productName,
    required this.numOfFilledBottle,
    required this.numOfEmptyBottle,
    required this.totalBottle,
  });

  factory BottleStockDataModel.fromJson(Map<String, dynamic> json) =>
      BottleStockDataModel(
        id: json["id"],
        companyName: json["company_name"],
        productName: json["product_name"],
        numOfFilledBottle: json["num_of_filled_bottle"],
        numOfEmptyBottle: json["num_of_empty_bottle"],
        totalBottle: json["total_bottle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_name": companyName,
        "product_name": productName,
        "num_of_filled_bottle": numOfFilledBottle,
        "num_of_empty_bottle": numOfEmptyBottle,
        "total_bottle": totalBottle,
      };
}
