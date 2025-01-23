import 'package:flutter/material.dart';
import 'package:online/presentation/views/landing/first_landing_screen.dart';
import 'package:online/presentation/views/landing/second_landing_screen.dart';
import 'package:online/presentation/views/landing/third_landing_screen.dart';

class LandingContainer extends StatefulWidget {
  const LandingContainer({ super.key });

  @override
  _LandingContainerState createState() => _LandingContainerState();
}

class _LandingContainerState extends State<LandingContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
        FirstLandingScreen(),
        SecondLandingScreen(),
        ThirdLandingScreen()
        ]
      ),
    );
  }
}