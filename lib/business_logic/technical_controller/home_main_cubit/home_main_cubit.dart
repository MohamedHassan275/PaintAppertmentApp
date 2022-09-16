import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_main_state.dart';

class HomeMainCubit extends Cubit<HomeMainState> {
  HomeMainCubit() : super(HomeMainInitial());
}
