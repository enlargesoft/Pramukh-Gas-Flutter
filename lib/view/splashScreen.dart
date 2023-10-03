import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:delivery_boy/main.dart';
import 'package:delivery_boy/model/supplier_model.dart';
import 'package:delivery_boy/utils/common_methos.dart';
import 'package:delivery_boy/view/Auth/loginScreen.dart';
import 'package:delivery_boy/view/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/common_widget/ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      if (globalUserModel != null) {
Get.offAll(const HomeScreen());
      } else {
Get.offAll(const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInUp(
            child: Center(
                child: Container(
              height: _height * 0.26,
              width: _width * 0.65,
              decoration: const BoxDecoration(
                  // color: Colors.pink[50],
                  image: DecorationImage(
                      image: AssetImage('assets/images/login.png'),
                      fit: BoxFit.fill)),
              //   child: Image.asset('assets/images/Frame.png')
            )),
          ),
          SizedBox(
            height: _height * 0.015,
          ),
          FadeInUp(
              child: const CustomTitle(
                  title: 'Delivery Boy', color: Color(0xFF262633))),
        ],
      ),
      floatingActionButton: FadeIn(
        child: Container(
          height: _height * 0.2,
          width: double.infinity,
          decoration: const BoxDecoration(
              // color: Colors.pink[50],
              image: DecorationImage(
                  image: AssetImage('assets/images/Vector.png'),
                  fit: BoxFit.fill)),
          // child: Image.asset('assets/images/Vector.png',fit: BoxFit.fill,)
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
