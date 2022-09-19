
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pain_appertment/utils/constant/Themes.dart';


class ApiConstants {
  // Api Endpoints
  static const String baseUrl = 'https://alsarrh.nebny.net/api/v2';

  static const  String login = '/login';
  static const String register = '/register';
  static const String logout = "/logout";
  static const String activeCode = "/activcode";
  static const String changePasswordForgetPassword = "/rechangepass";
  static const String profile = "/profile";
  static const String updateProfile = "/updateprofile";
  static const String changePassword = "/changepassword";
  static const String home = "/home";
  static const String showService = "/service/";
  static const String setting = "/setting";
  static const String addRate = "/rates/add";
  static const String addOrder = "/order/add";
  static const String orders = "/orders";
  static const String currentOrders = "/currentorders";
  static const String previousOrders = "/previousorders";
  static const String acceptOrder = "/order/accept";
  static const String receivedOrder = "/order/received";


  /// technical service api

  static const String newTechnicalOrders = "/technical/orders";
  static const String currentTechnicalOrders = "/technical/currentorders";
  static const String previousTechnicalOrders = "/technical/previousorders";
  static const String receivedTechnicalOrder = "/technical/order/add_price_offer";

}


