part of 'previous_technical_orders_cubit.dart';

@immutable
abstract class PreviousOrdersTechnicalState {}

class PreviousOrdersTechnicalInitial extends PreviousOrdersTechnicalState {}

class PreviousOrdersLoadingState extends PreviousOrdersTechnicalState {}
class PreviousOrdersSuccessfullyState extends PreviousOrdersTechnicalState {
  List<OrderResponseModel>? orderResponseModel;
  PreviousOrdersSuccessfullyState(this.orderResponseModel);
}
class PreviousOrdersErrorState extends PreviousOrdersTechnicalState {
  String? error;
  PreviousOrdersErrorState(this.error);
}
