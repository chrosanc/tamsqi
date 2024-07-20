import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/strings.dart';
import 'package:online/presentation/views/user/auth/verificationtype_screen.dart';
import 'package:online/presentation/widget/form/form_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar'),
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
                    const SizedBox(height: 24,),
                    FormWidget(
                      title: 'Email',
                    ),
                    const SizedBox(height: 24,),
                    FormWidget(
                      title: 'Nomor Telepon',
                    ),
                    const SizedBox(height: 24,),
                    FormWidget(
                      title: 'Password',
                    ),
                    const SizedBox(height: 24,),
                    FormWidget(
                      title: 'Konfirmasi Password',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationtypeScreen()));
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
