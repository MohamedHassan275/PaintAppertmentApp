part of 'add_order_cubit.dart';

@immutable
abstract class AddOrderState {}

class AddOrderInitial extends AddOrderState {}

class AddOrderLoadingState extends AddOrderState {}
class AddOrderSuccessfullyState extends AddOrderState {
  String? addOrderStatus;
  AddOrderSuccessfullyState(this.addOrderStatus);
}
class AddOrderErrorState extends AddOrderState {
  String? addOrderStatus;
  AddOrderErrorState(this.addOrderStatus);
}
