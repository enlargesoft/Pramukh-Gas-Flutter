import 'package:delivery_boy/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/common_widget/ui.dart';

class EmptyStockHome extends StatefulWidget {
  const EmptyStockHome({super.key});

  @override
  State<EmptyStockHome> createState() => _EmptyStockHomeState();
}

class _EmptyStockHomeState extends State<EmptyStockHome> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    Widget buildFlotingButton() {
      return Container(
        height: _height * 0.1,
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            Get.toNamed('/addNewStock');
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            height: _height * 0.055,
            width: _width * 0.9,
            child: ButtonText(title: 'Add New Stock'),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(title: 'New Stock'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: _height * 0.01,
          ),
          Container(
            height: _height * 0.8,
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/emptyStock.png',
                  width: _width * 0.5,
                ),
                SizedBox(
                  height: _height * 0.05,
                ),
                Text(
                  'No List Found!',
                  style: TextStyle(
                      color: Color(0x9CA3AF99),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.normal,
                      fontSize: _height * 0.02),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFlotingButton(),
    );
  }
}
