// ignore_for_file: invalid_use_of_protected_member

import 'package:delivery_boy/utils/colors.dart';
import 'package:delivery_boy/utils/common_methos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/sell_controller.dart';
import '../../utils/app_text_style.dart';
import '../../utils/common_widget/custom_dropdown_widget.dart';
import '../../utils/common_widget/text_form_field_widget.dart';
import '../../utils/common_widget/ui.dart';

class AddSell extends StatefulWidget {
  const AddSell({super.key});

  @override
  State<AddSell> createState() => _AddSellState();
}

class _AddSellState extends State<AddSell> {
  var controller = Get.put(SellController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller.clearForm().whenComplete(() => refreshPage());
    super.initState();
  }

  Future refreshPage() async {
    controller.getCompanyList(context);
    controller.getProductList(context);
    controller.getCustomerList(context);
    controller.getHsnCodeList(context);
    controller.getGstList(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Add Sell'),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            color: bgColor,
            height: Get.height * 0.01,
          ),
          buildForm(),
          SizedBox(
            height: Get.height * 0.08,
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
        child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 0),
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                  () => CustomDropdown(
                    labelText: 'Company',
                    value: controller.selectedCompany.value.isNotEmpty
                        ? controller.selectedCompany.value
                        : null,
                    customItems:
                        controller.companyList.value.map((dynamic item) {
                      return DropdownMenuItem<dynamic>(
                        value: item,
                        child: Text(
                          item['name'].toString(),
                          style: AppTextStyle.dropDownMenuStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                    hintText: 'Select Company',
                    onChanged: (newValue) {
                      controller.selectedCompany.value = newValue!;
                    },
                  ),
                ),

                  Obx(
                  () => CustomDropdown(
                    labelText: 'Product',
                    value: controller.selectedProduct.value.isNotEmpty
                        ? controller.selectedProduct.value
                        : null,
                    customItems:
                        controller.productList.value.map((dynamic item) {
                      return DropdownMenuItem<dynamic>(
                        value: item,
                        child: Text(
                          item['name'].toString(),
                          style: AppTextStyle.dropDownMenuStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                    hintText: 'Select Product',
                    onChanged: (newValue) {
                      controller.selectedProduct.value = newValue!;
                    },
                  ),
                ),
            
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

                  TextFormFieldWidget(
                    labelText: 'Ch Number',
                    hintText: 'Enter Che Number',
                    controller: controller.chNumberTextController,
                  keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid Cheque no.';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormFieldWidget(
                    labelText: 'No. of Filled Bottle Delivered',
                    hintText: 'Enter No. of Filled Bottle Delivered',
                    keyboardType: TextInputType.number,
                    controller: controller.deliveredTextController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter filled delivered bottles ';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormFieldWidget(
                    labelText: 'No. of Empty Bottle Received',
                    hintText: 'Enter No. of Empty Bottle Received',
                    keyboardType: TextInputType.number,
                    controller: controller.receivedTextController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter empty received bottles ';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormFieldWidget(
                    labelText: 'Total No. of Bottle',
                    hintText: 'Enter No.of Bottle',
                    keyboardType: TextInputType.number,
                    controller: controller.totalBottleTextController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter No.of Bottle';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormFieldWidget(
                    labelText: 'Rate Per Bottle',
                    hintText: 'Enter Rate Per Bottle',
                    keyboardType: TextInputType.number,
                    controller: controller.rateTextController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Rate Per Bottle';
                      } else {
                        return null;
                      }
                    },
                  ),

                  Obx(
                    () => CustomDropdown(
                    labelText: 'HSN Code',
                    value: controller.selectedHsnCode.value.isNotEmpty
                        ? controller.selectedHsnCode.value
                        : null,
                    customItems:
                        controller.hsnCodeList.value.map((dynamic item) {
                      return DropdownMenuItem<dynamic>(
                        value: item,
                        child: Text(
                          item['hsn_code'].toString(),
                          style: AppTextStyle.dropDownMenuStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                    hintText: 'Select HSN Code',
                      onChanged: (newValue) {
                      controller.selectedHsnCode.value = newValue!;
                      },
                    ),
                  ),

                  Obx(
                    () => CustomDropdown(
                    labelText: 'GST',
                    value: controller.selectedGst.value.isNotEmpty
                        ? controller.selectedGst.value
                        : null,
                    customItems: controller.gstList.value.map((dynamic item) {
                      return DropdownMenuItem<dynamic>(
                        value: item,
                        child: Text(
                          item['percentage'].toString(),
                          style: AppTextStyle.dropDownMenuStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                    hintText: 'Select GST',
                      onChanged: (newValue) {
                      controller.selectedGst.value = newValue!;
                      },
                    ),
                  ),
                  TextFormFieldWidget(
                    labelText: 'Net Payable Amount',
                    hintText: 'Enter Net Payable Amount',
                    keyboardType: TextInputType.number,
                    controller: controller.netPayableTextController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Net Payable Amount';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormFieldWidget(
                    labelText: 'Total Payable Received From Customer',
                    hintText: 'Enter Total Payable',
                    keyboardType: TextInputType.number,
                    controller: controller.totalPayableTextController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Total Payable';
                      } else {
                        return null;
                      }
                    },
                  ),

                  SizedBox(
                  height: Get.height * 0.09,
                  ),

                ],
              ),
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
            if (controller.selectedCompany.value.isEmpty) {
              CommonMethod()
                  .getXSnackBar("Error", "Please select company", redColor);
            } else if (controller.selectedProduct.value.isEmpty) {
              CommonMethod()
                  .getXSnackBar("Error", "Please select product", redColor);
            } else if (controller.selectedCustomer.value.isEmpty) {
              CommonMethod()
                  .getXSnackBar("Error", "Please select customer", redColor);
            } else if (controller.selectedHsnCode.value.isEmpty) {
              CommonMethod()
                  .getXSnackBar("Error", "Please select HSN code", redColor);
            } else if (controller.selectedGst.value.isEmpty) {
              CommonMethod()
                  .getXSnackBar("Error", "Please select GST", redColor);
            } else {
              controller.addSell(context);
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
