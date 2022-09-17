part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoadingState extends OrdersState {}
class OrdersSuccessfullyState extends OrdersState {
  List<OrderResponseModel>? orderResponseModel;
  OrdersSuccessfullyState(this.orderResponseModel);
}
class OrdersErrorState extends OrdersState {
  String? error;
  OrdersErrorState(this.error);
}
