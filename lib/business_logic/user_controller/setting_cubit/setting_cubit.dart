import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pain_appertment/webservices/api_services/setting_service.dart';

import '../../../model/setting_model.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial()){
   showUserDetails();
  }

 static SettingCubit get(BuildContext context) => BlocProvider.of(context);

  showUserDetails(){
    emit(SettingLoadingState());
    SettingService.showSettingUser().then((value){
      if(value?.success == true){
        //  CustomFlutterToast(value?.data?.lastname);
        emit(SettingSuccessfullyState(value?.settingResponseModel));
      }else {
        emit(SettingErrorState(value?.message));
      }
    });
  }

}
