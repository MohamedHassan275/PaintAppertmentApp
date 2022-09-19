import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pain_appertment/model/order_model.dart';
import 'package:pain_appertment/webservices/api_services/orders_service.dart';

import '../../../webservices/api_services/orders_technical_service.dart';

part 'current_technical_orders_state.dart';

class CurrentTechnicalOrdersCubit extends Cubit<CurrentOrdersTechnicalState> {
  CurrentTechnicalOrdersCubit() : super(OrdersTechnicalInitial()){
    getCurrentTechnicalOrderUser();
  }

 static CurrentTechnicalOrdersCubit get(BuildContext context) => BlocProvider.of(context);

  getCurrentTechnicalOrderUser(){
    emit(CurrentOrdersLoadingState());
    OrdersTechnicalService.getCurrentTechnicalSOrderUser().then((value){
      if(value?.success == true){
        emit(CurrentOrdersSuccessfullyState(value?.data));
      }else {
        emit(CurrentOrdersErrorState(value?.message));
      }
    });
  }


}
