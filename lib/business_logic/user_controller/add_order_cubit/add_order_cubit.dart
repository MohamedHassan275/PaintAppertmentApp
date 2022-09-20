import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pain_appertment/webservices/api_services/add_order_service.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit() : super(AddOrderInitial());

 static AddOrderCubit get(BuildContext context) => BlocProvider.of(context);

 addOrderUser(String serviceId,String flatArea,String rooms,
     String bathrooms,String firstName,String lastName,String phone,String governorate,String city,String description){
  emit(AddOrderLoadingState());
   AddOrderService.addOrderUser(serviceId, flatArea, rooms, bathrooms, firstName, lastName, phone, governorate, city,description).then((value){
     if(value?.success == true){
       emit(AddOrderSuccessfullyState(value?.message));
     }else {
       emit(AddOrderErrorState(value?.message));
     }
   });
 }
}
