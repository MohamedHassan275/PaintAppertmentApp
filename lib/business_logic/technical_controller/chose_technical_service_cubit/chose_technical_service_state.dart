part of 'chose_technical_service_cubit.dart';

@immutable
abstract class ChoseTechnicalServiceState {}

class ChoseTechnicalServiceInitial extends ChoseTechnicalServiceState {}

class ChoseTechnicalServiceLoadingState extends ChoseTechnicalServiceState {}

class ChoseTechnicalServiceSuccessfullyState extends ChoseTechnicalServiceState {
  final List<ChooseServiceResponseModel>? choseServiceTechnical;
  ChoseTechnicalServiceSuccessfullyState(this.choseServiceTechnical);
}
class ChoseTechnicalServiceErrorState extends ChoseTechnicalServiceState {
  final String? error;
  ChoseTechnicalServiceErrorState(this.error);
}
