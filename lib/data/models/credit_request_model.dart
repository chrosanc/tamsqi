class CreditRequestResponse {
  final String success;
  final String message;
  final CreditRequest? data;

  CreditRequestResponse(
      {required this.success, required this.message, this.data});

  factory CreditRequestResponse.fromJson(Map<String, dynamic> json) {
    return CreditRequestResponse(
        success: json['success'].toString(),
        message: json['message'],
        data:
            json['data'] != null ? CreditRequest.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success.toString(),
      'message': message,
      'data': data?.toJson()
    };
  }
}

class CreditRequest {
  int id;
  String kodePinjaman;
  String jumlahPinjaman;
  String bungaPinjaman;
  String periodePinjaman;
  int? periodeSaatIni;
  String namaRekening;
  String namaBank;
  String nomorRekening;
  String? statusPengajuan;
  String? statusPembayaran;
  String? jatuhTempo;
  String tanggalPengajuan;
  String? tanggalDisetujui;
  String? createdAt;
  String? updatedAt;

  CreditRequest(
      {required this.id,
      required this.kodePinjaman,
      required this.bungaPinjaman,
      required this.jumlahPinjaman,
      required this.periodePinjaman,
      this.periodeSaatIni,
      required this.namaRekening,
      required this.namaBank,
      required this.nomorRekening,
      this.statusPengajuan,
      this.statusPembayaran,
      this.jatuhTempo,
      required this.tanggalPengajuan,
      this.tanggalDisetujui,
      this.createdAt,
      this.updatedAt});

  factory CreditRequest.fromJson(Map<String, dynamic> json) {
    return CreditRequest(
        id: json['id'],
        kodePinjaman: json['kode_pinjaman'],
        jumlahPinjaman: json['jumlah_pinjaman'],
        bungaPinjaman: json['bunga_pinjaman'],
        periodePinjaman: json['periode_pinjaman'],
        periodeSaatIni: json['periode_saat_ini'],
        namaRekening: json['nama_rekening'],
        namaBank: json['nama_bank'],
        nomorRekening: json['nomor_rekening'],
        statusPengajuan: json['status_pengajuan'],
        statusPembayaran: json['status_pembayaran'],
        jatuhTempo: json['jatuh_tempo'],
        tanggalPengajuan: json['tanggal_pengajuan'],
        tanggalDisetujui: json['tanggal_disetujui'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kode_pinjaman': kodePinjaman,
      'jumlah_pinjaman': jumlahPinjaman.toString(),
      'bunga_pinjaman': bungaPinjaman.toString(),
      'periode_pinjaman': periodePinjaman,
      'periode_saat_ini': periodeSaatIni,
      'nama_rekening': namaRekening,
      'nama_bank': namaBank,
      'nomor_rekening': nomorRekening,
      'status_pengajuan': statusPengajuan,
      'jatuh_tempo': jatuhTempo,
      'tanggal_pengajuan': tanggalPengajuan,
      'tanggal_disetujui': tanggalDisetujui,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
