import 'dart:developer';

import 'package:delivery_boy/model/bottle_stock_model.dart';
import 'package:delivery_boy/model/cash_model.dart';
import 'package:delivery_boy/model/credit_model.dart';
import 'package:delivery_boy/model/login_user_model.dart';
import 'package:delivery_boy/model/order_model.dart';
import 'package:delivery_boy/model/sell_model.dart';
import 'package:delivery_boy/model/stock_model.dart';
import 'package:delivery_boy/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/app_constants.dart';
import '../utils/common_methos.dart';
import 'network_dio.dart';

NetworkRepository networkRepository = NetworkRepository();

class NetworkRepository {
  static final NetworkRepository _networkRepository =
      NetworkRepository._internal();

  factory NetworkRepository() {
    return _networkRepository;
  }
  NetworkRepository._internal();

  FocusNode searchFocus = FocusNode();

  userLogin(context, authUserData) async {
    // try {
      final response = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: AppConstants.apiBaseUrl + AppConstants.login,
        data: authUserData,
      );
      return checkResponse(
          response, LoginUserModel.fromJson(response['body']));
    // } catch (e) {
    //   CommonMethod().getXSnackBar("Error", e.toString(), redColor);
    // }
  }

  userLogout(context, authUserData) async {
    try {
      final response = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: AppConstants.apiBaseUrl + AppConstants.logout,
        data: authUserData,
      );
      return checkResponse2(response);
    } catch (e) {
      CommonMethod().getXSnackBar("Error", e.toString(), redColor);
    }
  }

  addNewStock(context,data) async {
    try {
      final response = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: AppConstants.apiBaseUrl + AppConstants.addNewStock, data: data,
      );
      return checkResponse2(response);
    } catch (e) {
      CommonMethod().getXSnackBar("Error", e.toString(), redColor);
    }
  }

  addSell(context,data) async {
    try {
      final response = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: AppConstants.apiBaseUrl + AppConstants.addSell, data: data,
      );
      return checkResponse2(response);
    } catch (e) {
      CommonMethod().getXSnackBar("Error", e.toString(), redColor);
    }
  }

  getOrder(context) async {
    try {
      final response = await NetworkDioHttp.getDioHttpMethod(
        context: context,
        url: AppConstants.apiBaseUrl + AppConstants.getOrder,
      );
      return checkResponse2(response);
    } catch (e) {
      CommonMethod().getXSnackBar("Error", e.toString(), redColor);
    }
  }

  getOrderDetails(context,orderId) async {
    // try {
      final response = await NetworkDioHttp.getDioHttpMethod(
        context: context,
        url: AppConstants.apiBaseUrl + AppConstants.getOrderDetails + orderId,
      );
      return checkResponse(
          response, OrderModel.fromJson(response['body']));
  // } catch (e) {
  //     CommonMethod().getXSnackBar("Error", e.toString(), redColor);
  //   }
  }

  getStockList(context) async {
    // try {
    final response = await NetworkDioHttp.getDioHttpMethod(
      context: context,
      url: AppConstants.apiBaseUrl + AppConstants.getStockList,
    );
    return checkResponse(response, StockModel.fromJson(response['body']));
    // } catch (e) {
    //   CommonMethod().getXSnackBar("Error", e.toString(), redColor);
    // }
  }
  getBottleStockDataList(context) async {
    try {
    final response = await NetworkDioHttp.getDioHttpMethod(
      context: context,
      url: AppConstants.apiBaseUrl + AppConstants.getBottleStockDataList,
    );
    return checkResponse(response, BottleStockModel.fromJson(response['body']));
    } catch (e) {
      CommonMethod().getXSnackBar("Error", e.toString(), redColor);
    }
  }

  getSellDataList(context) async {
    // try {
    final response = await NetworkDioHttp.getDioHttpMethod(
      context: context,
      url: AppConstants.apiBaseUrl + AppConstants.getSellDataList,
    );
    return checkResponse(response, SellModel.fromJson(response['body']));
    // } catch (e) {
    //   CommonMethod().getXSnackBar("Error", e.toString(), redColor);
    // }
  }
  getCashDataList(context) async {
    try {
      final response = await NetworkDioHttp.getDioHttpMethod(
        context: context,
        url: AppConstants.apiBaseUrl + AppConstants.getCashDataList,
      );
      return checkResponse(response, CashModel.fromJson(response['body']));
    } catch (e) {
      CommonMethod().getXSnackBar("Error", e.toString(), redColor);
    }
  }
  getCreditDataList(context) async {
    try {
      final response = await NetworkDioHttp.getDioHttpMethod(
        context: context,
        url: AppConstants.apiBaseUrl + AppConstants.getCreditDataList,
      );
      return checkResponse(response, CreditModel.fromJson(response['body']));
    } catch (e) {
      CommonMethod().getXSnackBar("Error", e.toString(), redColor);
    }
  }
  getExpenseList(context) async {
    try {
      final response = await NetworkDioHttp.getDioHttpMethod(
        context: context,
        url: AppConstants.apiBaseUrl + AppConstants.getExpenseList,
      );
      return checkResponse(response, CreditModel.fromJson(response['body']));
    } catch (e) {
      CommonMethod().getXSnackBar("Error", e.toString(), redColor);
    }
  }

  getCompanyList(context) async {
      final response = await NetworkDioHttp.getDioHttpMethod(
        context: context,
        url: AppConstants.apiBaseUrl + AppConstants.getCompanyList,
      );
      return checkResponse2(response);

  }

  getProductList(context) async {
    try {
      final response = await NetworkDioHttp.getDioHttpMethod(
        context: context,
        url: AppConstants.apiBaseUrl + AppConstants.getProductList,
      );
      return checkResponse2(response);
    } catch (e) {
      CommonMethod().getXSnackBar("Error", e.toString(), redColor);
    }
  }

  getCustomerList(context) async {
    try {
      final response = await NetworkDioHttp.getDioHttpMethod(
        context: context,
        url: AppConstants.apiBaseUrl + AppConstants.getCustomerList,
      );
      return checkResponse2(response);
    } catch (e) {
      CommonMethod().getXSnackBar("Error", e.toString(), redColor);
    }
  }

  getAccountList(context) async {
    try {
      final response = await NetworkDioHttp.getDioHttpMethod(
        context: context,
        url: AppConstants.apiBaseUrl + AppConstants.getAccountList,
      );
      return checkResponse2(response);
    } catch (e) {
      CommonMethod().getXSnackBar("Error", e.toString(), redColor);
    }
  }

  addCashEntry(context, data) async {
    try {
      final response = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: AppConstants.apiBaseUrl + AppConstants.addCashEntry,
        data: data,
      );
      return checkResponse2(response);
    } catch (e) {
      CommonMethod().getXSnackBar("Error", e.toString(), redColor);
    }
  }

  getHsnCodeList(context) async {
    try {
      final response = await NetworkDioHttp.getDioHttpMethod(
        context: context,
        url: AppConstants.apiBaseUrl + AppConstants.getHsnCodeList,
      );
      return checkResponse2(response);
    } catch (e) {
      CommonMethod().getXSnackBar("Error", e.toString(), redColor);
    }
  }

  getGstList(context) async {
    try {
      final response = await NetworkDioHttp.getDioHttpMethod(
        context: context,
        url: AppConstants.apiBaseUrl + AppConstants.getGstList,
      );
      return checkResponse2(response);
    } catch (e) {
      CommonMethod().getXSnackBar("Error", e.toString(), redColor);
    }
  }



  Future<void> checkResponse(
    response,
    modelResponse,
  ) async {
    if (response["error_description"] == null ||
        response["error_description"] == 'null') {
      if (response['body']['status'] == 200 ||
          response['body']['status'] == "200") {
        return modelResponse;
      } else if (response['body']['status'] == 500 ||
          response['body']['status'] == "500") {
        return modelResponse;
      } else {
        showErrorDialog(message: response['body']['message']);
      }
    }
    else {
      showErrorDialog(message: response['body']['message']);
    }
  }

  Future<void> checkResponse2(
    response,
  ) async {
    if ((response['body']['status'] == 401 ||
        response['body']['status'] == 410)) {}
    if (response["error_description"] == null ||
        response["error_description"] == 'null') {
      if (response['body']['status'] == 200 ||
          response['body']['status'] == "200") {
        return response['body'];
      } else if (response['body']['status'] == 500 ||
          response['body']['status'] == "500") {
        showErrorDialog(message: response['body']['message']);
        return response['body'];
      } else {
        showErrorDialog(message: response['body']['message']);
      }
    } else {
      showErrorDialog(message: response['error_description']);
    }
  }

  void showErrorDialog({required String message}) {
    CommonMethod().getXSnackBar("Error", message.toString(), redColor);
  }
}
