
import 'package:dio/dio.dart';
import 'package:pain_appertment/model/response_user_model.dart';
import 'package:pain_appertment/utils/constant/constant.dart';

import '../../model/login_model.dart';
import '../../shared/network/api_helper.dart';
import '../../utils/constant/api_constant.dart';
import '../../utils/constant/custom_toast.dart';

class AuthService{

  static Future<LoginModel?> setLogin(String phone,String password,String fcmToken) async {
    LoginModel? loginModel;

    try {
      print('response is ');
      print('${phone}');
      print('${password}');

      Response response = await APIService.postData(uri: ApiConstants.baseUrl+ApiConstants.login,data: {
        "phone" : phone,
        "password" : password,
        "fcm_token" : fcmToken,
      });

      print('response is ');
      print('${response.statusCode}');
      print('${response.data}');
      if(response.statusCode == 200){
        print(response.data);
        return LoginModel.fromJson(response.data);
      }else if(response.statusCode == 404){
        CustomFlutterToast(response.data['data']);
        CustomFlutterToast(response.data['message']);
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
    return loginModel;
  }


  static Future<LoginModel?> setRegister(String firstName,String lastName,String phone,String email,String governorate,String city,
      String password,String fcmToken,String type) async {
    LoginModel? loginModel;

    try {

      Response response = await APIService.postData(uri: ApiConstants.baseUrl+ApiConstants.register,data: {
        "firstname" : firstName,
        "lastname" : lastName,
        "phone" : phone,
        "governorate" : governorate,
        "city" : city,
        "email" : email,
        "password" : password,
        "fcm_token" : fcmToken,
        "type" : type,
      });

      //   print(AppLocalStorage.token);
      if(response.statusCode == 200){
        print(response.data);
        return LoginModel.fromJson(response.data);
      }else if(response.statusCode == 404){
        CustomFlutterToast(response.data['data']);
        CustomFlutterToast(response.data['message']);
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
    return loginModel;
  }


  static Future<ResponseUserModel?> logout() async {
    ResponseUserModel? responseUserModel;

    try {

      Response response = await APIService.getData(uri: ApiConstants.baseUrl+ApiConstants.logout,token: AppConstants.tokenSession);

      //   print(AppLocalStorage.token);
      if(response.statusCode == 200){
        print(response.data);
        return ResponseUserModel.fromJson(response.data);
      }else if(response.statusCode == 404){
        CustomFlutterToast(response.data['data']);
        CustomFlutterToast(response.data['message']);
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