import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pain_appertment/model/order_model.dart';
import 'package:pain_appertment/webservices/api_services/notification_service.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial()){
    getNotification();
  }

 static NotificationCubit get (BuildContext context) => BlocProvider.of(context);


 getNotification(){
   emit(NotificationLoadingState());
   NotificationService.getNotification().then((value){
     if(value?.success == true){
       emit(NotificationSuccessfullyState(value?.data));
     }else {
       emit(NotificationErrorState(value?.message));
     }
   });
 }
}
