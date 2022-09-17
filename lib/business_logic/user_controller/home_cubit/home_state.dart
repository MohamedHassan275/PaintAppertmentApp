part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}
class HomeSuccessState extends HomeState {
  HomeResponseModel? homeResponseModel;
  HomeSuccessState(this.homeResponseModel);
}
class HomeErrorState extends HomeState {
  String? error;
  HomeErrorState(this.error);
}

class ShowDetailsLoadingState extends HomeState {}
class ShowDetailsSuccessState extends HomeState {
  ShowProductResponseDetails? showProductResponseDetails;
  ShowDetailsSuccessState(this.showProductResponseDetails);
}
class ShowDetailsErrorState extends HomeState {
  String? error;
  ShowDetailsErrorState(this.error);
}