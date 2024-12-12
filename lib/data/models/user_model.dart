class LoginResponse {
  String success;
  String? message;
  String? namaLengkap;
  String? token;

  LoginResponse(
      {required this.success, this.message, this.namaLengkap, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        success: json['success'].toString(),
        message: json['message'],
        namaLengkap: json['data']['nama_lengkap'],
        token: json['token']);
  }
}

class User {
  int id;
  String namaLengkap;
  String? email;
  String? nomorRekening;
  String nomorTelepon;
  bool teleponTerverifikasi;
  String? password;
  int idAnggota;
  int? idDetailPribadi;
  int? idDetailIdentitas;
  int? idVerifikasiWajah;
  int? idPengajuanPinjaman;
  String? limitPinjaman;
  String status;
  String createdAt;
  String updatedAt;

  User({
    required this.id,
    required this.namaLengkap,
    this.email,
    this.nomorRekening,
    required this.nomorTelepon,
    required this.teleponTerverifikasi,
    this.password,
    required this.idAnggota,
    this.idDetailPribadi,
    this.idDetailIdentitas,
    this.idVerifikasiWajah,
    this.idPengajuanPinjaman,
    required this.limitPinjaman,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        namaLengkap: json['nama_lengkap'],
        email: json['email'] ?? '',
        nomorRekening: json['nomor_rekening'] ?? '',
        nomorTelepon: json['no_telepon'],
        teleponTerverifikasi: json['telepon_terverifikasi'],
        password: json['password'] ?? '',
        idAnggota: json['id_anggota'],
        idDetailPribadi: json['id_detail_pribadi'],
        idDetailIdentitas: json['id_detail_identitas'],
        idVerifikasiWajah: json['id_verifikasi_wajah'],
        idPengajuanPinjaman: json['id_pengajuan_pinjaman'],
        limitPinjaman: json['limit_pinjaman'],
        status: json['status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }
}
