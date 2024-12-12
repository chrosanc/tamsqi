import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';
import 'package:online/presentation/views/auth/verificationcode_screen.dart';

class VerificationtypeScreen extends StatefulWidget {
  const VerificationtypeScreen({ Key? key }) : super(key: key);

  @override
  _VerificationtypeScreenState createState() => _VerificationtypeScreenState();
}

class _VerificationtypeScreenState extends State<VerificationtypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verifikasi'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              const SizedBox(height: 12,),
            Text('Pilih Metode' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: appTheme.colorScheme.primary),),
            const SizedBox(height: 15,),
            Text('Anda dapat memilih metode untuk mendapatkan OTP', style: TextStyle(fontSize: 16, color: Colors.grey), textAlign: TextAlign.center,),
            const SizedBox(height: 24,),
          
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> VerificationcodeScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: appTheme.colorScheme.primary
                  ),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
                  child: Text('Whatsapp'),
                ),
              ),
            ),

            const SizedBox(height: 16,),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> VerificationcodeScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: appTheme.colorScheme.primary
                  ),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
                  child: Text('SMS'),
                ),
              ),
            ),


          ],),
        ),
      ),
      
    );
  }
}