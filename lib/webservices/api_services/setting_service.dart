
import 'package:dio/dio.dart';

import '../../model/login_model.dart';
import '../../shared/network/api_helper.dart';
import '../../utils/constant/api_constant.dart';
import '../../utils/constant/custom_toast.dart';

class SettingService{
  
  static Future<LoginModel?> getGovernment() async {
    LoginModel? governmentModel;
    
    try {
      
      Response response = await APIService.getData(uri: ApiConstants.login,token: ApiConstants.login);

   //   print(AppLocalStorage.token);
      if(response.statusCode == 200){
        print(response.data);
        return LoginModel.fromJson(response.data);
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
    return governmentModel;
  }



}