
import 'package:dio/dio.dart';
import 'package:pain_appertment/model/MyWaitingOrderModel.dart';
import 'package:pain_appertment/utils/constant/api_constant.dart';

import '../../utils/constant/constant.dart';
import '../logger_helper.dart';
import 'app_exception.dart';

class APIService {

  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
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

  void _exceptionCaught(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
        throw DioException('Connection Timeout');
      case DioErrorType.receiveTimeout:
        throw DioException('Connection Timeout');
      case DioErrorType.response:
        throw DioException('${e.response}');
      case DioErrorType.cancel:
        throw DioException('request cancelled');
      case DioErrorType.other:
        throw DioException('No Internet connection');
      default:
        throw Exception('internal error dio');
    }
  }


}