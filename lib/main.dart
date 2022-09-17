import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/UserScreens/splash_screen/splash_screen.dart';
import 'package:pain_appertment/utils/localization/translation.dart';
import 'package:pain_appertment/utils/servies/services.dart';
import 'package:pain_appertment/utils/servies/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await initialServicesUser();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: const Locale('ar'),
      home: const SplashScreen(),
    );
  }
}
