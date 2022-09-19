part of 'add_price_order_cubit.dart';

@immutable
abstract class AddPriceOrderState {}

class AddPriceOrderInitial extends AddPriceOrderState {}

class AddPriceOrderLoadingState extends AddPriceOrderState {}
class AddPriceOrderSuccessfullyState extends AddPriceOrderState {
  String? statusResponse;
  AddPriceOrderSuccessfullyState(this.statusResponse);
}
class AddPriceOrderErrorState extends AddPriceOrderState {
  String? statusResponse;
  AddPriceOrderErrorState(this.statusResponse);
}
