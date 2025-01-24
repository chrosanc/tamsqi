import 'dart:convert';
import 'dart:io';
import 'package:online/core/utils/user_preferences.dart';
import 'package:online/data/models/anggota_model.dart';
import 'package:online/data/models/credit_request_model.dart';
import 'package:online/data/models/face_verification_model.dart';
import 'package:online/data/models/identity_card_model.dart';
import 'package:online/data/models/personal_data_model.dart';
import 'package:online/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://b4e1-2405-8180-903-130-51c1-6c53-35b0-e856.ngrok-free.app/api';

  Future<String?> _getMemberToken() async {
    return await UserPreferences().getMemberToken();
  }

  Future<String?> _getUserToken() async {
    return await UserPreferences().getUserToken();
  }

  Future<Anggota?> getAnggota() async {
    final String? token = await _getMemberToken();

    final response = await http.get(
      Uri.parse('$baseUrl/anggota/get'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return Anggota.fromJson(jsonResponse['data']);
    } else {
      final jsonResponse = jsonDecode(response.body);
      final message = jsonResponse['message'];
      throw Exception(message);
    }
  }

  Future<RegisterResponse> createAnggota(Anggota anggota) async {
    final response = await http.post(
      Uri.parse('$baseUrl/anggota'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nama_lengkap': anggota.namaLengkap,
        'nomor_telepon': anggota.nomorTelepon,
        'provinsi': anggota.provinsi,
        'kota_kabupaten': anggota.kotaKabupaten,
        'kecamatan': anggota.kecamatan,
        'desa': anggota.desa,
        'rencana_pembiayaan': anggota.rencanaPembiayaan,
        'produk_pembiayaan': anggota.produkPembiayaan,
        'data_usaha': anggota.dataUsaha,
        'kantor': anggota.kantor,
      }),
    );


    if (response.statusCode == 201) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return RegisterResponse.fromJson(jsonResponse);
    } else {
      final Map<String, dynamic> errorResponse = jsonDecode(response.body);
      String errorMessage;
      if (errorResponse['message'] is Map) {
        errorMessage = errorResponse['message']
            .entries
            .map((entry) => '${entry.value.join(", ")}')
            .join("\n");
      } else if (errorResponse['message'] is String) {
        errorMessage = errorResponse['message'];
      } else {
        errorMessage = 'Terjadi Kesalahan';
      }
      throw Exception(errorMessage);
    }
  }

  Future<User?> getUser() async {
    final String? token = await _getUserToken();
    final response = await http
        .get(Uri.parse('$baseUrl/users/get'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return User.fromJson(jsonResponse['data']);
    } else {
      final Map<String, dynamic> errorResponse = jsonDecode(response.body);
      final errorMessage = errorResponse['message'];
      throw Exception(errorMessage);
    }
  }

  Future<LoginResponse> userLogin(
      String nomorRekening, String nomorTelepon) async {
    final response = await http.post(Uri.parse('$baseUrl/users/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'nomor_rekening': nomorRekening,
          'no_telepon': nomorTelepon,
        }));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return LoginResponse.fromJson(jsonResponse);
    } else {
      final Map<String, dynamic> errorResponse = jsonDecode(response.body);
      String errorMessage;
      if (errorResponse['message'] is Map) {
        errorMessage = errorResponse['message']
            .entries
            .map((entry) => '${entry.value.join(", ")}')
            .join("\n");
      } else if (errorResponse['message'] is String) {
        errorMessage = errorResponse['message'];
      } else {
        errorMessage = 'Terjadi Kesalahan';
      }
      throw Exception(errorMessage);
    }
  }

  Future<CreditRequestResponse> submitCredit(CreditRequest request) async {
    final String? token = await _getUserToken();
    final response =
        await http.post(Uri.parse('$baseUrl/users/pengajuan-pinjaman/set'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer $token'
            },
            body: jsonEncode(<String, dynamic>{
              'kode_pinjaman': request.kodePinjaman,
              'jumlah_pinjaman': request.jumlahPinjaman,
              'bunga_pinjaman': request.bungaPinjaman,
              'periode_pinjaman': request.periodePinjaman,
              'periode_saat_ini': request.periodeSaatIni,
              'nama_rekening': request.namaRekening,
              'nama_bank': request.namaBank,
              'nomor_rekening': request.nomorRekening,
              'status_pengajuan': request.statusPengajuan,
              'status_pembayaran': request.statusPembayaran,
              'jatuh_tempo': request.jatuhTempo,
              'tanggal_pengajuan': request.tanggalPengajuan,
              'tanggal_disetujui': request.tanggalDisetujui,
              'created_at': request.createdAt,
              'updated_at': request.updatedAt
            }));


    if (response.statusCode == 201 || response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return CreditRequestResponse.fromJson(jsonResponse);
    } else {
      final Map<String, dynamic> errorResponse = jsonDecode(response.body);
      String errorMessage;
      if (errorResponse['message'] is Map) {
        errorMessage = errorResponse['message']
            .entries
            .map((entry) => '${entry.value.join(", ")}')
            .join("\n");
      } else if (errorResponse['message'] is String) {
        errorMessage = errorResponse['message'];
      } else {
        errorMessage = 'Terjadi Kesalahan';
      }
      throw Exception(errorMessage);
    }
  }

  Future<PersonalDataResponse> registerUserPersonalData(
      PersonalData personalData, File image) async {
    var uri = Uri.parse('$baseUrl/users/detail-pribadi/set');
    final String? token = await _getUserToken();

    var request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Accept'] = 'application/json';

    request.fields['latar_belakang_pendidikan'] =
        personalData.latarBelakangPendidikan;
    request.fields['email_pribadi'] = personalData.emailPribadi;
    request.fields['status_pernikahan'] = personalData.statusPernikahan;
    request.fields['nama_ibu_kandung'] = personalData.namaIbuKandung;
    request.fields['alasan_peminjaman'] = personalData.alasanPeminjaman;
    request.fields['memiliki_kendaraan'] = personalData.memilikiKendaraan;
    request.fields['memiliki_tempat_tinggal'] =
        personalData.memilikiTempatTinggal;
    request.fields['nama_kerabat'] = personalData.namaKerabat;
    request.fields['no_telepon_kerabat'] = personalData.noTeleponKerabat;
    request.fields['pekerjaan'] = personalData.pekerjaan;
    request.fields['nama_perusahaan'] = personalData.namaPerusahaan;
    request.files.add(await http.MultipartFile.fromPath(
      'foto_perusahaan',
      image.path,
    ));
    request.fields['periode_mulai_kerja'] = personalData.periodeMulaiKerja;
    request.fields['jabatan'] = personalData.jabatan;
    request.fields['alamat_perusahaan'] = personalData.alamatPerusahaan;
    request.fields['no_telepon_perusahaan'] = personalData.noTeleponPerusahaan;

    request.fields['pendapatan_bersih_perbulan'] =
        personalData.pendapatanBersihPerBulan;
    request.fields['pendapatan_lainnya'] = personalData.pendapatanLainnya;
    request.fields['memiliki_pinjaman_lain'] =
        personalData.memilikiPinjamanLain;

    // Add image file (foto_perusahaan)

    var response = await request.send();
    final responseBody = await response.stream.bytesToString();


    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> jsonResponse = jsonDecode(responseBody);
      return PersonalDataResponse.fromJson(jsonResponse);
    } else {
      final Map<String, dynamic> errorResponse = jsonDecode(responseBody);
      String errorMessage;
      if (errorResponse['message'] is Map) {
        errorMessage = errorResponse['message']
            .entries
            .map((entry) => '${entry.value.join(", ")}')
            .join("\n");
      } else if (errorResponse['message'] is String) {
        errorMessage = errorResponse['message'];
      } else {
        errorMessage = 'Terjadi Kesalahan';
      }
      throw Exception(errorMessage);
    }
  }

  Future<CreditRequest?> showLoan() async {
    var uri = Uri.parse('$baseUrl/users/pengajuan-pinjaman/get');
    final String? token = await _getUserToken();

    var response = await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return CreditRequest.fromJson(jsonResponse['data']);
    } else {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final errorMessage = jsonDecode(jsonResponse['message']);
      throw Exception(errorMessage);
    }
  }

  Future<IdentityCardResponse> submitIdentityCard(
      IdentityCard identityCard, File ktpImage, File selfieImage) async {
    var uri = Uri.parse('$baseUrl/users/detail-identitas/set');
    final String? token = await _getUserToken();

    var request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Accept'] = 'application/json';

    request.files.add(await http.MultipartFile.fromPath(
      'foto_ktp',
      ktpImage.path,
    ));
    request.files.add(await http.MultipartFile.fromPath(
      'foto_selfie_ktp',
      selfieImage.path,
    ));
    request.fields['nik'] = identityCard.nik;
    request.fields['nama_sesuai_ktp'] = identityCard.name;
    request.fields['tempat_tanggal_lahir'] = identityCard.birthDateandPlace;
    request.fields['jenis_kelamin'] = identityCard.gender;
    request.fields['alamat_lengkap'] = identityCard.address;

    var response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> jsonResponse = jsonDecode(responseBody);
      return IdentityCardResponse.fromJson(jsonResponse);
    } else {
      final Map<String, dynamic> errorResponse = jsonDecode(responseBody);
      String errorMessage;
      if (errorResponse['message'] is Map) {
        errorMessage = errorResponse['message']
            .entries
            .map((entry) => '${entry.value.join(", ")}')
            .join("\n");
      } else if (errorResponse['message'] is String) {
        errorMessage = errorResponse['message'];
      } else {
        errorMessage = 'Terjadi Kesalahan';
      }
      throw Exception(errorMessage);
    }
  }

  Future<FaceVerificationResponse> submitFacePhoto(File image) async {
    var uri = Uri.parse('$baseUrl/users/verifikasi-wajah/set');
    final String? token = await _getUserToken();

    var request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Accept'] = 'application/json';

    // Add the image file to the request
    request.files.add(await http.MultipartFile.fromPath(
      'photo',
      image.path,
    ));

    // Send the request
    var response = await request.send();
    final responseBody = await response.stream.bytesToString();

    // Handle the response
    if (response.statusCode == 201 || response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(responseBody);
      return FaceVerificationResponse.fromJson(jsonResponse);
    } else {
      final Map<String, dynamic> errorResponse = jsonDecode(responseBody);
      String errorMessage;
      if (errorResponse['message'] is Map) {
        errorMessage = errorResponse['message']
            .entries
            .map((entry) => '${entry.value.join(", ")}')
            .join("\n");
      } else if (errorResponse['message'] is String) {
        errorMessage = errorResponse['message'];
      } else {
        errorMessage = 'Terjadi Kesalahan';
      }
      throw Exception(errorMessage);
    }
  }
}
