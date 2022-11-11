import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'app_layout_state.dart';

class AppLayoutCubit extends Cubit<AppLayoutState> {
  Timer? timer;
  AppLayoutCubit() : super(AppLayoutInitial()){
   checkUserConnection();
   checkConnectionInternet();
  }

  static AppLayoutCubit get(BuildContext context) => BlocProvider.of(context);
  int selectedIndex = 0;
  onItemTapped(int index) {
    selectedIndex = index;
    emit(OnItemTappedState());
  }

  bool activeConnection = false;
  String T = "";

  checkConnectionInternet(){

    timer = Timer.periodic(const Duration(seconds: 3), (Timer t) => checkUserConnection());
  }
  Future checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        activeConnection = true;
        T = "Turn off the data and repress again";
        //print(T);
        //print(activeConnection);
      //  CustomFlutterToast(T);
        // CustomFlutterToast(ActiveConnection.toString());
         emit(ConnectionSuccess());
      }
    } on SocketException catch (_) {
      activeConnection = true;
      T = "Turn off the data and repress again";
      //print(T);
      //print(activeConnection);
     // CustomFlutterToast(T);
      // CustomFlutterToast(ActiveConnection.toString());
       emit(ConnectionFailure());
    }
  }

}
