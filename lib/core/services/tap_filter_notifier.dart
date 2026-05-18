import 'package:flutter/foundation.dart';

class TapFilterNotifier extends ChangeNotifier {
  String? _selectedTap;

  String? get selectedTap => _selectedTap;

  void setFilter(String? tapName) {
    if (_selectedTap != tapName) {
      _selectedTap = tapName;
      notifyListeners();
    }
  }

  void clearFilter() {
    setFilter(null);
  }
}
