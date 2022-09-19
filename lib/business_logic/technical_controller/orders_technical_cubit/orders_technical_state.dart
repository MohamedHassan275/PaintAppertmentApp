part of 'orders_technical_cubit.dart';

@immutable
abstract class OrdersTechnicalState {}

class OrdersTechnicalInitial extends OrdersTechnicalState {}

class OrdersLoadingState extends OrdersTechnicalState {}
class OrdersSuccessfullyState extends OrdersTechnicalState {
  List<OrderResponseModel>? orderResponseModel;
  OrdersSuccessfullyState(this.orderResponseModel);
}
class OrdersErrorState extends OrdersTechnicalState {
  String? error;
  OrdersErrorState(this.error);
}
