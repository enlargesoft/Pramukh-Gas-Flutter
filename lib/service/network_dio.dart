// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../main.dart';
import '../utils/common_methos.dart';
import '../utils/common_widget/internet_error.dart';
import '../utils/process_indicator.dart';
import '../view/Auth/loginScreen.dart';
import 'network_repository.dart';

// import '../process_indicator.dart';

class NetworkDioHttp {
  static Dio _dio = Dio();
  static String? endPointUrl;
  static Options? _cacheOptions;
  static DioCacheManager? _dioCacheManager;
  static Circle processIndicator = Circle();
  NetworkCheck networkCheck = NetworkCheck();
  static InternetError internetError = InternetError();
  static NetworkRepository networkRepository = NetworkRepository();

  static Future<Map<String, String>> getHeaders() async {
    var user = await CommonMethod().getUserModel();
    final String? token = await user!.authToken;
    log("Token :- " + token.toString());
    if (token != null) {
      log('~~~~~~~~~~~~~~~~~~~~ SET HEADER : $token ~~~~~~~~~~~~~~~~~~~');
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
        
      };
    } else {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    }
  }

  static setDynamicHeader({@required String? endPoint}) async {
    endPointUrl = endPoint;
    BaseOptions options =
        BaseOptions(
      receiveTimeout: 50000,
      connectTimeout: 50000,
      contentType: 'application/json',
    );
    _dioCacheManager = DioCacheManager(CacheConfig());
    final token = await getHeaders();
    options.headers.addAll(token);
    _dio = Dio(options);
    _dio.interceptors.add(_dioCacheManager!.interceptor);
// customization
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  //Get Method
  static Future<Map<String, dynamic>> getDioHttpMethod({
    BuildContext? context,
    required String url,
    final header,
  }) async {
    var internet = await check();
    if (internet) {
      if (context != null) processIndicator.show(context);
      try {
        Response response =
            await _dio!.get(url, options: header ?? _cacheOptions);

        var responseBody;
        if (response.statusCode == 200) {
          try {
            responseBody = json.decode(response.data);
          } catch (error) {
            responseBody = response.data;
          }
          Map<String, dynamic> data = {
            'body': responseBody,
            'headers': response.headers,
            'error_description': null,
          };
          if (context != null) processIndicator.hide(context);
          return data;
        } else {
          if (context != null) processIndicator.hide(context);
          return {
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } on DioError catch (e) {
        if (e.type == DioErrorType.other) {
          if (context != null) processIndicator.hide(context);
          return await getDioHttpMethod(url: url, context: context);
        }
        if (context != null) processIndicator.hide(context);
        Map<String, dynamic> responseData = {
          'body': null,
          'headers': null,
          'error_description': await _handleError(e, context,
              message: e.response?.data['message']),
        };
        if (e.response != null && e.response!.statusCode == 498) {
          dataStorages
              .erase()
              .whenComplete(() => getx.Get.offAll(() => LoginScreen()));
        }
      
        return responseData;
      }
    } else {
      Map<String, dynamic> responseData = {
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      internetError.addOverlayEntry(context);
      return responseData;
    }
  }

  //Put Method
  static Future<Map<String, dynamic>> putDioHttpMethod({
    BuildContext? context,
    required String url,
    required data,
    final header,
  }) async {
    var internet = await check();
    if (internet) {
      if (context != null) processIndicator.show(context);
      try {
        Response response =
            await _dio!.put(url, data: data, options: header ?? _cacheOptions);
        print(response);
        var responseBody;
        if (response.statusCode == 200) {
          if (context != null) processIndicator.hide(context);
          try {
            responseBody = json.decode(json.encode(response.data));
          } catch (e) {
            responseBody = response.data;
            log('catch...');
          }

          return {
            'body': responseBody,
            'headers': response.headers,
            'error_description': null,
          };
        } else {
          if (context != null) processIndicator.hide(context);
          return {
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } on DioError catch (e) {
        if (context != null) processIndicator.hide(context);
        Map<String, dynamic> responseData = {
          'body': e.response?.data,
          'headers': null,
          'error_description': await _handleError(e, context,
              message: e.response?.data['message']),
        };
        if (e.response != null && e.response!.statusCode == 498) {
          dataStorages
              .erase()
              .whenComplete(() => getx.Get.offAll(() => LoginScreen()));
        }
    
        return responseData;
      }
    } else {
      Map<String, dynamic> responseData = {
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      internetError.addOverlayEntry(context);
      return responseData;
      // func(false);
    }
  }

  static Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  //Post Method
  static Future<Map<String, dynamic>> postDioHttpMethod({
    BuildContext? context,
    required String url,
    required data,
    final header,
  }) async {
    var internet = await check();
    if (internet) {
      if (context != null) processIndicator.show(context);
      try {
        log("URL :" + url);
        Response response = await _dio!.post(
          url,
          data: data,
          options: header ?? _cacheOptions,
        );

        if (context != null) processIndicator.hide(context);
        var responseBody;
        if (response.statusCode == 200) {
          try {
            responseBody = json.decode(json.encode(response.data));
          } catch (error) {
            log('decode error');
            responseBody = response.data;
          }
          return {
            'body': responseBody,
            'headers': response.headers,
            'error_description': null,
          };
        } else {
          if (context != null) processIndicator.hide(context);
          return {
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } on DioError catch (e) {
        if (context != null) processIndicator.hide(context);
        Map<String, dynamic> responseData = {
          'body': e.response?.data,
          'headers': null,
          'error_description': await _handleError(e, context,
              message: e.response?.data['message']),
        };
        if (e.response != null && e.response!.statusCode == 498) {
          dataStorages
              .erase()
              .whenComplete(() => getx.Get.offAll(() => LoginScreen()));
        }
      
        return responseData;
      }
    } else {
      Map<String, dynamic> responseData = {
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      internetError.addOverlayEntry(context);
      return responseData;
    }
  }

  //Delete Method
  static Future<Map<String, dynamic>> deleteDioHttpMethod(
      {BuildContext? context, required String url, data}) async {
    var internet = await check();
    if (internet) {
      if (context != null) processIndicator.show(context);
      try {
        Response response = await _dio!.delete(
          url,
          data: data,
          options: _cacheOptions,
        );
        // ignore: prefer_typing_uninitialized_variables
        var responseBody;

        if (response.statusCode == 200) {
          if (context != null) processIndicator.hide(context);
          try {
            responseBody = json.decode(json.encode(response.data));
          } catch (error) {
            log('decode error');
            responseBody = response.data;
          }
          return {
            'body': responseBody,
            'headers': response.headers,
            'error_description': null,
          };
        } else {
          if (context != null) processIndicator.hide(context);
          return {
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } on DioError catch (e) {
        if (context != null) processIndicator.hide(context);
        Map<String, dynamic> responseData = {
          'body': null,
          'headers': null,
          'error_description': await _handleError(e, context,
              message: e.response?.data['message']),
        };
        if (e.response != null && e.response!.statusCode == 498) {
          dataStorages
              .erase()
              .whenComplete(() => getx.Get.offAll(() => LoginScreen()));
        }
     
        return responseData;
      }
    } else {
      Map<String, dynamic> responseData = {
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      internetError.addOverlayEntry(context);
      return responseData;
      // func(false);
    }
  }

  // //Multiple Concurrent
  static Future<Map<String, dynamic>> multipleConcurrentDioHttpMethod(
      {BuildContext? context,
      required String getUrl,
      required String postUrl,
      required Map<String, dynamic> postData}) async {
    try {
      if (context != null) processIndicator.show(context);
      List<Response> response = await Future.wait([
        _dio!.post("$endPointUrl/$postUrl",
            data: postData, options: _cacheOptions),
        _dio!.get("$endPointUrl/$getUrl", options: _cacheOptions)
      ]);
      if (response[0].statusCode == 200 || response[0].statusCode == 200) {
        if (response[0].statusCode == 200 && response[1].statusCode != 200) {
          if (context != null) processIndicator.hide(context);
          return {
            'getBody': null,
            'postBody': json.decode(response[0].data),
            'headers': response[0].headers,
            'error_description': null,
          };
        } else if (response[1].statusCode == 200 &&
            response[0].statusCode != 200) {
          if (context != null) processIndicator.hide(context);
          return {
            'getBody': null,
            'postBody': json.decode(response[0].data),
            'headers': response[0].headers,
            'error_description': null,
          };
        } else {
          if (context != null) processIndicator.hide(context);
          return {
            'postBody': json.decode(response[0].data),
            'getBody': json.decode(response[0].data),
            'headers': response[0].headers,
            'error_description': null,
          };
        }
      } else {
        if (context != null) processIndicator.hide(context);
        return {
          'postBody': null,
          'getBody': null,
          'headers': null,
          'error_description': "Something Went Wrong",
        };
      }
    } catch (e) {
      Map<String, dynamic> responseData = {
        'postBody': null,
        'getBody': null,
        'headers': null,
        'error_description': await _handleError(e, context),
      };
      if (context != null) processIndicator.hide(context);
      return responseData;
    }
  }

  //Sending FormData
  static Future<Map<String, dynamic>> sendingFormDataDioHttpMethod(
      {required BuildContext? context,
      required String url,
      required Map<String, dynamic> data}) async {
    var internet = await check();
    if (internet) {
      try {
        if (context != null) processIndicator.show(context);
        FormData formData = FormData.fromMap(data);
        Response response = await _dio!
            .post("$endPointUrl$url", data: formData, options: _cacheOptions);
        if (response.statusCode == 200) {
          if (context != null) processIndicator.hide(context);
          return {
            'body': json.decode(response.data),
            'headers': response.headers,
            'error_description': null,
          };
        } else {
          if (context != null) processIndicator.hide(context);
          return {
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } catch (e) {
        Map<String, dynamic> responseData = {
          'body': null,
          'headers': null,
          'error_description': await _handleError(e, context),
        };
        if (context != null) processIndicator.hide(context);
        return responseData;
      }
    } else {
      Map<String, dynamic> responseData = {
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      internetError.addOverlayEntry(context);
      return responseData;
    }
  }

  // Handle Error
  static Future<String> _handleError(error, context, {message}) async {
    String errorDescription = "";
    try {
      log("In side try");
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        log("In side internet condition");
        if (error is DioError) {
          // ignore: unnecessary_cast
          DioError dioError = error as DioError;
          switch (dioError.type) {
            case DioErrorType.connectTimeout:
              errorDescription = "Connection timeout with API server";
              log(errorDescription);
              break;
            case DioErrorType.sendTimeout:
              errorDescription = "Send timeout in connection with API server";
              log(errorDescription);
              break;
            case DioErrorType.receiveTimeout:
              errorDescription =
                  "Receive timeout in connection with API server";
              log(errorDescription);
              break;
            case DioErrorType.response:
              errorDescription = message;
              log(errorDescription);
              break;
            case DioErrorType.cancel:
              errorDescription = "Request to API server was cancelled";
              log(errorDescription);
              break;
            case DioErrorType.other:
              errorDescription =
                  "Connection to API server failed due to internet connection";
              log(errorDescription);
              break;
          }
        } else {
          errorDescription = "Unexpected error occured";
          log(errorDescription);
        }
      }
    } on SocketException catch (_) {
      errorDescription = "Please check your internet connection";
      log(errorDescription);
    }
    return errorDescription;
  }
}

class NetworkCheck {
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  dynamic checkInternet(bool func) {
    check().then((intenet) {
      if (intenet) {
        return true;
      } else {
        return false;
      }
    });
  }
}
