// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
    String message;
    int status;
    OrderDetailModel data;

    OrderModel({
        required this.message,
        required this.status,
        required this.data,
    });

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        message: json["message"],
        status: json["status"],
        data: OrderDetailModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.toJson(),
    };
}

class OrderDetailModel {
    int id;
    String orderDate;
    int numberOfBottle;
    int companyId;
    int productMasterId;
    AccountMasterModel accountMaster;
    ProductMasterModel productMaster;

    OrderDetailModel({
        required this.id,
        required this.orderDate,
        required this.numberOfBottle,
        required this.companyId,
        required this.productMasterId,
        required this.accountMaster,
        required this.productMaster,
    });

    factory OrderDetailModel.fromJson(Map<String, dynamic> json) => OrderDetailModel(
        id: json["id"],
        orderDate: json["order_date"],
        numberOfBottle: json["number_of_bottle"],
        companyId: json["company_id"],
        productMasterId: json["product_master_id"],
        accountMaster: AccountMasterModel.fromJson(json["account_master"]),
        productMaster: ProductMasterModel.fromJson(json["product_master"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_date": orderDate,
        "number_of_bottle": numberOfBottle,
        "company_id": companyId,
        "product_master_id": productMasterId,
        "account_master": accountMaster.toJson(),
        "product_master": productMaster.toJson(),
    };
}

class AccountMasterModel {
    int id;
    String name;
    int groupMasterId;
    int openingBalance;
    int creditLimit;
    int isCredit;
    String address;
    String city;
    String gstNo;
    String contactPerson;
    String mobileNo;
    dynamic userName;
    dynamic password;
    int isActive;
    dynamic createdBy;
    dynamic updatedBy;
    dynamic authToken;
    dynamic deletedAt;
    DateTime createdAt;
    dynamic updatedAt;

    AccountMasterModel({
        required this.id,
        required this.name,
        required this.groupMasterId,
        required this.openingBalance,
        required this.creditLimit,
        required this.isCredit,
        required this.address,
        required this.city,
        required this.gstNo,
        required this.contactPerson,
        required this.mobileNo,
        required this.userName,
        required this.password,
        required this.isActive,
        required this.createdBy,
        required this.updatedBy,
        required this.authToken,
        required this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    factory AccountMasterModel.fromJson(Map<String, dynamic> json) => AccountMasterModel(
        id: json["id"],
        name: json["name"],
        groupMasterId: json["group_master_id"],
        openingBalance: json["opening_balance"],
        creditLimit: json["credit_limit"],
        isCredit: json["is_credit"],
        address: json["address"],
        city: json["city"],
        gstNo: json["gst_no"],
        contactPerson: json["contact_person"],
        mobileNo: json["mobile_no"],
        userName: json["user_name"],
        password: json["password"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        authToken: json["auth_token"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "group_master_id": groupMasterId,
        "opening_balance": openingBalance,
        "credit_limit": creditLimit,
        "is_credit": isCredit,
        "address": address,
        "city": city,
        "gst_no": gstNo,
        "contact_person": contactPerson,
        "mobile_no": mobileNo,
        "user_name": userName,
        "password": password,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "auth_token": authToken,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
    };
}

class ProductMasterModel {
    int id;
    String name;
    int accountMasterId;
    int productWeight;
    int isActive;
    dynamic createdBy;
    dynamic updatedBy;
    dynamic deletedAt;
    String? createdAt;
    String? updatedAt;

    ProductMasterModel({
        required this.id,
        required this.name,
        required this.accountMasterId,
        required this.productWeight,
        required this.isActive,
         this.createdBy,
        required this.updatedBy,
        required this.deletedAt,
         this.createdAt,
         this.updatedAt,
    });

    factory ProductMasterModel.fromJson(Map<String, dynamic> json) => ProductMasterModel(
        id: json["id"],
        name: json["name"],
        accountMasterId: json["account_master_id"],
        productWeight: json["product_weight"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "account_master_id": accountMasterId,
        "product_weight": productWeight,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
