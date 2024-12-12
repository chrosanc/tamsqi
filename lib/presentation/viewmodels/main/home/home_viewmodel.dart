import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:online/core/networks/api_service.dart';
import 'package:online/data/models/credit_request_model.dart';
import 'package:online/data/models/user_model.dart';
import 'package:online/presentation/widget/loading/loading_widget.dart';

class HomeViewmodel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isLoading = false;
  User? _userData;
  CreditRequest? _userCredit;

  bool get isLoading => _isLoading;

  User? get userData => _userData;

  CreditRequest? get userCredit => _userCredit;

  Future<void> getUser(BuildContext context) async {
    if (_isLoading) return;

    _setLoadingState(context, true);

    try {
      final user = await _apiService.getUser();
      _userData = user;
      notifyListeners();

      if (user?.idPengajuanPinjaman != null) {
        final credit = await _apiService.showLoan();
        _userCredit = credit;
        notifyListeners();
      }
    } catch (e) {
      _showError(context, e);
    } finally {
      _setLoadingState(context, false);
    }
  }

  void _setLoadingState(BuildContext context, bool isLoading) {
    _isLoading = isLoading;
    if (isLoading) {
      LoadingWidget.showLoadingDialog(context);
    } else if (context.mounted) {
      LoadingWidget.hideloadingDialog(context);
    }
    notifyListeners();
  }

  void _showError(BuildContext context, Object error) {
    if (context.mounted) {
      if (error is Exception) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())));
      } else {
        print(error);
      }
    }
  }
}
