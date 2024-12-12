import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:online/app/app.dart';
import 'package:online/presentation/viewmodels/auth/auth_viewmodel.dart';
import 'package:online/presentation/viewmodels/auth/identity_card_verification_viewmodel.dart';
import 'package:online/presentation/viewmodels/auth/personal_data_verification_viewmodel.dart';
import 'package:online/presentation/viewmodels/main/credit/bank_account_viewmodel.dart';
import 'package:online/presentation/viewmodels/main/credit/credit_request_viewmodel.dart';
import 'package:online/presentation/viewmodels/main/home/home_viewmodel.dart';
import 'package:online/presentation/viewmodels/main/navigation_viewmodel.dart';
import 'package:online/presentation/viewmodels/member/main/home/member_home_viewmodel.dart';
import 'package:online/presentation/viewmodels/member/memberregristation/member_regristation_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  initializeDateFormatting("id_ID", null).then((_) => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CreditRequestViewmodel()),
          ChangeNotifierProvider(
              create: (_) => IdentityCardVerificationViewmodel()),
          ChangeNotifierProvider(
              create: (_) => PersonalDataVerificationViewmodel()),
          ChangeNotifierProvider(create: (_) => HomeViewmodel()),
          ChangeNotifierProvider(create: (_) => MemberHomeViewmodel()),
          ChangeNotifierProvider(create: (_) => AuthViewmodel()),
          ChangeNotifierProvider(create: (_) => MemberRegristationViewmodel()),
          ChangeNotifierProvider(create: (_) => NavigationViewmodel()),
          ChangeNotifierProvider(create: (_) => BankAccountViewModel()),
        ],
        child: MyApp(),
      )));
}
