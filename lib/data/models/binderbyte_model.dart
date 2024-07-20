class Province {
  final String id;
  final String name;

  Province({
    required this.id,
    required this.name,
  });
} 

class Regency {
  final String id;
  final String idProvinsi;
  final String name;

  Regency({
    required this.id,
    required this.idProvinsi,
    required this.name,
  });
} 

class SubDistrict {
  final String id;
  final String idKabupaten;
  final String name;

  SubDistrict({
    required this.id,
    required this.idKabupaten,
    required this.name,
  });
} 

class Village {
  final String id;
  final String idKecamatan;
  final String name;

  Village({
    required this.id,
    required this.idKecamatan,
    required this.name,
  });
} 
