import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localization/localization_service.dart';


abstract class StorageKeys {
  StorageKeys();

  //Declare all storage keys here & create its correpsonding setters & getters
  static const String token = "TOKEN";
  static const String type = "TYPE";
  static const String activeLocale = "ACTIVE_LOCAL";

}

class StorageService extends GetxService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  //TOKEN
   get getToken {
    return _prefs.getString(StorageKeys.token) ?? "";
  }

   setToken(String token) {
    _prefs.setString(StorageKeys.token, token);
  }
  get getType {
    return _prefs.getString(StorageKeys.type) ?? "";
  }

   setType(String token) {
    _prefs.setString(StorageKeys.type, token);
  }

  Locale get activeLocale {
    return Locale(_prefs.getString(StorageKeys.activeLocale) ??
        SupportedLocales.arabic.toString());
  }

  set activeLocale(Locale activeLocal) {
    _prefs.setString(StorageKeys.activeLocale, activeLocal.toString());
  }

  clear() => _prefs.clear();
}

initialServicesUser () async{
  await Get.putAsync(() => StorageService().init());
}

