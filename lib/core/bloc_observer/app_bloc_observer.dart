import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('✅ Created: ${bloc.runtimeType}');
  }

  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   super.onChange(bloc, change);
  //   debugPrint('⚙️ ${bloc.runtimeType} changed $change');
  // }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint('❌ ${bloc.runtimeType} Error $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('🛑 Closed: ${bloc.runtimeType}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('💡 $transition');
  }
}
