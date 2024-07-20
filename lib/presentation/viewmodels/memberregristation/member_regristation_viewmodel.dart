import 'package:flutter/material.dart';

class MemberRegristationViewmodel extends ChangeNotifier {
final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final provinceController = TextEditingController();
  final regencyController = TextEditingController();
  final subDistrictController = TextEditingController();
  final villageController = TextEditingController();
  final paymentPlanController = TextEditingController();
  final productPaymentController = TextEditingController();
  final businessDataController = TextEditingController();

  void setProvince(String province) {
    provinceController.text = province;
    notifyListeners();
  }

  void setRegency(String regency) {
    regencyController.text = regency;
    notifyListeners();
  }

  void setSubDistrict(String subDistrict) {
    subDistrictController.text = subDistrict;
    notifyListeners();
  }

  void setVillage(String village) {
    villageController.text = village;
    notifyListeners();
  }

}