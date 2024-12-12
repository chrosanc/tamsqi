import 'package:flutter/material.dart';
import 'package:online/app/routes.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/presentation/viewmodels/auth/auth_viewmodel.dart';
import 'package:online/presentation/viewmodels/main/navigation_viewmodel.dart';
import 'package:online/presentation/views/auth/register_screen.dart';
import 'package:online/presentation/widget/form/form_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AuthViewmodel>(context);
    final navigationViewModel = Provider.of<NavigationViewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Masuk'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageAssets.appIcon),
                const SizedBox(
                  height: 70,
                ),
                Text(
                  'Masuk ke Akun Anda',
                  style: appTheme.textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 12,
                ),
                FormWidget(
                  prefixIcon: const Icon(
                    Icons.credit_card,
                    color: Colors.grey,
                  ),
                  controller: viewModel.nomorRekeningController,
                  keyboardType: TextInputType.number,
                  hintText: 'Nomor Rekening',
                ),
                const SizedBox(
                  height: 12,
                ),
                FormWidget(
                  prefixIcon: const Icon(Icons.phone, color: Colors.grey),
                  controller: viewModel.nomorTeleponController,
                  keyboardType: TextInputType.phone,
                  hintText: 'Nomor Telepon',
                ),
                const SizedBox(
                  height: 109,
                ),
                ElevatedButton(
                  onPressed: () async {
                    navigationViewModel.resetIndex();
                    final isSuccess = await viewModel.loginUser(context);
                    if (isSuccess) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.userHome, (route) => false);
                    }
                  },
                  child: Text(
                    'Masuk',
                    style: appTheme.textTheme.labelMedium,
                  ),
                ),
                const SizedBox(
                  height: 39,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Belum Punya akun? ',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterScreen()),
                            );
                          },
                          child: Text(
                            'Daftar Sekarang',
                            style: TextStyle(
                              color: appTheme.colorScheme.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
