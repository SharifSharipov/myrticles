
import 'package:bloc/bloc.dart';

class NavbarCubit extends Cubit<int> {
  NavbarCubit() : super(0);

  updateScreen(int index) {
    emit(index);
  }
}