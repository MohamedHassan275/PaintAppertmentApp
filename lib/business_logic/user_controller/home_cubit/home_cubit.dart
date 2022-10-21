import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pain_appertment/model/home_model.dart';
import 'package:pain_appertment/model/show_product_details.dart';
import 'package:pain_appertment/webservices/api_services/home_service.dart';

import '../../../utils/constant/custom_toast.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()){
    getHomeUser();
  }

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  getHomeUser(){
    emit(HomeLoadingState());
    HomeService.getHomeUser().then((value){
      if(value?.success == true){
        emit(HomeSuccessState(value?.data));
      }else {
        emit(HomeErrorState(value?.message));
      }
    });
  }

  showProductDetails(BuildContext context,String productId){
    emit(ShowDetailsLoadingState());
    HomeService.showProductDetails(context,productId).then((value){
      if(value?.success == true){
        emit(ShowDetailsSuccessState(value?.data));
      //  CustomFlutterToast(value?.data?.name);
      }else {
        emit(ShowDetailsErrorState(value?.message));
      }
    });
  }

}
