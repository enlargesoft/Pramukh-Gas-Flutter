import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static final dropDownMenuStyle = TextStyle(
    fontWeight: FontWeight.w400,
    color: primaryBlack,
    fontFamily: 'Inter',
    fontSize: Get.height * 0.016,
  );

  static const normalRegular16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: primaryBlack,
  );

  static const normalSemiBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: primaryBlack,
  );

  static const normalBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: primaryBlack,
  );

  static const normalBold20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: primaryBlack,
  );


  static const normalSemiBold14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: primaryBlack,
  );

}
