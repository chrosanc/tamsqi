import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/strings.dart';
import 'package:online/core/networks/location_service.dart';
import 'package:online/data/models/binderbyte_model.dart';

class MemberRegistrationModals {
  /// Generic modal builder for selection
  Future<T?> _showModalSheet<T>({
    required BuildContext context,
    required List<T> items,
    required String title,
    required Widget Function(T item, int index) itemBuilder,
  }) async {
    return await showModalBottomSheet<T?>(

      context: context,
      builder: (BuildContext context) {
        return _buildModalSheet(context, items, title, itemBuilder);
      },
    );
  }

  Widget _buildModalSheet<T>(
    BuildContext context,
    List<T> items,
    String title,
    Widget Function(T item, int index) itemBuilder,
  ) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(100)),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: appTheme.textTheme.titleMedium,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.grey,
                    ))
              ],
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => itemBuilder(items[index], index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Province Selection
  Future<Province?> provinceModal(BuildContext context) async {
    List<Province> provinces = await _fetchProvinces();

    return _showModalSheet(
      context: context,
      items: provinces,
      title: AppStrings.provinsi,
      itemBuilder: (province, index) => _buildLocationTile(
        context,
        province,
        index == provinces.length - 1, // Periksa apakah ini item terakhir
      ),
    );
  }

  /// Regency Selection
  Future<Regency?> regencyModal(BuildContext context, String provinceId) async {
    List<Regency> regencies = await _fetchRegencies(provinceId);

    return _showModalSheet(
      context: context,
      items: regencies,
      title: AppStrings.kota,
      itemBuilder: (regency, index) =>
          _buildLocationTile(context, regency, index == regencies.length - 1),
    );
  }

  /// Sub-district selection
  Future<SubDistrict?> subDistrictModal(
      BuildContext context, String regencyId) async {
    List<SubDistrict> subDistrict = await _fetchsubDistrict(regencyId);

    return _showModalSheet(
      context: context,
      items: subDistrict,
      title: AppStrings.kecamatan,
      itemBuilder: (subDistrictItem, index) => _buildLocationTile(
          context, subDistrictItem, index == subDistrict.length - 1),
    );
  }

  /// Village Selection
  Future<Village?> villageModal(
      BuildContext context, String subDistrictId) async {
    List<Village> villages = await _fetchVillage(subDistrictId);

    return _showModalSheet(
      context: context,
      items: villages,
      title: AppStrings.desa,
      itemBuilder: (village, index) =>
          _buildLocationTile(context, village, index == villages.length - 1),
    );
  }

  /// Payment Product Selection
  Future<String?> paymentProductModal(BuildContext context) async {
    return _showModalSheet(
      context: context,
      items: ['1 Minggu', '2 Minggu', '3 Minggu', 'Bulanan'],
      title: 'Produk Pembiayaan',
      itemBuilder: (item, index) =>
          _buildTile(context, item, index == ['1 Minggu', '2 Minggu', '3 Minggu', 'Bulanan'].length - 1),
    );
  }

  /// Business Data Modal
  Future<String?> businessDataModal(BuildContext context) async {
    return _showModalSheet(
      context: context,
      items: ['Usaha', 'Karyawan'],
      title: 'Data Usaha',
      itemBuilder: (item, index) =>
          _buildTile(context, item, index == ['Usaha', 'Karyawan'].length - 1),
    );
  }

  /// Fetch all villages
  Future<List<Village>> _fetchVillage(String subDistrictId) async {
    final response = await LocationService.getVillages(subDistrictId);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final List<dynamic> data = responseData['value'];
      return data
          .map((item) => Village(
              id: item['id'], idKecamatan: subDistrictId, name: item['name']))
          .toList();
    } else {
      throw Exception('Failed to load villages');
    }
  }

  Future<List<SubDistrict>> _fetchsubDistrict(String regencyId) async {
    final response = await LocationService.getSubDistricts(regencyId);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final List<dynamic> data = responseData['value'];
      return data
          .map((item) => SubDistrict(
              id: item['id'], idKabupaten: regencyId, name: item['name']))
          .toList();
    } else {
      throw Exception('Failed to load sub-district');
    }
  }

  Future<List<Province>> _fetchProvinces() async {
    final response = await LocationService.getProvinces();
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final List<dynamic> data = responseData['value'];
      return data
          .map((item) => Province(id: item['id'], name: item['name']))
          .toList();
    } else {
      throw Exception('Failed to load provinces');
    }
  }

  Future<List<Regency>> _fetchRegencies(String provinceId) async {
    final response = await LocationService.getRegencies(provinceId);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final List<dynamic> data = responseData['value'];
      return data
          .map((item) => Regency(
              id: item['id'], idProvinsi: provinceId, name: item['name']))
          .toList();
    } else {
      throw Exception('Failed to load regencies');
    }
  }

  Widget _buildTile(BuildContext context, String item, bool isLastItem) {
    return Column(
      children: [
        ListTile(
          title: Text(
            item,
            style: appTheme.textTheme.bodyMedium,
          ),
          onTap: () => Navigator.pop(context, item),
        ),
        if (!isLastItem)
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
      ],
    );
  }

  Widget _buildLocationTile(
      BuildContext context, dynamic item, bool isLastItem) {
    return Column(
      children: [
        ListTile(
          title: Text(
            item is String ? item : item.name,
            style: appTheme.textTheme.bodyMedium,
          ),
          onTap: () => Navigator.pop(context, item),
        ),
        if (!isLastItem)
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
      ],
    );
  }
}
