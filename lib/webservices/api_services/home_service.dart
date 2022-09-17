
import 'package:dio/dio.dart';
import 'package:pain_appertment/utils/servies/storage_service.dart';

import '../../model/home_model.dart';
import '../../model/login_model.dart';
import '../../model/show_product_details.dart';
import '../../shared/network/api_helper.dart';
import '../../utils/constant/api_constant.dart';
import '../../utils/constant/constant.dart';
import '../../utils/constant/custom_toast.dart';

class HomeService{
  
  static Future<HomeModel?> getHomeUser() async {
    HomeModel? homeModel;
    
    try {
      
      Response response = await APIService.getData(uri: ApiConstants.baseUrl+ApiConstants.home,token: AppConstants.tokenSession,lang: 'ar');

   //   print(AppLocalStorage.token);
      if(response.statusCode == 200){
        print(response.data);
        return HomeModel.fromJson(response.data);
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
    return homeModel;
  }

static Future<ShowProductDetails?> showProductDetails(String productId) async {
  ShowProductDetails? showProductDetails;

    try {

      Response response = await APIService.getData(uri: ApiConstants.baseUrl+ApiConstants.showService+productId,token: AppConstants.tokenSession,lang: 'ar');

   //   print(AppLocalStorage.token);
      if(response.statusCode == 200){
        print(response.data);
        return ShowProductDetails.fromJson(response.data);
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
    return showProductDetails;
  }



}