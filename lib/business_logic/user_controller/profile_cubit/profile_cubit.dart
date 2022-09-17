import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pain_appertment/model/response_user_model.dart';
import 'package:pain_appertment/utils/constant/custom_toast.dart';
import 'package:pain_appertment/webservices/api_services/profile_service.dart';

import '../../../model/profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()){
    showUserDetails();
  }

 static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  showUserDetails(){
    emit(ProfileLoadingState());
    ProfileService.showUserDetails().then((value){
      if(value?.success == true){
      //  CustomFlutterToast(value?.data?.lastname);
        emit(ProfileSuccessState(value?.data));
      }else {
        emit(ProfileErrorState(value?.message));
      }
    });
  }

  updateProfileUser(String firstName,String lastName,String phone,String email,String governorate,String city){
    emit(UpdateProfileLoadingState());
    ProfileService.changeProfileUser(firstName, lastName, phone, email,governorate,city).then((value){
      if(value?.success == true){
        CustomFlutterToast(value?.message);
        emit(UpdateProfileSuccessState(value?.message));
      }else {
        emit(ProfileErrorState(value?.message));
      }
    });
  }
}
