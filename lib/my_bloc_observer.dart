import 'package:bloc/bloc.dart';
import 'dart:convert';

class MyBlocObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
//    print('[Bloc Change] ${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
//    print('[Bloc Event] ${event.toString()}');
    super.onEvent(bloc, event);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
//    print('[Bloc Cubit] ${json.encode(cubit)}');
//    print('[Bloc Error] $error');
//    print('[Bloc Stack Trace] ${stackTrace.toString()}');
    super.onError(cubit, error, stackTrace);
  }
}
