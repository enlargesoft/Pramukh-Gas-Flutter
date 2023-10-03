// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/sell_model.dart';
import '../service/network_repository.dart';
import '../utils/colors.dart';
import '../utils/common_methos.dart';

class SellController extends GetxController {
  TextEditingController chNumberTextController = TextEditingController();
  TextEditingController deliveredTextController = TextEditingController();
  TextEditingController receivedTextController = TextEditingController();
  TextEditingController totalBottleTextController = TextEditingController();
  TextEditingController rateTextController = TextEditingController();
  TextEditingController netPayableTextController = TextEditingController();
  TextEditingController totalPayableTextController = TextEditingController();
  RxList companyList = [].obs;
  RxList productList = [].obs;
  RxList customerList = [].obs;
  RxList hsnCodeList = [].obs;
  RxList gstList = [].obs;
  RxList<SellDataModel> sellDataList = <SellDataModel>[].obs;
  Rx<Map<String, dynamic>> selectedCompany = Rx<Map<String, dynamic>>({});
  Rx<Map<String, dynamic>> selectedProduct = Rx<Map<String, dynamic>>({});
  Rx<Map<String, dynamic>> selectedCustomer = Rx<Map<String, dynamic>>({});
  Rx<Map<String, dynamic>> selectedHsnCode = Rx<Map<String, dynamic>>({});
  Rx<Map<String, dynamic>> selectedGst = Rx<Map<String, dynamic>>({});

  Future clearForm() async {
    chNumberTextController.clear();
    deliveredTextController.clear();
    receivedTextController.clear();
    totalBottleTextController.clear();
    rateTextController.clear();
    netPayableTextController.clear();
    totalPayableTextController.clear();
    companyList.value.clear();
    productList.value.clear();
    customerList.value.clear();
    hsnCodeList.value.clear();
    gstList.value.clear();
    sellDataList.value.clear();
    selectedCompany.value.clear();
    selectedProduct.value.clear();
    selectedCustomer.value.clear();
    selectedHsnCode.value.clear();
    selectedGst.value.clear();
  }


  Future addSell(BuildContext context) async {
    var data = {
      'company': selectedCompany.value['id'],
      'product': selectedProduct.value['id'],
      'customer': selectedCustomer.value['id'],
      'ch_number': int.parse(chNumberTextController.text),
      'filled_bottle_delivered': int.parse(deliveredTextController.text),
      'empty_bottle_received': int.parse(receivedTextController.text),
      'total_bottle': int.parse(totalBottleTextController.text),
      'rate_per_bottle': int.parse(rateTextController.text),
      'hsn_code': selectedHsnCode.value['id'],
      'gst_percentage': selectedGst.value['id'],
      'net_payable_amount': int.parse(netPayableTextController.text),
      'total_payment': int.parse(totalPayableTextController.text),
    };
    var response = await networkRepository.addSell(context, data);
    if (response != null && response['status'] == 200) {
      Get.back();
      CommonMethod().getXSnackBar("Success", response['message'], greenColor);
    }
  }

  Future getSellDataList(BuildContext context) async {
    SellModel response = await networkRepository.getSellDataList(context);
    if (response != null && response.status == 200 &&  response.data != null) {
      sellDataList.value = response.data!;
      sellDataList.refresh();
    }
  }
  Future getCompanyList(BuildContext context) async {
    var response = await networkRepository.getCompanyList(context);
    if (response != null) {
      companyList.value = response['data'];
      companyList.refresh();
    }
  }

  Future getProductList(BuildContext context) async {
    var response = await networkRepository.getProductList(context);
    if (response != null) {
      productList.value = response['data'];
      productList.refresh();
    }
  }

  Future getCustomerList(BuildContext context) async {
    var response = await networkRepository.getCustomerList(context);
    if (response != null) {
      customerList.value = response['data'];
      customerList.refresh();
    }
  }

  Future getHsnCodeList(BuildContext context) async {
    var response = await networkRepository.getHsnCodeList(context);
    if (response != null) {
      hsnCodeList.value = response['data'];
      hsnCodeList.refresh();
    }
  }

  Future getGstList(BuildContext context) async {
    var response = await networkRepository.getGstList(context);
    if (response != null) {
      gstList.value = response['data'];
      gstList.refresh();
    }
  }


}
