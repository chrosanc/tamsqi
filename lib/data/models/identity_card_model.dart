class IdentityCardResponse {
  String success;
  String? message;
  IdentityCard? data;

  IdentityCardResponse({required this.success, this.message, this.data});

  factory IdentityCardResponse.fromJson(Map<String, dynamic> json) {
    final success = json['success'];
    final message = json['message'];

    return IdentityCardResponse(
      success: success is String ? success : success.toString(),
      message: message is String ? message : message?.toString() ?? '',
      data: json['data'] != null ? IdentityCard.fromJson(json['data']) : null,
    );
  }
}

class IdentityCard {
  final String nik;
  final String name;
  final String birthDateandPlace;
  final String gender;
  final String address;

  IdentityCard({
    required this.nik,
    required this.name,
    required this.birthDateandPlace,
    required this.gender,
    required this.address,
  });

  factory IdentityCard.fromJson(Map<String, dynamic> json) {
    return IdentityCard(
      nik: json['nik'],
      name: json['nama_sesuai_ktp'],
      birthDateandPlace: json['tempat_tanggal_lahir'],
      gender: json['jenis_kelamin'],
      address: json['alamat_lengkap'],
    );
  }
}
