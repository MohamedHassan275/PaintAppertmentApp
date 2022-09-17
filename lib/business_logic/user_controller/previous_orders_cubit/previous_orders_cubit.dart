import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pain_appertment/model/order_model.dart';
import 'package:pain_appertment/webservices/api_services/orders_service.dart';

part 'previous_orders_state.dart';

class PreviousOrdersCubit extends Cubit<PreviousOrdersState> {
  PreviousOrdersCubit() : super(PreviousOrdersInitial()){
    getPreviousOrderUser();
  }

 static PreviousOrdersCubit get(BuildContext context) => BlocProvider.of(context);


  getPreviousOrderUser(){
    emit(PreviousOrdersLoadingState());
    OrdersService.getPreviousOrderUser().then((value){
      if(value?.success == true){
        emit(PreviousOrdersSuccessfullyState(value?.data));
      }else {
        emit(PreviousOrdersErrorState(value?.message));
      }
    });
  }

}
