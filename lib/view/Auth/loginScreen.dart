import 'package:animate_do/animate_do.dart';
import 'package:delivery_boy/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/common_widget/ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var controller = Get.put(AuthController());
@override
  void initState() {
    controller.clearForm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;
    Icon vison = Icon(
      Icons.visibility_outlined,
      color: Colors.black,
      size: _height * 0.022,
    );
    Icon visoff = Icon(
      Icons.visibility_off_outlined,
      color: Colors.black,
      size: _height * 0.022,
    );

    Widget buildUsername() {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller.usernameController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter a valid Username';
          } else {
            return null;
          }
        },
        obscureText: false,
        cursorColor: const Color(0xFF060E30),
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 15),
          errorStyle: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: _height * 0.016,
              color: Colors.red),
          hintText: 'Enter Username',
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: _height * 0.016,
            color: const Color(0xFF9CA3AF),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFD1D5DB))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFD1D5DB))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFD1D5DB))),
        ),
      );
      
    }

    Widget buildPassword() {
      return Obx(() => TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: controller.showpassword.value,
            controller: controller.passwordController,
            cursorColor: const Color(0xFF060E30),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter a valid password';
          }
          return null;
        },
            style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: _height * 0.016,
                  color: const Color(0xFF9CA3AF)),
          contentPadding:
                  const EdgeInsets.only(
                  top: 10, bottom: 10, right: 10, left: 15),
          suffixIcon: IconButton(
                icon: controller.showpassword.value ? visoff : vison,
            onPressed: () {
                  // setState(() {
                  controller.showpassword.value =
                      !controller.showpassword.value;
                  // });
            },
          ),
          hintText: "Enter Password",
          errorStyle: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: _height * 0.016,
              color: Colors.red),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFD1D5DB))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFD1D5DB))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFD1D5DB))),
        ),
          ));
    }

    Widget buildFlotingButton() {
      return Container(
        height: _height * 0.08,
        width: _width * 0.9,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () async {
            if (controller.formkey.currentState!.validate()) {

              await controller.userLogin(context);
            }
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            height: _height * 0.055,
            width: _width * 0.9,
            child: const ButtonText(title: 'Log In'),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: _height * 0.1,
                    ),
                    FadeInDown(
                      child: Center(
                          child: Container(
                        height: _height * 0.3,
                        width: _width * 0.75,
                        decoration: const BoxDecoration(
                            // color: Colors.pink[50],
                            image: DecorationImage(
                                image: AssetImage('assets/images/login.png'),
                                fit: BoxFit.fill)),
                        //   child: Image.asset('assets/images/Frame.png')
                      )),
                    ),
                    SizedBox(
                      height: _height * 0.03,
                    ),
                    FadeInDown(
                      child: Container(
                          alignment: Alignment.center,
                          height: _height * 0.08,
                          width: _width * 0.6,
                          child: Column(
                            children: [
                              const LoginTitle(
                                  title: 'Log In', color: Color(0xFF060E30)),
                              SizedBox(
                                height: _height * 0.011,
                              ),
                              const LoginSubTitle(
                                  title: 'Let’s Get To work',
                                  color: Color(0xFF6A6E83)),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: _height * 0.04,
                    ),
                    FadeIn(
                      child: Form(
                        key: controller.formkey,
                        // autovalidateMode: AutovalidateMode.always,
                        child: Container(
                          height: _height * 0.3,
                          width: _width * 0.9,
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const LoginFieldTitle(
                                  title: 'Username', color: Color(0xFF060E30)),
                              SizedBox(
                                height: _height * 0.01,
                              ),
                              buildUsername(),
                              SizedBox(
                                height: _height * 0.022,
                              ),
                              const LoginFieldTitle(
                                  title: 'Password', color: Color(0xFF060E30)),
                              SizedBox(
                                height: _height * 0.01,
                              ),
                              buildPassword(),
                              SizedBox(
                                height: _height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          FadeInUp(child: buildFlotingButton())
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: buildFlotingButton(),
    );
  }
}
