import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';

class ProfileCardWidget extends StatelessWidget {
  final String name;
  final String? desc1;
  final String? desc2;
  final String? desc3;

  const ProfileCardWidget(
      {super.key, required this.name, this.desc1, this.desc2, this.desc3});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(15),
                blurRadius: 12,
                offset: const Offset(0, 4))
          ],
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: appTheme.textTheme.titleMedium),
                      Text(desc1 ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: appTheme.textTheme.bodyMedium),
                      Text(desc2 ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: appTheme.textTheme.bodyMedium),
                      Text(desc3 ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: appTheme.textTheme.bodyMedium),
                    ],
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 40,
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.withAlpha(50),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pengaturan Akun', style: appTheme.textTheme.titleSmall),
                SvgPicture.asset(ImageAssets.arrow_right)
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
