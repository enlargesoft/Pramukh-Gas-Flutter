import 'package:delivery_boy/controller/stock_controller.dart';
import 'package:delivery_boy/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/stock_model.dart';
import '../../utils/common_widget/ui.dart';
import 'addNewStock_form.dart';

class NewStockHome extends StatefulWidget {
  const NewStockHome({super.key});

  @override
  State<NewStockHome> createState() => _NewStockHomeState();
}

class _NewStockHomeState extends State<NewStockHome> {
  var controller = Get.put(StockController());
  @override
  void initState() {
    refreshPage();
    super.initState();
  }

  Future refreshPage() async {
    await controller.getStockList(context);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    double leadingSize = MediaQuery.of(context).size.width * 0.05;

    Widget buildStockList() {
      return Container(
        height: _height * 0.19,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: _height * 0.09,
              // color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        //color: Colors.purple,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 4.0, right: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AllPageField(title: 'Company'),
                              AllPageValue(title: 'Bharat Gas'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.black38,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AllPageField(title: 'Product'),
                              AllPageValue(title: '19.2 Kg'),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: _height * 0.1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
                child: Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.0, right: 4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AllPageField(title: 'No.Of Bottle Received'),
                            AllPageValue(title: '100'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.purple,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 4.0, right: 4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AllPageField(title: 'No.Of Bottle Return'),
                              AllPageValue(title: '20'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buildFlotingButton() {
      return Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        height: _height * 0.08,
        width: _width * 0.2,
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            Get.to(() => AddNewStock())!.then((value) => refreshPage());
            // Get.offAndToNamed('/addNewStock');
          },
          child: const Icon(Icons.add),
        ),
      );
    }

    Widget buildSize() {
      return SizedBox(
        height: _height * 0.022,
      );
    }

    Widget buildFiledValue(String field, String value) {
      return Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: AllPageField(title: field),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: AllPageValue(title: value),
          )),
        ],
      );
    }

    Widget buildContainer(StockOrderListModel data) {
      return Container(
        height: _height * 0.19,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildFiledValue('Company', data.companyName ?? ""),
            buildFiledValue('Product', data.productName ?? ""),
            buildFiledValue(
                'No. Of Bottle Order', data.numberOfBottleOrder.toString()),
            buildFiledValue('No. Of Bottle Received',
                data.numberOfBottleReceived.toString()),
            buildFiledValue('Remarks', data.remarks ?? ""),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(title: 'New Stock'),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.stockList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const CustomSpace(),
                      buildContainer(controller.stockList.value[index]),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
      //  SingleChildScrollView(
      //   child: Container(
      //     padding: const EdgeInsets.only(bottom: 25),
      //     child: Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           const CustomSpace(),
      //           buildContainer(),
      //           const CustomSpace(),
      //           buildContainer(),
      //           const CustomSpace(),
      //           buildContainer(),
      //           const CustomSpace(),
      //           buildContainer(),
      //           const CustomSpace(),
      //           buildContainer(),
      //           const CustomSpace(),
      //           buildContainer(),
      //         ]),
      //   ),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: buildFlotingButton(),
    );
  }
}
