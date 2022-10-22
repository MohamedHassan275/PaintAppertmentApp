import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pain_appertment/webservices/api_services/add_rate_service.dart';

part 'add_rate_state.dart';

class AddRateCubit extends Cubit<AddRateState> {
  AddRateCubit() : super(AddRateInitial());

  static AddRateCubit get (BuildContext context) => BlocProvider.of(context);


  addRateToTechnicalFromUser(String serviceId,String orderId,double rate,String comment){
    emit(AddRateLoadingState());
    AddRateService.addRateToTechnical(serviceId, orderId, rate, comment).then((value){
      if(value?.success == true){
        emit(AddRateSuccessState(value?.message));
      }else {
        emit(AddRateErrorState(value?.message));
      }
    });
  }
}
