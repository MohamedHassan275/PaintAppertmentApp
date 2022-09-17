part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  LoginResponseModel? loginResponseModel;
  LoginSuccessState(this.loginResponseModel);

}
class ErrorLoginState extends AuthState {
  String? error;
  ErrorLoginState(this.error);
}
