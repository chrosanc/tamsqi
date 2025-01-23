import 'package:flutter/material.dart';
import 'package:online/core/networks/api_service.dart';
import 'package:online/core/utils/user_preferences.dart';
import 'package:online/presentation/widget/loading/loading_widget.dart';

class AuthViewmodel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  //Login Controller
  final TextEditingController nomorRekeningController = TextEditingController();
  final TextEditingController nomorTeleponController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> loginUser(BuildContext context) async {
    _isLoading = true;
    LoadingWidget.showLoadingDialog(context);
    notifyListeners();

    try {
      final response = await _apiService.userLogin(
          nomorRekeningController.text.trim(),
          nomorTeleponController.text.trim());
      await UserPreferences().saveUserToken(response.token!);
      return true;
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
      return false;
    } finally {
      _isLoading = false;
      LoadingWidget.hideloadingDialog(context);
      notifyListeners();
    }
  }
}
