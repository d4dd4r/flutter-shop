import 'package:bloc/bloc.dart';

class BottomNavigatorCubit extends Cubit<int> {
  BottomNavigatorCubit() : super(0);

  void setValue(int value) => emit(value);
}
