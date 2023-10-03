import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/bottle_stock_model.dart';
import '../service/network_repository.dart';

class BottleStockController extends GetxController{
  RxList<BottleStockDataModel> bottleStockList = <BottleStockDataModel>[].obs;

  Future getBottleStockDataList(BuildContext context) async {
    BottleStockModel response = await networkRepository.getBottleStockDataList(context);
    if (response != null && response.status == 200 &&  response.data != null) {
      bottleStockList.value = response.data!;
      bottleStockList.refresh();
    }
  }
}