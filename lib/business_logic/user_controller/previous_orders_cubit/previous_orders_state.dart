part of 'previous_orders_cubit.dart';

@immutable
abstract class PreviousOrdersState {}

class PreviousOrdersInitial extends PreviousOrdersState {}

class PreviousOrdersLoadingState extends PreviousOrdersState {}
class PreviousOrdersSuccessfullyState extends PreviousOrdersState {
  List<OrderResponseModel>? orderResponseModel;
  PreviousOrdersSuccessfullyState(this.orderResponseModel);
}
class PreviousOrdersErrorState extends PreviousOrdersState {
  String? error;
  PreviousOrdersErrorState(this.error);
}
