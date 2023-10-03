// ignore_for_file: invalid_use_of_protected_member, depend_on_referenced_packages, unnecessary_null_comparison

import 'dart:developer';
import 'package:delivery_boy/model/stock_model.dart';
import 'package:delivery_boy/utils/colors.dart';
import 'package:delivery_boy/utils/common_methos.dart';
import 'package:intl/intl.dart';

import 'package:delivery_boy/service/network_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/order_model.dart';

class StockController extends GetxController {
  TextEditingController orderBottleTextController = TextEditingController();
  TextEditingController receivedBottleTextController = TextEditingController();
  TextEditingController remarkTextController = TextEditingController();
  RxList<StockOrderListModel> stockList = <StockOrderListModel>[].obs;
  RxList<String> companyList = <String>[].obs;
  RxList<String> productList = <String>[].obs;
  RxList orderList = [].obs;
  Rx<Map<String, dynamic>> selectedOrder = Rx<Map<String, dynamic>>({});
  RxString selectedCompany = ''.obs;
  RxString selectedProduct = ''.obs;

  Future addNewStock(BuildContext context) async {
    var data = {
      'order_date': selectedOrder.value['id'],
      'company_name': selectedCompany.value,
      'product_name': selectedProduct.value,
      'number_of_bottle_order': int.parse(orderBottleTextController.text),
      'number_of_bottle_received': int.parse(receivedBottleTextController.text),
      'remarks': remarkTextController.text,
    };
    var response = await networkRepository.addNewStock(context, data);
    if (response != null && response['status'] == 200) {
      Get.back();
      CommonMethod().getXSnackBar("Success", response['message'], greenColor);
    }
  }

  String getFormatedDate(date) {
    log('----date'+ date.toString());
    var dataTime = DateTime.parse(date);
    String formattedDate = DateFormat("MMM dd, yyyy").format(dataTime);
    return formattedDate;
  }
  Future clearForm() async {
    orderBottleTextController.clear();
    receivedBottleTextController.clear();
    remarkTextController.clear();
    stockList.value.clear();
    companyList.value.clear();
    productList.value.clear();
    orderList.value.clear();
    selectedOrder.value.clear();
    selectedCompany.value = '';
    selectedProduct.value = '';
  }

  Future getOrder(BuildContext context) async {
    var response = await networkRepository.getOrder(context);
    if (response != null) {
      selectedOrder.value.clear();
      orderList.value = response['data'];
      orderList.refresh();
    }
  }

  Future getOrderDetails(BuildContext context, String orderId) async {
    OrderModel response =
        await networkRepository.getOrderDetails(context, orderId);
    if (response != null) {
      companyList.value.clear();
      productList.value.clear();
      // selectedOrder.value.clear();
      companyList.value.add(response.data.accountMaster.name);
      productList.value.add(response.data.productMaster.name);
      selectedCompany.value = response.data.accountMaster.name;
      selectedProduct.value = response.data.productMaster.name;
      orderBottleTextController.text = response.data.numberOfBottle.toString();
    }
  }

  Future getStockList(BuildContext context) async {
    StockModel response = await networkRepository.getStockList(context);
    if (response != null && response.status == 200) {
      stockList.value = response.orderList!;
      stockList.refresh();
    }
  }

}
 