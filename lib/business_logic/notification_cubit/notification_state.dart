part of 'notification_cubit.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoadingState extends NotificationState {}
class NotificationSuccessfullyState extends NotificationState {
  List<OrderResponseModel>? orderResponseModel;
  NotificationSuccessfullyState(this.orderResponseModel);
}
class NotificationErrorState extends NotificationState {
  String? error;
  NotificationErrorState(this.error);
}
