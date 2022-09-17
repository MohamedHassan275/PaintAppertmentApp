
import 'package:dio/dio.dart';
import 'package:pain_appertment/model/profile_model.dart';
import 'package:pain_appertment/model/response_user_model.dart';
import 'package:pain_appertment/utils/constant/constant.dart';

import '../../model/login_model.dart';
import '../../shared/network/api_helper.dart';
import '../../utils/constant/api_constant.dart';
import '../../utils/constant/custom_toast.dart';

class ProfileService{
  
  static Future<ProfileModel?> showUserDetails() async {
    ProfileModel? profileModel;
    
    try {
      
      Response response = await APIService.getData(uri: ApiConstants.baseUrl+ApiConstants.profile,token: AppConstants.tokenSession);

   //   print(AppLocalStorage.token);
      if(response.statusCode == 200){
        print(response.data);
        return ProfileModel.fromJson(response.data);
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
    return profileModel;
  }


  static Future<ResponseUserModel?> changeProfileUser(String firstName,String lastName,String phone,String email) async {
    ResponseUserModel? responseUserModel;

    try {

      Response response = await APIService.postData(uri: ApiConstants.baseUrl+ApiConstants.updateProfile,token: AppConstants.tokenSession,
      data: {
        "firstname": firstName,
        "lastname": lastName,
        "phone": phone,
        "email": email,
      });

      //   print(AppLocalStorage.token);
      if(response.statusCode == 200){
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