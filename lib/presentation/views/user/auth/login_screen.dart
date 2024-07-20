import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/presentation/views/user/auth/register_screen.dart';
import 'package:online/presentation/widget/form/form_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Masuk'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset(ImageAssets.appIcon),
              const SizedBox(height: 70,),
              Text('Masuk ke Akun Anda', style: appTheme.textTheme.titleMedium,),
              const SizedBox(height: 12,),
              FormWidget(
                hintText: 'Email / Nama / No. Handphone',
                ),
                const SizedBox(height: 12,),
              FormWidget(
                hintText: 'Password',
                obscureText: true,
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
              const SizedBox(height: 12,),
              Text('Lupa Password', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
              const SizedBox(height: 109,),
              ElevatedButton(onPressed: (){
            
              }, child: Text('Masuk', style: appTheme.textTheme.labelMedium,)),
              const SizedBox(height: 39,),
              RichText(
              text: TextSpan(
                text: 'Belum Punya akun? ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                children: [
                  WidgetSpan(
                    child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
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
            
            ],),
          ),
        ),
      ),
      
    );
  }
}