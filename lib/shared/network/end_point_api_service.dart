
class EndPointApiService {

  //auth service
  static const  String login = '/login';
  static const String register = '/step1/register';
  static const String logout = "/logout";
  static const String activeCode = "/activcode";
  static const String changePasswordForgetPassword = "/rechangepass";
  static const String profile = "/profile";
  static const String updateProfile = "/updateprofile";
  static const String changePassword = "/changepassword";

  //user service
  static const String home = "/home";
  static const String showService = "/service";
  static const String setting = "/setting";
  static const String addRate = "/rates/add";
  static const String addOrder = "/order/add";
  static const String orders = "/orders";
  static const String currentOrders = "/currentorders";
  static const String previousOrders = "/previousorders";
  static const String acceptOrder = "/order/accept";
  static const String receivedOrder = "/order/received";

  //technical service
  static String newOrderTechnicalPath = '';
  static String currentOrderTechnicalPath = '';
  static String previousOrderTechnicalPath = '';
  static String profileTechnicalPath = '';
  static String updateProfileTechnicalPath = '';
  static String enterServiceMoneyFromTechnical = '';

  // services
  static String aboutUsPath = '';
  static String privacyPath = '';
  static String termsAndConditionalPath = '';

}