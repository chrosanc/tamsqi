import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online/app/routes.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/core/utils/user_preferences.dart';
import 'package:online/presentation/viewmodels/main/home/home_viewmodel.dart';
import 'package:online/presentation/widget/card/profile_card_widget.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewmodel>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileCardWidget(
                name: homeViewModel.userData?.namaLengkap ?? 'User',
                desc1: 'No. Rekening : ${homeViewModel.userData?.nomorRekening}',
                desc2: 'Status Akun : ${homeViewModel.userData?.status}'),
              const SizedBox(
                height: 14,
              ),
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 12,
                          color: Colors.black.withAlpha(15),
                          offset: Offset(0, 4))
                    ]),
                child: Column(
                  children: [
                    _rowMenu('Riwayat Transaksi', () {}),
                    const SizedBox(
                      height: 34,
                    ),
                    _rowMenu('Pengajuan Pinajaman', () {}),
                    const SizedBox(
                      height: 34,
                    ),
                    _rowMenu('Setelan', () {}),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 12,
                          color: Colors.black.withAlpha(15),
                          offset: Offset(0, 4))
                    ]),
                child: Column(
                  children: [
                    _rowMenu('Customer Service', () {}),
                    const SizedBox(
                      height: 34,
                    ),
                    _rowMenu('Chat Support', () {}),
                    const SizedBox(
                      height: 34,
                    ),
                    _rowMenu('Syarat & Ketentuan', () {}),
                    const SizedBox(
                      height: 34,
                    ),
                    _rowMenu('Tentang Kami', () {}),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 12,
                          color: Colors.black.withAlpha(15),
                          offset: Offset(0, 4))
                    ]),
                child: Column(
                  children: [
                    _rowMenu('Keluar', () async {
                      await UserPreferences().removeUserToken();
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.login, (route) => false);
                      UserPreferences().removeUserToken();
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _rowMenu(String title, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), SvgPicture.asset(ImageAssets.arrow_right)],
      ),
    );
  }
}
