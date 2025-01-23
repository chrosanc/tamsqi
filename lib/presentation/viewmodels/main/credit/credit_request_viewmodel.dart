import 'package:flutter/material.dart';
import 'package:online/core/networks/api_service.dart';
import 'package:online/data/models/credit_request_model.dart';
import 'package:online/presentation/widget/loading/loading_widget.dart';

const List<String> periods = <String>['3 Bulan', '6 Bulan', '12 Bulan'];

class CreditRequestViewmodel extends ChangeNotifier {
  //PageCreditRequest
  final ApiService _apiService = ApiService();
  TextEditingController rekeningBankController = TextEditingController();

  //PageRekeningBank
  TextEditingController rekeningNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController bankController = TextEditingController();

  final String _selectedPeriod = periods.first;

  String get selectedPeriod => _selectedPeriod;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _rekeningData;

  String? get rekeningData => _rekeningData;

  String? _selectedBank;

  String? get selectedBank => _selectedBank;

  CreditRequest? _creditRequest;

  CreditRequest? get creditRequest => _creditRequest;

  void selectBank(String bank) {
    _selectedBank = bank;
    bankController.text = _selectedBank!;
    notifyListeners();
  }

  Future<bool> submitCredit(
      BuildContext context, String interest, String total, String period) async {
    // Cegah double submission
    if (_isLoading) return false;
    _isLoading = true;

    // Tampilkan loading dialog
    LoadingWidget.showLoadingDialog(context);

    try {
      // Validasi input
      if (!checkForm(context)) {
        return false;
      }

      // Buat objek CreditRequest
      _creditRequest = CreditRequest(
        id: 0,
        kodePinjaman: 'kode',
        bungaPinjaman: interest,
        jumlahPinjaman: total,
        periodePinjaman: period,
        periodeSaatIni: 0,
        namaRekening: nameController.text.trim(),
        namaBank: bankController.text.trim(),
        nomorRekening: rekeningNumberController.text.trim(),
        statusPengajuan: 'Konfirmasi Admin',
        statusPembayaran: '',
        jatuhTempo: null,
        tanggalPengajuan: DateTime.now().toString(),
        tanggalDisetujui: null,
        createdAt: null,
        updatedAt: null,
      );

      final response = await _apiService.submitCredit(_creditRequest!);
      if(response.success == 'true') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if(e is Exception && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
      return false;
    } finally {
      // Pastikan loading state dihentikan dan dialog loading ditutup
      _isLoading = false;
      if(context.mounted){
        LoadingWidget.hideloadingDialog(context);
      }
    }
  }

  Future<void> saveData() async {
    _rekeningData =
        '${rekeningNumberController.text} \n${nameController.text} \n${bankController.text}';
    rekeningBankController.text = _rekeningData!;
  }

  bool checkForm(BuildContext context) {
    if (rekeningBankController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nomor rekening tidak boleh kosong.')),
      );
      return false;
    }
    return true;
  }
}
