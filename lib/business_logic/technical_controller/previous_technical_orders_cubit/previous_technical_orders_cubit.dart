import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pain_appertment/model/order_model.dart';
import 'package:pain_appertment/webservices/api_services/orders_service.dart';
import 'package:pain_appertment/webservices/api_services/orders_technical_service.dart';

part 'previous_technical_orders_state.dart';

class PreviousOrdersTechnicalCubit extends Cubit<PreviousOrdersTechnicalState> {
  PreviousOrdersTechnicalCubit() : super(PreviousOrdersTechnicalInitial()){
    getPreviousTechnicalOrderUser();
  }

 static PreviousOrdersTechnicalCubit get(BuildContext context) => BlocProvider.of(context);


  getPreviousTechnicalOrderUser(){
    emit(PreviousOrdersLoadingState());
    OrdersTechnicalService.getPreviousTechnicalSOrderUser().then((value){
      if(value?.success == true){
        emit(PreviousOrdersSuccessfullyState(value?.data));
      }else {
        emit(PreviousOrdersErrorState(value?.message));
      }
    });
  }

}
