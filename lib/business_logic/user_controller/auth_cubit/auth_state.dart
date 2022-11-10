part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  LoginModel? loginModel;
  LoginSuccessState(this.loginModel);

}
class ErrorLoginState extends AuthState {
  String? error;
  ErrorLoginState(this.error);
}

class RegisterLoadingState extends AuthState {}


class RegisterSuccessState extends AuthState {
  LoginModel? loginModel;
  RegisterSuccessState(this.loginModel);

}
class RegisterErrorState extends AuthState {
  String? error;
  RegisterErrorState(this.error);
}


class LoginoutSuccessState extends AuthState {
  String? changeProfileSuccessfully;
  LoginoutSuccessState(this.changeProfileSuccessfully);

}

class TechnicalRegisterLoadingState extends AuthState {}

class TechnicalRegisterSuccessState extends AuthState {
  LoginModel? loginModel;
  TechnicalRegisterSuccessState(this.loginModel);

}
class TechnicalRegisterErrorLoginState extends AuthState {
  String? error;
  TechnicalRegisterErrorLoginState(this.error);
}


