import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pain_appertment/model/login_model.dart';
import 'package:pain_appertment/model/response_user_model.dart';
import 'package:pain_appertment/screens/UserScreens/login_screen/login_screen.dart';
import 'package:pain_appertment/utils/constant/custom_toast.dart';
import 'package:pain_appertment/webservices/api_services/auth_service.dart';

import '../../../utils/constant/constant.dart';
import '../../../utils/servies/storage_service.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  LoginModel? loginModel;
  bool loading = false;
  setLoginUser(String phone,String password,String fcmToken){
    loading = true;
    emit(LoginLoadingState());
    AuthService.setLogin(phone, password, fcmToken).then((value){
      if(value?.success == true){
        loading = false;
        loginModel = value;
        emit(LoginSuccessState(value));
        // CustomFlutterToast(value?.message);
        // CustomFlutterToast(value?.data?.accesstoken);
      }else {
        loading = false;
        emit(ErrorLoginState(value?.message));
      }
    });
  }


  setRegisterUser(BuildContext context,String firstName,String lastName,String phone,String email,String service, String governorate,String city,
      String password,String fcmToken,String type){
    emit(LoginLoadingState());
    print('request register');
    print(firstName);
    print(lastName);
    print(phone);
    print(email);
    print(password);
    print(fcmToken);
    print(type);
    loading = true;
    AuthService.setRegister(firstName, lastName, phone, email,governorate,city, service,password, fcmToken,type).then((value){
      if(value?.success == true){
        loading = false;
        loginModel = value;
        emit(LoginSuccessState(value));
      }else {
        loading = false;
        emit(ErrorLoginState(value?.message));
      }
    });
  }

  setRegisterTechnical(BuildContext context,String firstName,String lastName,String phone,String email,String service, String governorate,String city,
      String password,String fcmToken,String type){
    emit(LoginLoadingState());
    print('request register');
    print(firstName);
    print(lastName);
    print(phone);
    print(email);
    print(password);
    print(fcmToken);
    print(type);
    loading = true;
    AuthService.setRegister(firstName, lastName, phone, email, service, governorate,city, password, fcmToken,type).then((value){
      if(value?.success == true){
        loading = false;
        loginModel = value;
        emit(TechnicalRegisterSuccessState(value));
      }else {
        loading = false;
        emit(TechnicalRegisterErrorLoginState(value?.message));
      }
    });
  }


  setLogout(BuildContext context){
    emit(LoginLoadingState());
    AuthService.logout().then((value){
      if(value?.success == true){
        emit(LoginoutSuccessState(value?.message));
        CustomFlutterToast(value?.message);
        Get.find<StorageService>().clear();
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
      }else {
        emit(ErrorLoginState(value?.message));
      }
    });
  }

}
