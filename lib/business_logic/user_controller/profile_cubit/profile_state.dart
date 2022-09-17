part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}
class ProfileSuccessState extends ProfileState {
  ProfileResponseModel? profileResponseModel;
  ProfileSuccessState(this.profileResponseModel);
}
class ProfileErrorState extends ProfileState {
  String? error;
  ProfileErrorState(this.error);
}

class UpdateProfileLoadingState extends ProfileState {}

class UpdateProfileSuccessState extends ProfileState {
  String? changeProfileSuccessfully;
  UpdateProfileSuccessState(this.changeProfileSuccessfully);
}