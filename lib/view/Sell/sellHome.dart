import 'package:delivery_boy/controller/sell_controller.dart';
import 'package:delivery_boy/model/sell_model.dart';
import 'package:delivery_boy/utils/colors.dart';
import 'package:delivery_boy/view/Sell/addSell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/common_widget/ui.dart';

class SellHome extends StatefulWidget {
  const SellHome({super.key});

  @override
  State<SellHome> createState() => _SellHomeState();
}

class _SellHomeState extends State<SellHome> {
var controller = Get.put(SellController());
  @override
  void initState() {
    refreshPage();
    super.initState();
  }

  Future refreshPage() async {
    controller.getSellDataList(context);
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    Widget buildSize() {
      return SizedBox(
        height: _height * 0.022,
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

    Widget buildContainer(SellDataModel data) {
      return Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildFiledValue('Company', data.companyName),
              buildFiledValue('Product', data.productName),
              buildFiledValue('HSN Code', data.hsnCode),
              buildFiledValue('GST', data.gst.toString()),
              buildFiledValue('CH No.', data.chNumber.toString()),
              buildFiledValue('Filled Bottle Delivered',
                  data.filledBottleDelivered.toString()),
              buildFiledValue(
                  'Empty Bottle Received', data.emptyBottleReceived.toString()),
              buildFiledValue(
                  'Total Bottle',
                  (data.filledBottleDelivered + data.emptyBottleReceived)
                      .toString()),
              buildFiledValue('Rate Per Bottle', data.ratePerBottle.toString()),
              buildFiledValue(
                  'Net Payable Amount', data.netPayableAmount.toString()),
              buildFiledValue('Total Payment', data.totalPayment.toString()),
            ],
          ),
        ),
      );
    }

    Widget buildFloatingActionButton(){
      return Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        height: _height * 0.08,
        width: _width * 0.2,
        child: FloatingActionButton(
          backgroundColor:primaryColor,
          onPressed: () {
            Get.to(() => AddSell())!.then((value) => refreshPage());
          },
          child: Icon(Icons.add),
        ),
      );
    }

    return Scaffold(
      backgroundColor:bgColor,
      appBar: CustomAppBar(title: 'Sell'),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.sellDataList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const CustomSpace(),
                      buildContainer(controller.sellDataList.value[index]),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:buildFloatingActionButton(),
    );
  }
}
