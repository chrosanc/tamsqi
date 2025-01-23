import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online/app/routes.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/core/constants/strings.dart';

class SuccessScreen extends StatelessWidget {
  final String title;
  final String subtitle;

  const SuccessScreen({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImageAssets.success_icon),
            const SizedBox(
              height: 48,
            ),
            Text(
              title,
              style: appTheme.textTheme.titleMedium,
            ),
            Text(
              subtitle,
              style: appTheme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 57,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.userHome);
                },
                child: Text(
                  AppStrings.berikutnya,
                  style: appTheme.textTheme.labelMedium,
                ))
          ],
        ),
      ),
    );
  }
}
