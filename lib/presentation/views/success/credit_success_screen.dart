import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online/app/routes.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';

class CreditSuccessScreen extends StatelessWidget {
  const CreditSuccessScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImageAssets.success_icon),
            const SizedBox(height: 48,),
            Text('Pengajuan Diproses', style: appTheme.textTheme.titleMedium,),
            Text('Pengajuan Anda dalam tahap pemrosesan, silahkan menunggu beberapa saat.', style: appTheme.textTheme.bodySmall, textAlign: TextAlign.center,),
            const SizedBox(height: 57,),
            ElevatedButton(onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.userHome);
            }, child: Text('Selesai', style: appTheme.textTheme.labelMedium,))
          ],),
      ),
    );
  }
}