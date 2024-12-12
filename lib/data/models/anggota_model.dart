class RegisterResponse {
  final String status;
  final String token;
  final String? message;
  final Anggota? data;

  RegisterResponse(
      {required this.status,
      required this.token,
      this.message,
      required this.data});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
        status: json['status'],
        token: json['token'],
        message: json['message'],
        data: json['data'] != null ? Anggota.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'success': status.toString(),
      'message': message,
      'data': data?.toJson()
    };
  }
}

class Anggota {
  int id;
  String namaLengkap;
  String nomorTelepon;
  String provinsi;
  String kotaKabupaten;
  String kecamatan;
  String desa;
  String rencanaPembiayaan;
  String produkPembiayaan;
  String dataUsaha;
  String kantor;
  String status;
  String createdAt;
  String updatedAt;

  Anggota({
    required this.id,
    required this.namaLengkap,
    required this.nomorTelepon,
    required this.provinsi,
    required this.kotaKabupaten,
    required this.kecamatan,
    required this.desa,
    required this.rencanaPembiayaan,
    required this.produkPembiayaan,
    required this.dataUsaha,
    required this.kantor,
    required this.status,
    required this.createdAt,
    required this.updatedAt
  });

  factory Anggota.fromJson(Map<String, dynamic> json) {
    return Anggota(
      id: json['id'] ?? 0,
      namaLengkap: json['nama_lengkap'] ?? '',
      nomorTelepon: json['nomor_telepon'] ?? '',
      provinsi: json['provinsi'] ?? '',
      kotaKabupaten: json['kota_kabupaten'] ?? '',
      kecamatan: json['kecamatan'] ?? '',
      desa: json['desa'] ?? '',
      rencanaPembiayaan: json['rencana_pembiayaan'] ?? '',
      produkPembiayaan: json['produk_pembiayaan'] ?? '',
      dataUsaha: json['data_usaha'] ?? '',
      kantor: json['kantor'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_lengkap': namaLengkap,
      'nomor_telepon': nomorTelepon,
      'provinsi': provinsi,
      'kota_kabupaten': kotaKabupaten,
      'kecamatan': kecamatan,
      'desa': desa,
      'rencana_pembiayaan': rencanaPembiayaan,
      'produk_pembiayaan': produkPembiayaan,
      'data_usaha': dataUsaha,
      'kantor': kantor,
      'status' : status,
      'created_at' : createdAt,
      'updated_at' : updatedAt
    };
  }
}
