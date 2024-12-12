import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';

class ApprovalheaderCard extends StatelessWidget {
  final String limit;
  const ApprovalheaderCard({super.key, required this.limit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [        
              Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pengajuan Anda',
                    style: TextStyle(color: appTheme.colorScheme.primary),
                  ),
                    Text(
                    'Diterima',
                    style: TextStyle(
                        color: appTheme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(height: 12,),
                  Text(
                    'Limit Peminjaman Anda',
                    style: TextStyle(
                        fontSize: 12),
                  ),
                  Text(
                    limit,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),                  
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImageAssets.accepted_image)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
