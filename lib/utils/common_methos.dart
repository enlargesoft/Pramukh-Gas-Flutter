import 'package:delivery_boy/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/supplier_model.dart';
import '../service/network_dio.dart';
import 'app_constants.dart';
import 'colors.dart';

class CommonMethod {
  void showSnackBar(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void getXSnackBar(String title, String message, Color? color) {
    Get.snackbar(
      title,
      message,
      backgroundColor: color,
      colorText: primaryWhite,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      duration: const Duration(seconds: 2),
      borderRadius: 10,
      barBlur: 10,
    );
  }

  Future storeUserModel(SupplierModel supplierModel) async {
    await dataStorages.write('user', supplierModel.toJson());
    
  }

  SupplierModel? getUserModel()  {
    final userMap =  dataStorages.read('user') as Map<String, dynamic>?;
    if (userMap != null) {
      return SupplierModel.fromJson(userMap);
    }
    return null;
  }

}
