// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';

import 'package:delivery_boy/utils/app_text_style.dart';
import 'package:delivery_boy/utils/colors.dart';
import 'package:delivery_boy/utils/common_methos.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/stock_controller.dart';
import '../../utils/common_widget/custom_dropdown_widget.dart';
import '../../utils/common_widget/text_form_field_widget.dart';
import '../../utils/common_widget/ui.dart';

class AddNewStock extends StatefulWidget {
  const AddNewStock({super.key});

  @override
  State<AddNewStock> createState() => _AddNewStockState();
}

class _AddNewStockState extends State<AddNewStock> {
  final _formKey = GlobalKey<FormState>();

var controller = Get.put(StockController());

@override
  void initState() {
    controller.clearForm().whenComplete(() =>



        controller.getOrder(context));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Add New Stock'),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Container(
                color: bgColor,
                height: Get.height * 0.01,
              ),
              buildForm(),
              SizedBox(
                height: Get.height * 0.1,
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: Get.height * 0.1,
        width: Get.width * 0.9,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              if (int.parse(controller.receivedBottleTextController.text) >
                  int.parse(controller.orderBottleTextController.text)) {
                CommonMethod().getXSnackBar(
                    "Error", "Invalid No.Of Bottle Received Input", redColor);
              } else {
              controller.addNewStock(context);

              }
            }
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            height: Get.height * 0.055,
            width: Get.width * 0.9,
            child: const ButtonText(title: 'Submit'),
          ),
        ),
      ),
    );
  
  
  }
  Widget buildForm() {
      return SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Obx(
                    () => CustomDropdown(
                    labelText: "Order",
                    value:
                    controller.selectedOrder.value.isNotEmpty
                          ? controller.selectedOrder.value
                        :
                    null,
                      customItems:
                          controller.orderList.value.map((dynamic item) {
                            log('=-------${
                                (item['order_date'].toString())
                            }');
                        return DropdownMenuItem<dynamic>(
                          value: item,
                          child: Text(
                              item['order_date']==null ? "":    controller
                                .getFormatedDate(item['order_date'].toString()),
                            style: AppTextStyle.dropDownMenuStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      hintText: 'Select Order',
                      onChanged: (newValue) {
                      if (newValue != null) {
                        controller.selectedOrder.value = newValue!;
                        controller.getOrderDetails(
                            context, newValue['id'].toString());
                      }
                      },
                    ),
                  ),
          

                  Obx(
                    () => IgnorePointer(
                      ignoring: controller.companyList.value.isEmpty,
                      child: CustomDropdown(
                      labelText: "Company",
                        value: controller.selectedCompany.value,
                        items: controller.companyList.value,
                        hintText: 'Select Category',
                        onChanged: (newValue) {
                          controller.selectedCompany.value = newValue;
                        },
                      ),
                    ),
                  ),

                  Obx(
                    () => IgnorePointer(
                      ignoring: controller.productList.value.isEmpty,
                      child: CustomDropdown(
                      labelText: "Product",
                        value: controller.selectedProduct.value,
                        items: controller.productList.value,
                        hintText: 'Select Product',
                        onChanged: (newValue) {
                          controller.selectedProduct.value = newValue;
                        },
                      ),
                    ),
                  ),
                TextFormFieldWidget(
                  labelText: 'No. Of Bottle Order',
                  hintText: 'Enter No. Of Bottle Order',
                  controller: controller.orderBottleTextController,
                  readonly: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter No. Of Bottle Order';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                ),
                TextFormFieldWidget(
                  labelText: 'No. Of Bottle Received',
                  hintText: 'Enter No. Of Bottle Received',
                  controller: controller.receivedBottleTextController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter no.of bottle received';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                ),
                TextFormFieldWidget(
                  labelText: 'Remarks',
                  hintText: 'Enter Remarks',
                  controller: controller.remarkTextController,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
