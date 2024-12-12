import 'package:flutter/material.dart';

class NavigationViewmodel extends ChangeNotifier{
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void resetIndex() {
    _selectedIndex = 0;
    notifyListeners();
  }
}