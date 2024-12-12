import 'package:flutter/material.dart';
import 'package:online/app/routes.dart';
import 'package:online/core/networks/api_service.dart';
import 'package:online/core/utils/user_preferences.dart';
import 'package:online/data/models/anggota_model.dart';
import 'package:online/presentation/widget/loading/loading_widget.dart';

class MemberHomeViewmodel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Anggota? _anggota;

  Anggota? get anggota => _anggota;

  Future<void> getMember(BuildContext context) async {
    _isLoading = true;
    LoadingWidget.showLoadingDialog(context);
    notifyListeners();
    try {
      _anggota = await _apiService.getAnggota();
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      LoadingWidget.hideloadingDialog(context);
      notifyListeners();
    }
  }

  Future<void> logout(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      await UserPreferences().removeMemberToken();
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.first_landing, (route) => false);
      }
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
