import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online/app/routes.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/core/constants/strings.dart';

class MemberRegistrationSuccessScreen extends StatelessWidget {
const MemberRegistrationSuccessScreen({ Key? key }) : super(key: key);

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
          Text('Terima Kasih Sudah Mendaftar', style: appTheme.textTheme.titleMedium,),
          Text('Kantor Cabang terdekat segera menghubungin Nomer yang sudah terdaftar', style: appTheme.textTheme.bodySmall, textAlign: TextAlign.center,),
          const SizedBox(height: 57,),
          ElevatedButton(onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.unverifiedHome, (route) => false);
          }, child: Text(AppStrings.berikutnya, style: appTheme.textTheme.labelMedium,))
        ],),
      ),
    );
  }
}