import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/core/constants/strings.dart';
import 'package:online/presentation/widget/card/payment_card_widget.dart';

class UserPaymentScreen extends StatelessWidget {
  const UserPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pinjaman'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.pending_image, height: 200,),
              Text(
                AppStrings.belumVerifikasi,
                style: appTheme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
