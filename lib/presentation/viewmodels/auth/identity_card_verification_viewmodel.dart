import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online/core/networks/api_service.dart';
import 'package:online/data/models/identity_card_model.dart';
import 'package:online/presentation/widget/loading/loading_widget.dart';

class IdentityCardVerificationViewmodel extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  File? _idCardImage;

  File? get idCardImage => _idCardImage;

  File? _idCardSelfieImage;

  File? get idCardSelfieImage => _idCardSelfieImage;

  final ApiService _apiService = ApiService();

  IdentityCard? _identityCard;

  IdentityCard? get identityCard => _identityCard;

  final _imagePicker = ImagePicker();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController placeAndBirthDateController =
      TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  Future<void> pickIdCardPhoto(BuildContext context) async {
    final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
    if (pickedFile != null) {
      _idCardImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> pickIdCardSelfiePhoto(BuildContext context) async {
    final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
    if (pickedFile != null) {
      _idCardSelfieImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  bool checkController() {
    // Perbaikan logika untuk mengecek apakah semua field dan gambar sudah diisi
    return nikController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        placeAndBirthDateController.text.isNotEmpty &&
        genderController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        _idCardImage != null &&
        _idCardSelfieImage != null;
  }

  Future<bool> submitIdentityCard(BuildContext context) async {
    if (!checkController()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Silakan isi semua form dan upload foto terlebih dahulu')),
      );
      return false;
    }

    // Jika form lengkap, mulai proses loading dan kirim data
    _isLoading = true;
    LoadingWidget.showLoadingDialog(context);
    notifyListeners();

    _identityCard = IdentityCard(
      nik: nikController.text,
      name: nameController.text,
      birthDateandPlace: placeAndBirthDateController.text,
      gender: genderController.text,
      address: addressController.text,
    );

    try {
      // Panggil API service untuk submit kartu identitas
      await _apiService.submitIdentityCard(
        _identityCard!,
        _idCardImage!,
        _idCardSelfieImage!,
      );
      return true;
    } catch (e) {
      if (e is Exception) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
      return false;
    } finally {
      _isLoading = false;
      LoadingWidget.hideloadingDialog(context);
      notifyListeners();
    }
  }
}
