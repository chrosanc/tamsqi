import 'package:flutter/material.dart';

class LandingViewmodel{
  final BuildContext context;
  LandingViewmodel(this.context);

  _navigateToRegisterMember() async {
    Navigator.pushReplacementNamed(context, '/registerMember');

  }
}