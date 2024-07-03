import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log(change.toString());
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log(bloc.state);
  }

  // @override
  // void onCreate(BlocBase bloc) {
  //   log(bloc.state);
  // }

  // @override
  // void onError(BlocBase bloc, Object error, StackTrace stackTrace) {}

  // @override
  // void onEvent(Bloc bloc, Object? event) {}

  // @override
  // void onTransition(Bloc bloc, Transition transition) {}
}
