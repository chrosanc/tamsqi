import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';

class UnverifiedPayment extends StatelessWidget {
const UnverifiedPayment({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageAssets.pending_image),
            Text('Pengajuan Anggota Anda sedang dalam proses Verifikasi', style: appTheme.textTheme.bodyMedium, textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}