import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pain_appertment/model/order_model.dart';
import 'package:pain_appertment/webservices/api_services/orders_service.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial()){
    getSenderOrderUser();
  }

 static OrdersCubit get(BuildContext context) => BlocProvider.of(context);

  getSenderOrderUser(){
    emit(OrdersLoadingState());
    OrdersService.getSenderOrderUser().then((value){
      if(value?.success == true){
        emit(OrdersSuccessfullyState(value?.data));
      }else {
        emit(OrdersErrorState(value?.message));
      }
    });
  }




  getPreviousOrderUser(){
    emit(OrdersLoadingState());
    OrdersService.getPreviousOrderUser().then((value){
      if(value?.success == true){
        emit(OrdersSuccessfullyState(value?.data));
      }else {
        emit(OrdersErrorState(value?.message));
      }
    });
  }

}
