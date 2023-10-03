import 'package:delivery_boy/main.dart';
import 'package:delivery_boy/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/common_widget/ui.dart';

class ProfileHome extends StatefulWidget {
  const ProfileHome({super.key});

  @override
  State<ProfileHome> createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    Widget buildDetailRow(String title, String value) {
      return Column(
        children: [
          SizedBox(
            height: _height * 0.01,
          ),
          Row(
            children: [
              Expanded(child: ProfileField(title: title)),
              Expanded(child: ProfileValue(title: value)),
            ],
          ),
          SizedBox(
            height: _height * 0.01,
          ),
        ],
      );
    }

    Widget buildDivider() {
      return const Divider(
        color: Color(0xFFE6E6EC),
        thickness: 1,
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: ProfileCustomAppBar(title: 'Profile'),
      body: Padding(
        padding: EdgeInsets.only(top: _height * 0.01),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: _height * 0.21,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: _height * 0.1,
                      width: _width * 0.2,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage('assets/images/profile.png'),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(
                      height: _height * 0.02,
                    ),
                    if (globalUserModel != null)
                      AppbarTitle(
                          title: globalUserModel!.name,
                          color: const Color(0xFF060E30)),
                  ],
                ),
              ),
              if (globalUserModel != null)
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                  child: Container(
                    height: _height * 0.42,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F7FA),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 15, bottom: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Row(
                          //   children: [
                          //     Expanded(
                          //         child: AllPageFormField(title: 'Full Name')),
                          //     Expanded(child: buildFieldValue('John Doe')),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: _height * 0.01,
                          // ),
                          // Divider(
                          //   color: Color(0xFFE6E6EC),
                          //   thickness: 2,
                          // ),
                            buildDetailRow('Full Name', globalUserModel!.name),
                          buildDivider(),
                            buildDetailRow(
                                'Username', globalUserModel!.userName),
                          buildDivider(),
                            buildDetailRow(
                                'Mobile No.', globalUserModel!.mobileNo),
                          buildDivider(),
                          buildDetailRow(
                              'Address', globalUserModel!.address),
                          buildDivider(),
                            buildDetailRow(
                                'Tempo No.', globalUserModel!.id.toString()),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
