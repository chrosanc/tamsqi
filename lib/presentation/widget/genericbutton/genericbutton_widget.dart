import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';

class GenericbuttonWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
const GenericbuttonWidget({ super.key, required this.title, required this.onTap });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: appTheme.colorScheme.primary
          ),
          borderRadius: BorderRadius.circular(12)
        ),
        child: ListTile(
          title: Text(title, style: TextStyle(color: appTheme.colorScheme.primary, fontWeight: FontWeight.bold),),
          trailing: SvgPicture.asset(ImageAssets.arrow_right, colorFilter: ColorFilter.mode(appTheme.colorScheme.primary, BlendMode.srcIn), width: 24,height: 24,),
        ),
      ),
    );
  }
}