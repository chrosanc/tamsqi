import 'package:flutter/material.dart';

class BankAccountViewModel extends ChangeNotifier {
  String _selectedBank = '';

  String get selectedBank => _selectedBank;

  void selectBank(String bank) {
    _selectedBank = bank;
    notifyListeners();
  }
}
