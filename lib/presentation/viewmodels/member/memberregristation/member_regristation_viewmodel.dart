import 'package:flutter/material.dart';
import 'package:online/core/networks/api_service.dart';
import 'package:online/core/utils/user_preferences.dart';
import 'package:online/data/models/anggota_model.dart';
import 'package:online/presentation/widget/loading/loading_widget.dart';

class MemberRegristationViewmodel extends ChangeNotifier {
  final List<Anggota> _anggotaList = [];
  bool _isLoading = false;
  final ApiService _apiService = ApiService();

  List<Anggota> get anggotaList => _anggotaList;

  bool get isLoading => _isLoading;

  String? selectedProvinceId;
  String? selectedRegencyId;
  String? selectedSubDistrictId;
  String? selectedPaymentProduct;

  Future<bool> addAnggota(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    LoadingWidget.showLoadingDialog(context);

    Anggota anggota = Anggota(
      id: 0,
      namaLengkap: nameController.text,
      nomorTelepon: phoneNumberController.text,
      provinsi: provinceController.text,
      kotaKabupaten: regencyController.text,
      kecamatan: subDistrictController.text,
      desa: villageController.text,
      rencanaPembiayaan: paymentPlanController.text,
      produkPembiayaan: productPaymentController.text,
      dataUsaha: businessDataController.text,
      kantor: officeController.text,
      status: '',
      createdAt: '',
      updatedAt: '',
    );

    try {
      final response = await _apiService.createAnggota(anggota);
      await UserPreferences().saveMemberToken(response.token);
      return true;
    } catch (e) {
      if (e is Exception) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Terjadi kesalahan')));
      }
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
      LoadingWidget.hideloadingDialog(context);
    }
  }

  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final provinceController = TextEditingController();
  final regencyController = TextEditingController();
  final subDistrictController = TextEditingController();
  final villageController = TextEditingController();
  final paymentPlanController = TextEditingController(text: 'Rp. ');
  final productPaymentController = TextEditingController();
  final businessDataController = TextEditingController();
  final officeController = TextEditingController();

  bool checkEmpty() {
    if (nameController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        provinceController.text.isEmpty ||
        regencyController.text.isEmpty ||
        subDistrictController.text.isEmpty ||
        villageController.text.isEmpty ||
        paymentPlanController.text.isEmpty ||
        productPaymentController.text.isEmpty ||
        officeController.text.isEmpty ||
        businessDataController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void setbusinessData(String item) {
    businessDataController.text = item;
  }

  void setPaymentProduct(String item) {
    productPaymentController.text = item;
  }

  void setProvince(String province, String id) {
    provinceController.text = province;
    selectedProvinceId = id;
    notifyListeners();
  }

  void setRegency(String regency, String id) {
    regencyController.text = regency;
    selectedRegencyId = id;
    notifyListeners();
  }

  void setSubDistrict(String subDistrict, String id) {
    subDistrictController.text = subDistrict;
    selectedSubDistrictId = id;
    notifyListeners();
  }

  void setVillage(String village) {
    villageController.text = village;
    notifyListeners();
  }
}
