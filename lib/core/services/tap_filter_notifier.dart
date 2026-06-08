import 'package:flutter/foundation.dart';

class TapFilterNotifier extends ChangeNotifier {
  final Set<String> _selectedTaps = {};

  Set<String> get selectedTaps => Set.unmodifiable(_selectedTaps);

  void toggleFilter(String tapName) {
    if (_selectedTaps.contains(tapName)) {
      _selectedTaps.remove(tapName);
    } else {
      _selectedTaps.add(tapName);
    }
    notifyListeners();
  }

  void setFilter(String? tapName) {
    if (tapName == null) {
      clearFilter();
      return;
    }
    if (_selectedTaps.length == 1 && _selectedTaps.first == tapName) {
      return;
    }
    _setFilter(tapName);
    notifyListeners();
  }

  void _setFilter(String tapName) {
    _selectedTaps.clear();
    _selectedTaps.add(tapName);
  }

  void clearFilter() {
    if (_selectedTaps.isNotEmpty) {
      _selectedTaps.clear();
      notifyListeners();
    }
  }
}
