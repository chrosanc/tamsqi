import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/strings.dart';
import 'package:online/presentation/views/auth/verificationtype_screen.dart';
import 'package:online/presentation/widget/form/form_widget.dart';
import 'package:provider/provider.dart';
import 'package:online/presentation/viewmodels/auth/auth_viewmodel.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AuthViewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                     FormWidget(
                      title: 'Nama Pengguna',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                     FormWidget(
                       title: 'Email',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                     FormWidget(
                       title: 'Nomor Telepon',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    FormWidget(
                      title: 'Password',
                      hintText: 'Password',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerificationtypeScreen(),
                    ),
                  );
                },
                child: Text(
                  AppStrings.berikutnya,
                  style: appTheme.textTheme.labelMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
