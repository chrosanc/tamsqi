import 'package:flutter/material.dart';
import 'package:online/app/app.dart';
import 'package:online/presentation/views/user/viewmodels/main/credit/bank_account_viewmodel.dart';
import 'package:online/presentation/views/user/viewmodels/main/navigation_viewmodel.dart';
import 'package:online/presentation/views/user/viewmodels/memberregristation/member_regristation_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MemberRegristationViewmodel()), 
        ChangeNotifierProvider(create: (_) => NavigationViewmodel()),
        ChangeNotifierProvider(create: (_) => BankAccountViewModel())
      ],
      child: MyApp(),
    )
    );
}