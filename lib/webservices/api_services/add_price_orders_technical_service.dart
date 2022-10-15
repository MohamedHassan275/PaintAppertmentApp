
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pain_appertment/model/order_model.dart';
import 'package:pain_appertment/model/response_user_model.dart';
import 'package:pain_appertment/utils/constant/constant.dart';

import '../../model/login_model.dart';
import '../../shared/network/api_helper.dart';
import '../../utils/constant/api_constant.dart';
import '../../utils/constant/custom_toast.dart';

class AddPriceOrdersTechnicalService{
  
  static Future<ResponseUserModel?> addPriceOfferOrderTechnicalService(BuildContext context,String orderId,String price) async {
    ResponseUserModel? responseUserModel;

    try {
      Response response = await APIService.postData(uri: ApiConstants.baseUrl+ApiConstants.receivedTechnicalOrder,
          token: AppConstants.tokenSession,data: {
            'order_id' :orderId,
            'price' :price,
          },
          lang: 'ar');
      if(response.statusCode == 200){
        print('response data');
        print(response.data);
        return ResponseUserModel.fromJson(response.data);
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
    return responseUserModel;
  }

}