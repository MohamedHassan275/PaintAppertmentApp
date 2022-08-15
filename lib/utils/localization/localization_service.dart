import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../servies/storage_service.dart';

class SupportedLocales {
  static List<Locale> all = [const Locale("en"), const Locale("ar")];

  static Locale english = const Locale("en");
  static Locale arabic = const Locale("ar");

}

class LocalizationService extends GetxService {

  final Locale _activeLocale;
  LocalizationService(this._activeLocale);

  Locale get activeLocale => _activeLocale;

  static LocalizationService init() {
    //Get active local from storage
    Locale activeLocale = Get.find<StorageService>().activeLocale;
    return LocalizationService(activeLocale);
  }

  void toggleLocale(String codeCountry) {
    Locale newLocale;

    if(codeCountry == 'ar'){
      newLocale = const Locale("ar");
      Get.find<StorageService>().activeLocale = newLocale;
      Get.updateLocale(newLocale);
    }else if(codeCountry == 'en'){
      newLocale = const Locale("en");
      Get.find<StorageService>().activeLocale = newLocale;
      Get.updateLocale(newLocale);
    }else {
      newLocale = Locale(Get.deviceLocale!.languageCode);
      Get.find<StorageService>().activeLocale = newLocale;
      Get.updateLocale(newLocale);
    }



    // newLocale = _activeLocale == SupportedLocales.arabic
    //     ? SupportedLocales.english
    //     : SupportedLocales.arabic;
    //
    // //in storage
    // Get.find<StorageService>().activeLocale = newLocale;
    //
    //  newLocale = _activeLocale == SupportedLocales.english
    //     ? SupportedLocales.arabic
    //     : SupportedLocales.english;
    //
    // //in storage
    // Get.find<StorageService>().activeLocale = newLocale;
    //
    // //in Getx
    // Get.updateLocale(newLocale);

  }
}
