import 'package:delivery_boy/controller/cash_controller.dart';
import 'package:delivery_boy/utils/colors.dart';
import 'package:delivery_boy/view/Cash%20Manage/add_cash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/cash_model.dart';
import '../../utils/common_widget/ui.dart';

class CashHome extends StatefulWidget {
  const CashHome({super.key});

  @override
  State<CashHome> createState() => _CashHomeState();
}

class _CashHomeState extends State<CashHome> {
  var controller = Get.put(CashController());
  @override
  void initState() {
    refreshPage();
    super.initState();
  }

  refreshPage() {
    controller.getCashDataList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(title: 'Cash Entry'),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.cashList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const CustomSpace(),
                      buildContainer(controller.cashList.value[index]),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: buildFlotingButton(),
    );
  }

  Widget buildContainer(CashDataModel data) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFiledValue('Customer', data.customerName),
            buildFiledValue('Account', data.accountName),
            buildFiledValue('Amount', data.amount.toString()),
            buildFiledValue('Remarks', data.remarks ?? ""),
          ],
        ),
      ),
    );
  }

  Widget buildFiledValue(String field, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: AllPageField(title: field),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: AllPageValue(title: value),
          )),
        ],
      ),
    );
  }

  Widget buildFlotingButton() {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      height: Get.height * 0.1,
      width: Get.width * 0.2,
      child: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.to(() => const AddCash())!.then((value) => refreshPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
