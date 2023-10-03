class AppConstants {
  // Network Constants
  // static String apiBaseUrl = "http://192.168.29.4:9999/"; //dev new
  static String apiBaseUrl = "https://pramukh-enterprise.enlargesoftithub.com/"; //dev new

  // Authentication
  static const String login = 'api/login';
  static const String logout = 'api/logout';

  // New Stock
  static const String getOrder = 'api/get-orders';
  static const String getOrderDetails = 'api/get-order-details/';
  static const String getStockList = 'api/order-stock-list';
  static const String addNewStock = 'api/order-stock-add';

  // Sell
  static const String addSell = 'api/add-sell';
  static const String getSellDataList = 'api/add-sell';
  static const String getCompanyList = 'api/get-company-list';
  static const String getProductList = 'api/get-product-list';
  static const String getCustomerList = 'api/get-customer-list';
  static const String getHsnCodeList = 'api/get-hsn-code-list';
  static const String getGstList = 'api/get-gst-list';

  // Cash Manage
  static const String getAccountList = 'api/get-account-list';
  static const String addCashEntry = 'api/add-cash-entry';
  static const String getCashDataList = 'api/get-cash-entry';

  // Bottle Stock List
  static const String getBottleStockDataList = 'api/get-total-bottle';

  // Report
  static const String getCreditDataList = 'api/get-credit-report';
  static const String getExpenseList = 'api/get-report-expense';
}
