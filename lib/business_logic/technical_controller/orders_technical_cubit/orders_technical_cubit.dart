import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pain_appertment/model/order_model.dart';
import 'package:pain_appertment/webservices/api_services/orders_service.dart';
import 'package:pain_appertment/webservices/api_services/orders_technical_service.dart';

part 'orders_technical_state.dart';

class OrdersTechnicalCubit extends Cubit<OrdersTechnicalState> {
  OrdersTechnicalCubit() : super(OrdersTechnicalInitial()){
  //  getNewTechnicalOrderUser();
  }

 static OrdersTechnicalCubit get(BuildContext context) => BlocProvider.of(context);

  getNewTechnicalOrderUser(){
    emit(OrdersLoadingState());
    OrdersTechnicalService.getNewTechnicalSOrderUser().then((value){
      if(value?.success == true){
        emit(OrdersSuccessfullyState(value?.data));
      }else {
        emit(OrdersErrorState(value?.message));
      }
    });
  }




}
