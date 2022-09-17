import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pain_appertment/model/order_model.dart';
import 'package:pain_appertment/webservices/api_services/orders_service.dart';

part 'current_orders_state.dart';

class CurrentOrdersCubit extends Cubit<CurrentOrdersState> {
  CurrentOrdersCubit() : super(OrdersInitial()){
    getCurrentOrderUser();
  }

 static CurrentOrdersCubit get(BuildContext context) => BlocProvider.of(context);

  getCurrentOrderUser(){
    emit(CurrentOrdersLoadingState());
    OrdersService.getCurrentOrderUser().then((value){
      if(value?.success == true){
        emit(CurrentOrdersSuccessfullyState(value?.data));
      }else {
        emit(CurrentOrdersErrorState(value?.message));
      }
    });
  }


}
