import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';

class HeaderCard extends StatelessWidget {
  final String title1;
  final String title2;
  final Widget bottomChild;
  const HeaderCard({super.key, required this.title1, required this.title2, required this.bottomChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 196,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: appTheme.colorScheme.primaryContainer),
          borderRadius: BorderRadius.circular(14)),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 31,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                width: 150,
                height: 150,
                color: const Color(0xFF33E23F).withAlpha(100),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 80,
                height: 80,
                color: const Color(0xFF33E23F).withAlpha(100),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title1,
                    style: TextStyle(color: appTheme.colorScheme.primary),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title2,
                    style: TextStyle(
                        color: appTheme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle, color: appTheme.colorScheme.primary, size: 12,),
                  const SizedBox(width: 6,),
                  Text(
                    'Tauhid',
                    style: TextStyle(
                        color: appTheme.colorScheme.primary,
                        fontWeight: FontWeight.normal,
                        fontSize: 12),
                  ),

                  const SizedBox(width: 6,),

                  Icon(Icons.check_circle, color: appTheme.colorScheme.primary, size: 12,),
                  const SizedBox(width: 6,),
                  Text(
                    'Amanah',
                    style: TextStyle(
                        color: appTheme.colorScheme.primary,
                        fontWeight: FontWeight.normal,
                        fontSize: 12),
                  ),

                  const SizedBox(width: 6,),

                  Icon(Icons.check_circle, color: appTheme.colorScheme.primary, size: 12,),
                  const SizedBox(width: 6,),
                  Text(
                    'Manfaat',
                    style: TextStyle(
                        color: appTheme.colorScheme.primary,
                        fontWeight: FontWeight.normal,
                        fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              const Divider(thickness: 1, indent: 24, endIndent: 24, color: Colors.grey,),
              const SizedBox(height: 6,),
              bottomChild,
            ],
          )
        ],
      ),
    );
  }
}
