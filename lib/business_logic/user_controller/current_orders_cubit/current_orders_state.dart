part of 'current_orders_cubit.dart';

@immutable
abstract class CurrentOrdersState {}

class OrdersInitial extends CurrentOrdersState {}

class CurrentOrdersLoadingState extends CurrentOrdersState {}
class CurrentOrdersSuccessfullyState extends CurrentOrdersState {
  List<OrderResponseModel>? orderResponseModel;
  CurrentOrdersSuccessfullyState(this.orderResponseModel);
}
class CurrentOrdersErrorState extends CurrentOrdersState {
  String? error;
  CurrentOrdersErrorState(this.error);
}
