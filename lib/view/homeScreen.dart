// import 'package:animate_do/animate_do.dart';
import 'package:delivery_boy/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/common_widget/ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });
  //final String username;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    Widget buildConatiner(
        String title, Color color,Color color1, Color borderColor,String img, VoidCallback ontap) {
      return GestureDetector(
        onTap: ontap,
        child: Container(
          height: _height * 0.12,
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: [
              SizedBox(
                width: _width * 0.045,
              ),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    height: _height * 0.10,
                    width: _width * 0.82,
                    //   color: Colors.red,
                    child: Row(
                      children: [
                        Container(
                          height: _height * 0.075,
                          width: _height * 0.075,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              // image: DecorationImage(
                              //     image: AssetImage(img), fit: BoxFit.fill),
                              color: color1),
                          child: Image.asset(
                            alignment: Alignment.center,
                            img,
                            fit: BoxFit.cover,
                            width: _height * 0.04,
                            height: _height * 0.04,
                          ),
                        ),
                        SizedBox(
                          width: _width * 0.03,
                        ),
                        HomeFieldTitle(title: title, color: Color(0xFF060E30)),
                      ],
                    ),
                  ),
                  Container(
                      width: _height * 0.04,
                      height: _height * 0.04,
                      child: Image.asset('assets/images/home_rightArrow.png')),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget buildHeader() {
      return Container(
          height: _height * 0.07,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: _width * 0.75,
                height: _height * 0.07,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoginSubTitle(title: 'Hello,', color: Color(0xFF6A6E83)),
                    SizedBox(
                      height: _height * 0.008,
                    ),
                    //    LoginTitle(title: 'Hi\t${widget.username}👏', color: Colors.black),
                    LoginTitle(title: 'Hi\tJohn Doe\t👏', color: Colors.black)
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/profile');
                },
                child: Container(
                    height: _height * 0.07,
                    width: _width * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/profile.png',
                          ),
                          fit: BoxFit.contain),
                    )
                    //child: Image.asset('assets/images/user.png',height: _height*0.1,width: _width*0.13,)
                    ),
              ),
            ],
          ));
    }

    Widget buildSize() {
      return SizedBox(
        height: _height * 0.025,
      );
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: _width * 0.05, vertical: _height * 0.03),
              child: Column(
                children: [
                  FadeInDownBig(child: buildHeader()),
                  SizedBox(
                    height: _height * 0.035,
                  ),
                  FadeInLeftBig(
                    child: buildConatiner(
                        'New Stock',
                        newStockBgColor,
                        newStockImgBgColor,
                        newStockBorderColor,
                        'assets/images/homepage_image/new_stock.png', () {
                      Get.toNamed('/newStockHome');
                    }),
                  ),
                  buildSize(),
                  FadeInRightBig(
                    child: buildConatiner(
                        'Sell',
                        sellBgColor,
                        sellImgBgColor,
                        sellBorderColor,
                        'assets/images/homepage_image/sell.png', () {
                      Get.toNamed('/sellHome');
                    }),
                  ),
                  buildSize(),
                  FadeInLeftBig(
                    child: buildConatiner(
                        'Cash Manage',
                        cashBgColor,
                        cashImgBgColor,
                        cashBorderColor,
                        'assets/images/homepage_image/cash_manage.png', () {
                      Get.toNamed('/cashHome');
                    }),
                  ),
                  buildSize(),
                  FadeInRightBig(
                    child: buildConatiner(
                        'Bottle Stock List',
                        bottleStockBgColor,
                        bottleStockImgBgColor,
                        bottleStockBorderColor,
                        'assets/images/homepage_image/bottle_stock.png', () {
                      Get.toNamed('/stockListHome');
                    }),
                  ),
                  buildSize(),
                  FadeInLeftBig(
                    child: buildConatiner(
                        'Credit Report',
                        creditBgColor,
                        creditImgBgColor,
                        creditBorderColor,
                        'assets/images/homepage_image/credit.png', () {
                      Get.toNamed('/creditHome');
                    }),
                  ),
                  buildSize(),
                  FadeInRightBig(
                    child: buildConatiner(
                        'Report Expense',
                        expenseBgColor,
                        expenseImgBgColor,
                        expenseBorderColor,
                        'assets/images/homepage_image/expense.png', () {
                      Get.toNamed('/expenseHome');
                    }),
                  ),
                  buildSize(),
                  FadeInLeftBig(
                    child: buildConatiner(
                        'Empty List',
                        newStockBgColor,
                        newStockImgBgColor,
                        newStockBorderColor,
                        'assets/images/homepage_image/new_stock.png', () {
                      Get.toNamed('/emptyStockHome');
                    }),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
