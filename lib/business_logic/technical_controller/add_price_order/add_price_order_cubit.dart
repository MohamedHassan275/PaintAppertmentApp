import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pain_appertment/model/response_user_model.dart';
import 'package:pain_appertment/utils/constant/custom_toast.dart';
import 'package:pain_appertment/webservices/api_services/add_price_orders_technical_service.dart';

part 'add_price_order_state.dart';

class AddPriceOrderCubit extends Cubit<AddPriceOrderState> {
  AddPriceOrderCubit() : super(AddPriceOrderInitial());

 static AddPriceOrderCubit get(BuildContext context) => BlocProvider.of(context);

 static GlobalKey<FormState> _formKey = GlobalKey();

 get fromKey => _formKey;

 addPriceOfferOrderTechnical(String orderId,String price){
   emit(AddPriceOrderLoadingState());
   print('response is loading');
   AddPriceOrdersTechnicalService.addPriceOfferOrderTechnicalService(orderId, price).then((value){
     if(value?.success == true){
       print('response is $value');
       CustomFlutterToast(value?.message);
       emit(AddPriceOrderSuccessfullyState(value?.message));
     }else {
       print('response is ${value?.message}');
       emit(AddPriceOrderErrorState(value?.message));
     }
   });
 }
}
