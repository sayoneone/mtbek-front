import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultBlocObserver extends BlocObserver {
  /// Making bloc observer as singleton
  DefaultBlocObserver._();

  factory DefaultBlocObserver.instance() =>
      _singleton ??= DefaultBlocObserver._();

  static DefaultBlocObserver? _singleton;

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log('onChange -- ${bloc.runtimeType}, $change');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError -- ${bloc.runtimeType}, $error');

    /// Here we report bloc errors to [Crashlytics]
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose -- ${bloc.runtimeType}');
  }
}
