part of 'add_rate_cubit.dart';

@immutable
abstract class AddRateState {}

class AddRateInitial extends AddRateState {}

class AddRateLoadingState extends AddRateState {}
class AddRateSuccessState extends AddRateState {
  String? statusResponse;
  AddRateSuccessState(this.statusResponse);
}
class AddRateErrorState extends AddRateState {
  String? statusResponse;
  AddRateErrorState(this.statusResponse);
}
