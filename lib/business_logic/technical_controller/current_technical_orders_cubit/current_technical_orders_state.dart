part of 'current_technical_orders_cubit.dart';

@immutable
abstract class CurrentOrdersTechnicalState {}

class OrdersTechnicalInitial extends CurrentOrdersTechnicalState {}

class CurrentOrdersLoadingState extends CurrentOrdersTechnicalState {}
class CurrentOrdersSuccessfullyState extends CurrentOrdersTechnicalState {
  List<OrderResponseModel>? orderResponseModel;
  CurrentOrdersSuccessfullyState(this.orderResponseModel);
}
class CurrentOrdersErrorState extends CurrentOrdersTechnicalState {
  String? error;
  CurrentOrdersErrorState(this.error);
}
