
import 'package:dio/dio.dart';

import '../../model/login_model.dart';
import '../../shared/network/api_helper.dart';
import '../../utils/constant/api_constant.dart';
import '../../utils/constant/custom_toast.dart';

class AuthService{
  
  static Future<LoginModel?> setLogin(String phone,String password,String fcmToken) async {
    LoginModel? loginModel;

    try {
      
      Response response = await APIService.postData(uri: ApiConstants.login,data: {
        "phone" : phone,
        "password" : password,
        "fcm_token" : fcmToken,
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



}