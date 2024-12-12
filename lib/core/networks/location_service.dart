import 'package:http/http.dart' as http;
import 'package:online/core/constants/binderbyte_constant.dart';

class LocationService {
  static Future<http.Response> getProvinces() async {
    var url = Uri.parse('${BinderbyteConstant.baseUrl}${BinderbyteConstant.provincesEndpoint}?api_key=${BinderbyteConstant.apiKey}');
    var response = await http.get(url);
    return response;
  }

  static Future<http.Response> getRegencies(String provinceId) async {
    var url = Uri.parse('${BinderbyteConstant.baseUrl}${BinderbyteConstant.regenciesEndpoint}?api_key=${BinderbyteConstant.apiKey}&id_provinsi=$provinceId');
    var response = await http.get(url);
    return response;
  }

  static Future<http.Response> getSubDistricts(String regencyId) async {
    var url = Uri.parse('${BinderbyteConstant.baseUrl}${BinderbyteConstant.subDistrictEndpoint}?api_key=${BinderbyteConstant.apiKey}&id_kabupaten=$regencyId');
    var response = await http.get(url, headers: {'Authorization': 'Bearer ${BinderbyteConstant.apiKey}'});
    return response;
  }
  
    static Future<http.Response> getVillages(String subDistrictId) async {
    var url = Uri.parse('${BinderbyteConstant.baseUrl}${BinderbyteConstant.villageEndpoint}?api_key=${BinderbyteConstant.apiKey}&id_kecamatan=$subDistrictId');
    var response = await http.get(url, headers: {'Authorization': 'Bearer ${BinderbyteConstant.apiKey}'});
    return response;
  }
}
