import 'package:delivery_boy/view/splashScreen.dart';
import 'package:get/get.dart';

import '../view/Auth/loginScreen.dart';
import '../view/Bottle StockList/stocklist_home.dart';
import '../view/Cash Manage/add_cash.dart';
import '../view/Cash Manage/cash_home.dart';
import '../view/Credit Report/creditHome.dart';
import '../view/Expense Report/expenseHome.dart';
import '../view/New Stock/addNewStock_form.dart';
import '../view/New Stock/emptyStockHome.dart';
import '../view/New Stock/newStock_home.dart';
import '../view/Profile/profileHome.dart';
import '../view/Sell/addSell.dart';
import '../view/Sell/sellHome.dart';
import '../view/homeScreen.dart';

class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(name: '/splash', page: () => SplashScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/profile', page: () => ProfileHome()),
    GetPage(name: '/newStockHome', page: () => NewStockHome()),
    GetPage(name: '/addNewStock', page: () => AddNewStock()),
    GetPage(name: '/sellHome', page: () => SellHome()),
    GetPage(name: '/addSell', page: () => AddSell()),
    GetPage(name: '/cashHome', page: () => CashHome()),
    GetPage(name: '/addCash', page: () => AddCash()),
    GetPage(name: '/stockListHome', page: () => StockListHome()),
    GetPage(name: '/creditHome', page: () => CreditReportHome()),
    GetPage(name: '/expenseHome', page: () => ExpenseReportHome()),
    GetPage(name: '/emptyStockHome', page: () => EmptyStockHome()),
  ];
}
