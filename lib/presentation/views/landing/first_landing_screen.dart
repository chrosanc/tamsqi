import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/core/constants/strings.dart';

class FirstLandingScreen extends StatefulWidget {
  const FirstLandingScreen({Key? key}) : super(key: key);

  @override
  _FirstLandingScreenState createState() => _FirstLandingScreenState();
}

class _FirstLandingScreenState extends State<FirstLandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned(
              bottom: -7,
              child: Center(
                  child: Image.asset(
                ImageAssets.first_landing_decor,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ))),
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
                        width: 24,
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
                        width: 12,
                        height: 12,
                      ),
                    ],
                  ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageAssets.first_landing_image),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    AppStrings.landingTitle1,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
