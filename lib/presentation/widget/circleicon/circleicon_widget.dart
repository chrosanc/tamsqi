import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';

class CircleiconWidget extends StatelessWidget {
  final Widget icons;
  final String description;
const CircleiconWidget({ super.key, required this.icons, required this.description });

@override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: appTheme.colorScheme.primary,
            borderRadius: BorderRadius.circular(50)
          ),
          child: icons
        ),
        Text(description, style: TextStyle(color: appTheme.colorScheme.primary, fontSize: 12),)
      ],
    );
  }
}
