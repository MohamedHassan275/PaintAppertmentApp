
import 'package:dio/dio.dart';
import 'package:pain_appertment/model/order_model.dart';
import 'package:pain_appertment/utils/constant/constant.dart';

import '../../model/login_model.dart';
import '../../shared/network/api_helper.dart';
import '../../utils/constant/api_constant.dart';
import '../../utils/constant/custom_toast.dart';

class OrdersService{
  
  static Future<OrderModel?> getSenderOrderUser() async {
    OrderModel? orderModel;
    try {
      Response response = await APIService.getData(uri: ApiConstants.baseUrl+ApiConstants.orders,token: AppConstants.tokenSession,lang: 'ar');
      if(response.statusCode == 200){
        print(response.data);
        return OrderModel.fromJson(response.data);
      }else if(response.statusCode == 404){
        CustomFlutterToast(response.data['data']);
      }
    }on DioError catch (e){
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return orderModel;
  }

  static Future<OrderModel?> getCurrentOrderUser() async {
    OrderModel? orderModel;
    try {
      Response response = await APIService.getData(uri: ApiConstants.baseUrl+ApiConstants.currentOrders,token: AppConstants.tokenSession,lang: 'ar');
      if(response.statusCode == 200){
        print(response.data);
        return OrderModel.fromJson(response.data);
      }else if(response.statusCode == 404){
        CustomFlutterToast(response.data['data']);
      }
    }on DioError catch (e){
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return orderModel;
  }

  static Future<OrderModel?> getPreviousOrderUser() async {
    OrderModel? orderModel;
    try {
      Response response = await APIService.getData(uri: ApiConstants.baseUrl+ApiConstants.previousOrders,token: AppConstants.tokenSession,lang: 'ar');
      if(response.statusCode == 200){
        print(response.data);
        return OrderModel.fromJson(response.data);
      }else if(response.statusCode == 404){
        CustomFlutterToast(response.data['data']);
      }
    }on DioError catch (e){
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return orderModel;
  }



}