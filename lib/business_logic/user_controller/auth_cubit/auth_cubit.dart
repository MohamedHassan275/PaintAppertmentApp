import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pain_appertment/model/login_model.dart';
import 'package:pain_appertment/utils/constant/custom_toast.dart';
import 'package:pain_appertment/webservices/api_services/auth_service.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  setLoginUser(String phone,String password,String fcmToken){
    emit(LoginLoadingState());
    AuthService.setLogin(phone, password, fcmToken).then((value){
      if(value?.success == true){
        emit(LoginSuccessState(value?.data));
        CustomFlutterToast(value?.message);
        CustomFlutterToast(value?.data?.accesstoken);
      }else {
        emit(ErrorLoginState(value?.message));
      }
    });
  }
}
