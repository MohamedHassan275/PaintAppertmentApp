import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_rate_state.dart';

class AddRateCubit extends Cubit<AddRateState> {
  AddRateCubit() : super(AddRateInitial());
}
