
import 'package:dio/dio.dart';
import 'package:pain_appertment/model/MyWaitingOrderModel.dart';

import '../../utils/constant/constant.dart';
import '../logger_helper.dart';

class APIService {

  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        //to skip exception and continue in code
        validateStatus: (int? status) => true,
      ),
    );
  }

  static Future<Response> getData(
      {required String uri,
        String lang = 'ar',
        String? token,
        Map<String, dynamic>? query}) async {
    LoggerHelper.loggerNoStack.i('Api Call : ' + uri);
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token!,
      'Accept': 'application/json',
    };
    return await dio.get(uri, queryParameters: query);
  }

  static Future<Response> postData(
      {required String uri,
        Map<String, dynamic>? data,
        String lang = 'ar',
        String? token = '',
        Map<String, dynamic>? query}) async {
    LoggerHelper.loggerNoStack.i('Api Call : ' + uri);
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token!,
    };
    return dio.post(uri, data: data, queryParameters: query);
  }

  static Future<Response> putData(
      {required String uri,
        Map<String, dynamic>? data,
        String lang = 'ar',
        Map<String, dynamic>? query}) async {
    LoggerHelper.loggerNoStack.i('Api Call :' + uri);
    dio.options.headers ={
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return dio.put(uri, data: data, queryParameters: query);
  }
}