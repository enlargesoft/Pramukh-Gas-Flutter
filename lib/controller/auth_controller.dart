// ignore_for_file: unnecessary_null_comparison

import 'package:delivery_boy/main.dart';
import 'package:delivery_boy/service/network_repository.dart';
import 'package:delivery_boy/utils/colors.dart';
import 'package:delivery_boy/utils/common_methos.dart';
import 'package:delivery_boy/view/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/login_user_model.dart';
import '../service/network_dio.dart';
import '../utils/app_constants.dart';

class AuthController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  RxBool showpassword = true.obs;

  Future clearForm() async {
    usernameController.clear();
    passwordController.clear();
    
  }
  Future userLogin(BuildContext context) async {
    var data = {
      'user_name': usernameController.text,
      'password': passwordController.text
    };
    LoginUserModel response = await networkRepository.userLogin(context, data);
    if (response != null && response.status == 200) {
      CommonMethod()
          .getXSnackBar("Success", response.message.toString(), greenColor);
      if (response.supplier != null) {
        await CommonMethod().storeUserModel(response.supplier!);
        await NetworkDioHttp.setDynamicHeader(
            endPoint: AppConstants.apiBaseUrl);
        Get.offAll(() => const HomeScreen());
      }

      usernameController.clear();
      passwordController.clear();
    }
  }

  Future userLogout(BuildContext context) async {
    var data = {
      'auth_token': globalUserModel!.authToken,
    };
    var response = await networkRepository.userLogout(context, data);
    if (response != null) {
      CommonMethod()
          .getXSnackBar("Success", response['message'].toString(), greenColor);
      await dataStorages.erase().whenComplete(() {});
    }
  }
}
