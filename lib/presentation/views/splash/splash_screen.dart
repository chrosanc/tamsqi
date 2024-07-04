import 'package:flutter/material.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/core/constants/strings.dart';
import 'package:online/presentation/viewmodels/splash/splash_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = SplashViewModel(context);
    _viewModel.navigateToLanding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageAssets.appIcon),
            Text(
              AppStrings.appName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
