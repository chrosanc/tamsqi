import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:online/core/networks/api_service.dart';
import 'package:online/data/models/personal_data_model.dart';
import 'package:online/presentation/widget/loading/loading_widget.dart';
import 'package:online/presentation/widget/modal/personal_information_modal.dart';

class PersonalDataVerificationViewmodel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  final TextEditingController edcucationBackgroundController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController marriageController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController creditReasonController = TextEditingController();
  final TextEditingController vehicleController = TextEditingController();
  final TextEditingController houseController = TextEditingController();
  final TextEditingController relationsController = TextEditingController();
  final TextEditingController relationsPhoneNumberController =
      TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController workController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController periodStartWorkController =
      TextEditingController();
  final TextEditingController jobPositionController = TextEditingController();
  final TextEditingController workAddressController = TextEditingController();
  final TextEditingController businessPhoneNumberController =
      TextEditingController();
  final TextEditingController workSalaryPerMonthController =
      TextEditingController();
  final TextEditingController otherSalaryController = TextEditingController();
  final TextEditingController otherCreditController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();

  File? _image;

  File? get image => _image;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool? boolValue;

  Future<void> selectEducationBackground(BuildContext context) async {
    final educationBackground =
        await PersonalInformationModal().showModal(context, 'Latar Belakang Pendidikan', ['SMP', 'SMA / SMK' , 'S1','S2', 'Lainnya']);
    if (educationBackground != null) {
      edcucationBackgroundController.text = educationBackground;
    }
  }

  Future<void> selectMarriage(BuildContext context) async {
    final marriageStatus =
        await PersonalInformationModal().showModal(context, 'Status Pernikahan', ['Belum Menikah' , 'Sudah Menikah']);
    if (marriageStatus != null) {
      marriageController.text = marriageStatus;
    }
  }

  Future<void> selectReason(BuildContext context) async {
    final creditReason =
        await PersonalInformationModal().showModal(context, 'Alasan Peminjaman' , ['Pembelian Barang' , 'Penambahan Modal', 'Investasi']);
    if (creditReason != null) {
      creditReasonController.text = creditReason;
    }
  }

  Future<void> selectVehicle(BuildContext context) async {
    final vehicle = await PersonalInformationModal().showModal(context, 'Kendaraan' , ['Punya' , 'Tidak Punya']);
    if (vehicle != null) {
      vehicleController.text = vehicle;
    }
  }

  Future<void> selectPlace(BuildContext context) async {
    final place = await PersonalInformationModal().showModal(context, 'Tempat Tinggal' , ['Punya' , 'Tidak Punya']);
    if (place != null) {
      houseController.text = place;
    }
  }

  Future<void> selectRelations(BuildContext context) async {
    final relations =
      await PersonalInformationModal().showModal(context, 'Pilih Kerabat' , ['Teman' , 'Saudara', 'Orang Tua']);
    if (relations != null) {
      relationsController.text = relations;
    }
  }

  Future<void> selectWork(BuildContext context) async {
    final work = await PersonalInformationModal().showModal(context, 'Pekerjaan' , ['Usaha' , 'Pekerjaan']);
    if (work != null) {
      workController.text = work;
    }
  }

  Future<void> selectOtherCredit(BuildContext context) async {
    final otherCredit =
    await PersonalInformationModal().showModal(context, 'Pinjaman Lainnya' , ['Punya' , 'Tidak Punya']);
    if (otherCredit != null) {
      otherCreditController.text = otherCredit;
    }
  }

  Future<void> selectWorkPeriod(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? pickDate = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: selectedDate);


    if (pickDate != null) {
      final convertedDate = DateFormat.yMMMMd("id").format(pickDate);
      periodStartWorkController.text = convertedDate;
    }
  }

  Future<void> selectBusinessPhoto(BuildContext context) async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
    }
  }

  bool checkController() {
    if (edcucationBackgroundController.text.isEmpty ||
        emailController.text.isEmpty ||
        marriageController.text.isEmpty ||
        motherNameController.text.isEmpty ||
        creditReasonController.text.isEmpty ||
        vehicleController.text.isEmpty ||
        houseController.text.isEmpty ||
        relationsController.text.isEmpty ||
        relationsPhoneNumberController.text.isEmpty ||
        workController.text.isEmpty ||
        businessNameController.text.isEmpty ||
        _image == null ||
        periodStartWorkController.text.isEmpty ||
        jobPositionController.text.isEmpty ||
        workAddressController.text.isEmpty ||
        businessPhoneNumberController.text.isEmpty ||
        workSalaryPerMonthController.text.isEmpty ||
        otherSalaryController.text.isEmpty ||
        otherCreditController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> uploadPersonalData(BuildContext context) async {
    _isLoading = true;
    LoadingWidget.showLoadingDialog(context);
    notifyListeners();

    PersonalData personalData = PersonalData(
        id: 0,
        latarBelakangPendidikan: edcucationBackgroundController.text,
        emailPribadi: emailController.text,
        statusPernikahan: marriageController.text,
        namaIbuKandung: motherNameController.text,
        alasanPeminjaman: creditReasonController.text,
        memilikiKendaraan: vehicleController.text,
        memilikiTempatTinggal: houseController.text,
        namaKerabat: relationsController.text,
        noTeleponKerabat: relationsPhoneNumberController.text,
        pekerjaan: workController.text,
        namaPerusahaan: businessNameController.text,
        periodeMulaiKerja: periodStartWorkController.text,
        // fotoPerusahaan: _image!,
        jabatan: jobPositionController.text,
        alamatPerusahaan: workAddressController.text,
        noTeleponPerusahaan: businessPhoneNumberController.text,
        pendapatanBersihPerBulan: workSalaryPerMonthController.text,
        pendapatanLainnya: otherSalaryController.text,
        memilikiPinjamanLain: otherCreditController.text,
        updatedAt: '',
        createdAt: '');

    try {
      if (checkController()) {
        await _apiService.registerUserPersonalData(personalData, image!);
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Silahkan isi form terlebih dahulu')));
        return false;
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return false;
    } finally {
      _isLoading = false;
      LoadingWidget.hideloadingDialog(context);
      notifyListeners();
    }
  }
}
