import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/core/constants/strings.dart';

class MemberRegistrationModals {
  Future<String?> provinceModal(BuildContext context) async {
    return await showModalBottomSheet<String?>(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.provinsi,
                  style: appTheme.textTheme.titleMedium,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    _buildTile(context, 'Jawa Tengah'),
                    _buildTile(context, 'Jawa Timur'),
                    _buildTile(context, 'Jawa Barat'),
                    _buildTile(context, 'Aceh'),
                    _buildTile(context, 'DKI Jakarta'),
                    _buildTile(context, 'Yogyakarta'),
                    _buildTile(context, 'Bali'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String?> regencyModal(BuildContext context) async {
    return await showModalBottomSheet<String?>(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.provinsi,
                  style: appTheme.textTheme.titleMedium,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    _buildTile(context, 'Nganjuk'),
                    _buildTile(context, 'Magetan'),
                    _buildTile(context, 'Malang'),
                    _buildTile(context, 'Mojokerto'),
                    _buildTile(context, 'Ngawi'),
                    _buildTile(context, 'Pacitan'),
                    _buildTile(context, 'Pasuruan'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Implementasi metode modals lainnya sesuai kebutuhan Anda

  Widget _buildTile(BuildContext context, String name) {
    return Column(
      children: [
        ListTile(
          title: Text(
            name,
            style: appTheme.textTheme.bodyMedium,
          ),
          onTap: () {
            Navigator.pop(context, name);
          },
        ),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
