import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBlocObserver extends BlocObserver {

  @override
  void onEvent(Bloc bloc, Object event) {
    print('bloc: ${bloc.runtimeType}, event: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print('cubit: ${cubit.runtimeType}, change: $change');
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('bloc: ${bloc.runtimeType}, transition: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('cubit: ${cubit.runtimeType}, error: $error');
    super.onError(cubit, error, stackTrace);
  }

}