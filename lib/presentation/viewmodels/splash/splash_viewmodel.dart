import 'dart:async';
import 'package:flutter/material.dart';

class SplashViewModel {
  final BuildContext context;

  SplashViewModel(this.context);

  void navigateToLanding() async {
    await Future.delayed(Duration(seconds: 3),() {});
    Navigator.pushReplacementNamed(context, '/first_landing');
  }
}
