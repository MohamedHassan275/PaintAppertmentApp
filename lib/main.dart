import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/business_logic/technical_controller/add_price_order/add_price_order_cubit.dart';
import 'package:pain_appertment/business_logic/technical_controller/current_technical_orders_cubit/current_technical_orders_cubit.dart';
import 'package:pain_appertment/business_logic/technical_controller/orders_technical_cubit/orders_technical_cubit.dart';
import 'package:pain_appertment/business_logic/technical_controller/previous_technical_orders_cubit/previous_technical_orders_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/add_order_cubit/add_order_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/auth_cubit/auth_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/home_cubit/home_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/home_main_cubit/home_main_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/orders_cubit/orders_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/previous_orders_cubit/previous_orders_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/profile_cubit/profile_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/setting_cubit/setting_cubit.dart';
import 'package:pain_appertment/screens/UserScreens/splash_screen/splash_screen.dart';
import 'package:pain_appertment/shared/logger_helper.dart';
import 'package:pain_appertment/shared/network/api_helper.dart';
import 'package:pain_appertment/utils/constant/constant.dart';
import 'package:pain_appertment/utils/localization/translation.dart';
import 'package:pain_appertment/utils/servies/services.dart';
import 'package:pain_appertment/utils/servies/storage_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'business_logic/technical_controller/home_main_technical_cubit/home_main_technical_cubit.dart';
import 'business_logic/user_controller/current_orders_cubit/current_orders_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await initialServicesUser();
  APIService.init();
  LoggerHelper.init();
  await SharedPreferences.getInstance();

  print('typeSession ${Get.find<StorageService>().getType}');
  print('typeSession ${Get.find<StorageService>().getToken}');
  print('typeSession ${AppConstants.tokenSession}');
  print('typeSession ${Get.find<StorageService>().getToken}');

   AppConstants.tokenSession = Get.find<StorageService>().getToken != null ? AppConstants.tokenSession = Get.find<StorageService>().getToken : '';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      BlocProvider(
        create: (context) => AddPriceOrderCubit(),
      ),
      BlocProvider(
        create: (context) => OrdersTechnicalCubit(),
      ),
      BlocProvider(
        create: (context) => CurrentTechnicalOrdersCubit(),
      ),
      BlocProvider(
        create: (context) => PreviousOrdersTechnicalCubit(),
      ),
      BlocProvider(
        create: (context) => HomeMainTechnicalCubit(),
      ),
      BlocProvider(
        create: (context) => AddOrderCubit(),
      ),
      BlocProvider(
        create: (context) => AddOrderCubit(),
      ),
      BlocProvider(
        create: (context) => CurrentOrdersCubit(),
      ),
      BlocProvider(
        create: (context) => PreviousOrdersCubit(),
      ),
      BlocProvider(
        create: (context) => OrdersCubit(),
      ),
      BlocProvider(
        create: (context) => SettingCubit(),
      ),
      BlocProvider(
        create: (context) => HomeMainCubit(),
      ),
      BlocProvider(
        create: (context) => ProfileCubit(),
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
