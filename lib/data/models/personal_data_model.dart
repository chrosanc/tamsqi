class PersonalDataResponse {
  String? success;
  String? message;
  PersonalData? data;

  PersonalDataResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory PersonalDataResponse.fromJson(Map<String, dynamic> json) {
    return PersonalDataResponse(
      success: json['success'] as String?,
      message: json['message'] as String?, // Allow message to be null
      data: json['data'] != null ? PersonalData.fromJson(json['data']['detail_pribadi']) : null,
    );
  }
}


class PersonalData {
  final String latarBelakangPendidikan;
  final String emailPribadi;
  final String statusPernikahan;
  final String namaIbuKandung;
  final String alasanPeminjaman;
  final String memilikiKendaraan;
  final String memilikiTempatTinggal;
  final String namaKerabat;
  final String noTeleponKerabat;
  final String pekerjaan;
  final String namaPerusahaan;
  final String periodeMulaiKerja;
  final String jabatan;
  final String alamatPerusahaan;
  final String noTeleponPerusahaan;
  final String pendapatanBersihPerBulan;
  final String pendapatanLainnya;
  final String memilikiPinjamanLain;
  final String updatedAt;
  final String createdAt;
  final int id;

  PersonalData({
    required this.latarBelakangPendidikan,
    required this.emailPribadi,
    required this.statusPernikahan,
    required this.namaIbuKandung,
    required this.alasanPeminjaman,
    required this.memilikiKendaraan,
    required this.memilikiTempatTinggal,
    required this.namaKerabat,
    required this.noTeleponKerabat,
    required this.pekerjaan,
    required this.namaPerusahaan,
    required this.periodeMulaiKerja,
    required this.jabatan,
    required this.alamatPerusahaan,
    required this.noTeleponPerusahaan,
    required this.pendapatanBersihPerBulan,
    required this.pendapatanLainnya,
    required this.memilikiPinjamanLain,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory PersonalData.fromJson(Map<String, dynamic> json) {
    return PersonalData(
      latarBelakangPendidikan: json['latar_belakang_pendidikan'],
      emailPribadi: json['email_pribadi'],
      statusPernikahan: json['status_pernikahan'],
      namaIbuKandung: json['nama_ibu_kandung'],
      alasanPeminjaman: json['alasan_peminjaman'],
      memilikiKendaraan: json['memiliki_kendaraan'],
      memilikiTempatTinggal: json['memiliki_tempat_tinggal'],
      namaKerabat: json['nama_kerabat'],
      noTeleponKerabat: json['no_telepon_kerabat'],
      pekerjaan: json['pekerjaan'],
      namaPerusahaan: json['nama_perusahaan'],
      periodeMulaiKerja: json['periode_mulai_kerja'],
      jabatan: json['jabatan'],
      alamatPerusahaan: json['alamat_perusahaan'],
      noTeleponPerusahaan: json['no_telepon_perusahaan'],
      pendapatanBersihPerBulan: json['pendapatan_bersih_perbulan'],
      pendapatanLainnya: json['pendapatan_lainnya'],
      memilikiPinjamanLain: json['memiliki_pinjaman_lain'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }
}
