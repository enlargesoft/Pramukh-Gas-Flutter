// ignore_for_file: invalid_use_of_protected_member

import 'package:delivery_boy/controller/report_contoller.dart';
import 'package:delivery_boy/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_text_style.dart';
import '../../utils/common_widget/custom_dropdown_widget.dart';
import '../../utils/common_widget/ui.dart';

class CreditReportHome extends StatefulWidget {
  const CreditReportHome({super.key});

  @override
  State<CreditReportHome> createState() => _CreditReportHomeState();
}

class _CreditReportHomeState extends State<CreditReportHome> {
var controller = Get.put(CreditReportContoller());
  @override
  void initState() {
    refreshData();
    super.initState();
  }

  refreshData() {
    controller.getCreditDataList(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:bgColor,
      appBar: CustomAppBar(title: 'Credit Report'),
      body: GetBuilder<CreditReportContoller>(
          init: CreditReportContoller(),
          
          builder: (controller) {
            return Column(
              children: [
                Container(
                  color: bgColor,
                  height: Get.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomDropdown(
                    value: controller.selectedYear.value.isNotEmpty
                        ? controller.selectedYear.value
                        : null,
                    customItems: controller.yearList.value.map((dynamic item) {
                      return DropdownMenuItem<dynamic>(
                        value: item,
                        child: Text(
                          item['name'].toString(),
                          style: AppTextStyle.dropDownMenuStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                hintText: 'Select Year',
                onChanged: (newValue) {
                      controller.selectedYear.value = newValue!;
                      controller.update();
                },
              ),
            ),

                Container(
                  height: Get.height * 0.07,
                  width: double.infinity,
                  color: Colors.white,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 0,
                          child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: ReportField(title: 'Sr No.'))),
                      Flexible(flex: 1, child: ReportField(title: 'Month')),
                      Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(right: 15.0),
                            child: ReportField(title: 'Amount'),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.008,
                ),

                Expanded(
                    child: Container(
                  color: const Color(0xFFF7F7FA),
                  child: ListView.builder(
                      itemCount: controller.creditList.value.length,
                      itemBuilder: (context, index) {
                        var data = controller.creditList.value[index];
                        return buildCredit((index + 1).toString(), data.month,
                            data.amount.toString());
                      }),
                )),
              ],
            ); 
          }
      ),
    );
  }

  Widget buildCredit(String no, String month, String amt) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Get.height * 0.008,
      ),
      child: Container(
        height: Get.height * 0.06,
        color: Colors.white,
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ReportValue(title: no),
                )),
            Flexible(flex: 1, child: ReportValue(title: month)),
            Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: ReportValue(title: amt.toString()),
                )),
          ],
        ),
      ),
    );
  }

}
