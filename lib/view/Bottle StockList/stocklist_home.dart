import 'package:delivery_boy/utils/colors.dart';
import 'package:delivery_boy/model/bottle_stock_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/bottle_stock_controller.dart';
import '../../utils/common_widget/ui.dart';

class StockListHome extends StatefulWidget {
  const StockListHome({super.key});

  @override
  State<StockListHome> createState() => _StockListHomeState();
}

class _StockListHomeState extends State<StockListHome> {
var controller = Get.put(BottleStockController());

  @override
  void initState() {
    refreshPage();
    super.initState();
  }

  refreshPage() {
    controller.getBottleStockDataList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(title: 'Bottle Stock List'),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.bottleStockList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const CustomSpace(),
                      buildContainer(controller.bottleStockList.value[index]),
                    ],
                  );
                },
              ),
            ),
          )
        ],
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


  Widget buildContainer(BottleStockDataModel data) {
    return Container(
        width: double.infinity,
        color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFiledValue('Company', data.companyName),
            buildFiledValue('Product', data.productName),
            buildFiledValue(
                'No. Of Filled Bottle', data.numOfFilledBottle.toString()),
            buildFiledValue(
                'No. Of Empty Bottle', data.numOfEmptyBottle.toString()),
            buildFiledValue('Total Bottle', data.totalBottle.toString()),
          ],
        ),
      ),
      );
    }

}
