class SupplierModel {
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
    String userName;
    String password;
    int isActive;
    dynamic createdBy;
    int? updatedBy;
    String authToken;
    dynamic deletedAt;
    DateTime createdAt;
    DateTime updatedAt;

    SupplierModel({
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
         this.updatedBy,
        required this.authToken,
        required this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    factory SupplierModel.fromJson(Map<String, dynamic> json) => SupplierModel(
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
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "updated_at": updatedAt.toIso8601String(),
    };
}
