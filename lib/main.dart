import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/business_logic/user_controller/auth_cubit/auth_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/home_cubit/home_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/home_main_cubit/home_main_cubit.dart';
import 'package:pain_appertment/screens/UserScreens/splash_screen/splash_screen.dart';
import 'package:pain_appertment/shared/logger_helper.dart';
import 'package:pain_appertment/shared/network/api_helper.dart';
import 'package:pain_appertment/utils/constant/constant.dart';
import 'package:pain_appertment/utils/localization/translation.dart';
import 'package:pain_appertment/utils/servies/services.dart';
import 'package:pain_appertment/utils/servies/storage_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await initialServicesUser();
  APIService.init();
  LoggerHelper.init();
  await SharedPreferences.getInstance();

  AppConstants.tokenSession = Get.find<StorageService>().GetToken != null ? AppConstants.tokenSession = Get.find<StorageService>().GetToken : '';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      BlocProvider(
        create: (context) => HomeMainCubit(),
      ),
      BlocProvider(
        create: (context) => AuthCubit(),
      ),
      BlocProvider(
        create: (context) => HomeCubit(),
      ),
    ],
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: const Locale('ar'),
      home: const SplashScreen(),
    ),);
  }
}
