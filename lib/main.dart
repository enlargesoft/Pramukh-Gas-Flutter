import 'package:delivery_boy/model/supplier_model.dart';
import 'package:delivery_boy/service/network_dio.dart';
import 'package:delivery_boy/utils/app_constants.dart';
import 'package:delivery_boy/utils/common_methos.dart';
import 'package:delivery_boy/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final dataStorages = GetStorage();
SupplierModel? globalUserModel = CommonMethod().getUserModel();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  NetworkDioHttp.setDynamicHeader(endPoint: AppConstants.apiBaseUrl);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemStatusBarContrastEnforced: true,
    ),
  );
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) =>

    MyApp(), // Wrap your app
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: '/splash',
      getPages: AppRoutes.routes,
      //home: HomeScreen(),
    );
  }
}
