part of 'setting_cubit.dart';

@immutable
abstract class SettingState {}

class SettingInitial extends SettingState {}

class SettingLoadingState extends SettingState {}
class SettingSuccessfullyState extends SettingState {
  SettingResponseModel? settingResponseModel;
  SettingSuccessfullyState(this.settingResponseModel);
}
class SettingErrorState extends SettingState {
  String? error;
  SettingErrorState(this.error);
}
