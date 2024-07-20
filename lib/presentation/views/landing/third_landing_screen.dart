import 'package:flutter/material.dart';
import 'package:online/app/routes.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/core/constants/strings.dart';

class ThirdLandingScreen extends StatefulWidget {
  const ThirdLandingScreen({ Key? key }) : super(key: key);

  @override
  _ThirdLandingScreenState createState() => _ThirdLandingScreenState();
}

class _ThirdLandingScreenState extends State<ThirdLandingScreen> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Positioned(
              bottom: -26,
              child: Image.asset(ImageAssets.third_landing_decor, width: MediaQuery.of(context).size.width, fit: BoxFit.fitWidth,)),
             Positioned(
              bottom: 24,
              left: 34,
              right: 34,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, AppRoutes.register_member);
                }, 
                child: Text(AppStrings.mulai, style: Theme.of(context).textTheme.labelMedium)),
            ),

            Positioned(
                right: 0,
                left: 0,
            bottom: 226,
            child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: appTheme.primaryColor,
                        ),
                        width: 12,
                        height: 12,
                      ),
                      const SizedBox(width: 12,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: appTheme.primaryColor,
                        ),
                        width: 12,
                        height: 12,
                      ),
                      const SizedBox(width: 12,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: appTheme.primaryColor,
                        ),
                        width: 24,
                        height: 12,
                      ),
                    ],
                  ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageAssets.third_landing_image),
                const SizedBox(height: 28,),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(AppStrings.landingTitle3, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,),
                ),
                
              ],
            ),
            ),
            
           
           
        ],
      ),
    );
  }
}