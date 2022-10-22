
import 'package:dio/dio.dart';
import 'package:pain_appertment/model/order_model.dart';
import 'package:pain_appertment/utils/servies/storage_service.dart';

import '../../model/choose_service_model.dart';
import '../../model/home_model.dart';
import '../../model/login_model.dart';
import '../../model/show_product_details.dart';
import '../../shared/network/api_helper.dart';
import '../../utils/constant/api_constant.dart';
import '../../utils/constant/constant.dart';
import '../../utils/constant/custom_toast.dart';

class ChooseTechnicalService{
  
  static Future<ChooseServiceModel?> getChooseServiceTechnical() async {
    ChooseServiceModel? chooseServiceModel;
    
    try {
      
      Response response = await APIService.getData(uri: ApiConstants.baseUrl+ApiConstants.choseServiceTechnical,
          token: '73|TlKnNa5iaTVZ8ej6lsFGFj5y2nxNaZy0XdSmoRXT',lang: 'ar');

   //   print(AppLocalStorage.token);
      if(response.statusCode == 200){
        print(response.data);
        return ChooseServiceModel.fromJson(response.data);
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
    return chooseServiceModel;
  }



}