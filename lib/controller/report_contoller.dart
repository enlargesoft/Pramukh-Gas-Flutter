import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/credit_model.dart';
import '../service/network_repository.dart';

class CreditReportContoller extends GetxController {
  RxList yearList = [
    {"id": 0, "name": "2021"},
    {"id": 1, "name": "2022"},
    {"id": 2, "name": "2023"},
  ].obs;
  RxList<CreditDataModel> creditList = <CreditDataModel>[].obs;
  Rx<Map<String, dynamic>> selectedYear = Rx<Map<String, dynamic>>({});

  @override
  void onInit() {
    clearForm();
    super.onInit();
  }

  Future clearForm() async {
    creditList.value.clear();
    selectedYear.value.clear();
  }

  Future getCreditDataList(BuildContext context) async {
    CreditModel response = await networkRepository.getCreditDataList(context);
    if (response != null && response.status == 200 && response.data != null) {
      creditList.value = response.data!;
      creditList.refresh();
      update();
    }
  }

  Future getExpenseList(BuildContext context) async {
    CreditModel response = await networkRepository.getExpenseList(context);
    if (response != null && response.status == 200 && response.data != null) {
      creditList.value = response.data!;
      creditList.refresh();
      update();
    }
  }
}
