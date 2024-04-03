import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavNotifier with ChangeNotifier {
  BottomNavNotifier() {
    _loadSelectedState();
  }

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  Future<void> _loadSelectedState() async {
    final prefs = await SharedPreferences.getInstance();
    _selectedIndex = prefs.getInt('selectedIndex') ?? 0;
    notifyListeners();
  }

  Future<void> setSelectedState(int index) async {
    final prefs = await SharedPreferences.getInstance();
    _selectedIndex = index;
    await prefs.setInt('selectedIndex', index);
    notifyListeners();
  }
}
