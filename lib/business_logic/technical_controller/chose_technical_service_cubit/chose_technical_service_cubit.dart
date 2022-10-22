import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pain_appertment/model/choose_service_model.dart';

import '../../../webservices/api_services/chose_technical_service_service.dart';

part 'chose_technical_service_state.dart';

class ChoseTechnicalServiceCubit extends Cubit<ChoseTechnicalServiceState> {
  ChoseTechnicalServiceCubit() : super(ChoseTechnicalServiceInitial()){
    getChoseServiceTechnical();
  }

 static ChoseTechnicalServiceCubit get (BuildContext context) => BlocProvider.of(context);

 getChoseServiceTechnical(){
   emit(ChoseTechnicalServiceLoadingState());
   ChooseTechnicalService.getChooseServiceTechnical().then((value){
     if(value?.success == true){
       emit(ChoseTechnicalServiceSuccessfullyState(value?.data));
     }else {
       emit(ChoseTechnicalServiceErrorState(value?.message));
     }
   });
 }
}
