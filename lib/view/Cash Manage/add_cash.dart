// ignore_for_file: invalid_use_of_protected_member

import 'package:delivery_boy/utils/colors.dart';
import 'package:delivery_boy/utils/common_methos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cash_controller.dart';
import '../../utils/app_text_style.dart';
import '../../utils/common_widget/custom_dropdown_widget.dart';
import '../../utils/common_widget/text_form_field_widget.dart';
import '../../utils/common_widget/ui.dart';

class AddCash extends StatefulWidget {
  const AddCash({super.key});

  @override
  State<AddCash> createState() => _AddCashState();
}

class _AddCashState extends State<AddCash> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var controller = Get.put(CashController());

  @override
  void initState() {
    controller.clearForm().whenComplete(() {
      controller.getCustomerList(context);
      controller.getAccountList(context);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Add Cash'),
      body: Column(
        children: [
          Container(
            color: bgColor,
            height: Get.height * 0.01,
          ),
          Expanded(
            child: ListView(
              children: [
                buildForm(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFloatingButton(),
    );
  }
  Widget buildForm() {
      return Container(
        color: Colors.white,
      height: Get.height * 0.9,
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
                  labelText: 'Customer',
                  value: controller.selectedCustomer.value.isNotEmpty
                      ? controller.selectedCustomer.value
                      : null,
                  customItems:
                      controller.customerList.value.map((dynamic item) {
                    return DropdownMenuItem<dynamic>(
                      value: item,
                      child: Text(
                        item['name'].toString(),
                        style: AppTextStyle.dropDownMenuStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                    hintText: 'Select Customer',
                    onChanged: (newValue) {
                    controller.selectedCustomer.value = newValue!;
                    },
                  ),
                ),

              Obx(
                () => CustomDropdown(
                  labelText: 'Account',
                  value: controller.selectedAccount.value.isNotEmpty
                      ? controller.selectedAccount.value
                      : null,
                  customItems: controller.accountList.value.map((dynamic item) {
                    return DropdownMenuItem<dynamic>(
                      value: item,
                      child: Text(
                        item['name'].toString(),
                        style: AppTextStyle.dropDownMenuStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  hintText: 'Select Account',
                  onChanged: (newValue) {
                    controller.selectedAccount.value = newValue!;
                  },
                ),
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormFieldWidget(
                          labelText: 'Amount',
                          hintText: 'Enter Amount',
                          controller: controller.amountTextController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Amount';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                    Expanded(
                      flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => CustomDropdown(
                            labelText: 'Opening Balance',
                            value: controller
                                    .selectedOpeningBalance.value.isNotEmpty
                                ? controller.selectedOpeningBalance.value
                                : null,
                            customItems: controller.openingBalanceList.value
                                .map((dynamic item) {
                              return DropdownMenuItem<dynamic>(
                                value: item,
                                child: Text(
                                  item['name'].toString(),
                                  style: AppTextStyle.dropDownMenuStyle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                            hintText: 'Select',
                            onChanged: (newValue) {
                              controller.selectedOpeningBalance.value =
                                  newValue!;
                            },
                          ),
                        ),
                      ],
                    ),
                    ),
          
                  ],
                ),
              TextFormFieldWidget(
                labelText: 'Remark',
                hintText: 'Enter Remarks',
                keyboardType: TextInputType.text,
                controller: controller.remarkTextController,
              ),

              ],
            ),
          ),
        ),
      );
    }

    Widget buildFloatingButton() {
      return Container(
      height: Get.height * 0.1,
      width: Get.width * 0.9,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
          if (_formKey.currentState!.validate()) {
            if (controller.selectedCustomer.value.isEmpty) {
              CommonMethod()
                  .getXSnackBar("Error", 'Please select customer', redColor);
            } else if (controller.selectedAccount.value.isEmpty) {
              CommonMethod()
                  .getXSnackBar("Error", 'Please select account', redColor);
            } else if (controller.selectedOpeningBalance.value.isEmpty) {
              CommonMethod().getXSnackBar(
                  "Error", 'Please select opening balance', redColor);
            } else {
              controller.addCashEntry(context);
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
      );
    }

}
