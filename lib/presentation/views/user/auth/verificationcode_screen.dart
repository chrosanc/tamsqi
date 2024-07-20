import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/strings.dart';
import 'package:online/presentation/views/user/verification/personal_data_verification_screen.dart';

class VerificationcodeScreen extends StatefulWidget {
  const VerificationcodeScreen({ Key? key }) : super(key: key);

  @override
  _VerificationcodeScreenState createState() => _VerificationcodeScreenState();
}

class _VerificationcodeScreenState extends State<VerificationcodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verifikasi'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Masukkan Kode Verifikasi' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: appTheme.colorScheme.primary),),
              const SizedBox(height: 15,),
              Text('Kode verifikasi telah dikirim melalui SMS / Whatsapp', style: TextStyle(fontSize: 16, color: Colors.grey), textAlign: TextAlign.center,),
              const SizedBox(height: 45,),
              OtpTextField(
                numberOfFields: 6,
                borderColor: Colors.grey,
                focusedBorderColor: appTheme.colorScheme.primary,
                onCodeChanged: (String code){
          
                },
                onSubmit: (String verificationCode) {
          
                },
              ),
              const SizedBox(height: 60,),
              Text('Tidak Menerima OTP?', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
              Text('Kirim Ulang', style: TextStyle(fontSize: 16, color: Colors.grey), textAlign: TextAlign.center,),
              SizedBox(height: 170,),
          
              ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> VerificationpersonaldataScreen()));
              }, child: Text(AppStrings.berikutnya, style: appTheme.textTheme.labelMedium,)),
          
          
          
            ],
          ),
        ),
      ),
    );
  }
}