import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online/app/routes.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/presentation/viewmodels/member/main/home/member_home_viewmodel.dart';
import 'package:provider/provider.dart';

class UnverifiedProfile extends StatelessWidget {
  const UnverifiedProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MemberHomeViewmodel>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 74),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 12,
                          color: Colors.black.withAlpha(15),
                          offset: const Offset(0, 4))
                    ]),
                child: _rowMenu('Daftar Akun', () {
                  Navigator.pushNamed(context, AppRoutes.login);
                }),
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 12,
                          color: Colors.black.withAlpha(15),
                          offset: const Offset(0, 4))
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
                    const SizedBox(
                      height: 34,
                    ),
                    _rowMenu('Keluar Anggota', () async {
                      viewModel.logout(context);
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
