import 'dart:async';
import 'package:flutter/foundation.dart';

abstract class BaseViewModel<State, Effect> extends ChangeNotifier {
  State _state;
  State get state => _state;

  // Stream for one-off side effects (navigation, toasts, dialogs)
  final StreamController<Effect> _effectController =
      StreamController<Effect>.broadcast();
  Stream<Effect> get effectStream => _effectController.stream;

  BaseViewModel(this._state);

  @protected
  void emitState(State newState) {
    if (_state != newState) {
      _state = newState;
      notifyListeners(); // Notifies the UI to rebuild
    }
  }

  @protected
  void emitEffect(Effect effect) {
    _effectController.add(effect);
  }

  @override
  void dispose() {
    _effectController.close();
    super.dispose();
  }
}
