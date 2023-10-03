// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/cash_model.dart';
import '../service/network_repository.dart';
import '../utils/colors.dart';
import '../utils/common_methos.dart';

class CashController extends GetxController {
  TextEditingController amountTextController = TextEditingController();
  TextEditingController remarkTextController = TextEditingController();
  RxList<CashDataModel> cashList = <CashDataModel>[].obs;
  RxList customerList = [].obs;
  RxList accountList = [].obs;
  RxList openingBalanceList = [
    {"id": 0, "name": "Debit"},
    {"id": 1, "name": "Credit"},
  ].obs;
  Rx<Map<String, dynamic>> selectedCustomer = Rx<Map<String, dynamic>>({});
  Rx<Map<String, dynamic>> selectedAccount = Rx<Map<String, dynamic>>({});
  Rx<Map<String, dynamic>> selectedOpeningBalance =
      Rx<Map<String, dynamic>>({});

  Future clearForm() async {
    amountTextController.clear();
    remarkTextController.clear();
    cashList.value.clear();
    customerList.value.clear();
    accountList.value.clear();
    selectedCustomer.value.clear();
    selectedAccount.value.clear();
    selectedOpeningBalance.value.clear();
  }

  Future getCustomerList(BuildContext context) async {
    var response = await networkRepository.getCustomerList(context);
    if (response != null) {
      customerList.value = response['data'];
      customerList.refresh();
    }
  }

  Future getAccountList(BuildContext context) async {
    var response = await networkRepository.getAccountList(context);
    if (response != null) {
      accountList.value = response['data'];
      accountList.refresh();
    }
  }

  Future addCashEntry(BuildContext context) async {
    var data = {
      'customer_id': selectedCustomer.value['id'],
      'account_master_id': selectedAccount.value['id'],
      'amount': amountTextController.text,
      'is_credit': selectedOpeningBalance.value['id'],
      'remarks': remarkTextController.text,
    };
    var response = await networkRepository.addCashEntry(context, data);
    if (response != null && response['status'] == 200) {
      Get.back();
      CommonMethod().getXSnackBar("Success", response['message'], greenColor);
    }
  }

  Future getCashDataList(BuildContext context) async {
    CashModel response = await networkRepository.getCashDataList(context);
    if (response != null && response.status == 200 && response.data != null) {
      cashList.value = response.data!;
      cashList.refresh();
    }
  }
}
