import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/core/constants/strings.dart';
import 'package:online/presentation/views/user/verification/identity_card_verification_screen.dart';
import 'package:online/presentation/widget/form/form_widget.dart';
import 'package:online/presentation/widget/imagepicker/imagepickercard_widget.dart';
import 'package:online/presentation/widget/stepindicator/stepindicator_widget.dart';

class VerificationpersonaldataScreen extends StatefulWidget {
  const VerificationpersonaldataScreen({ Key? key }) : super(key: key);

  @override
  _VerificationpersonaldataScreenState createState() => _VerificationpersonaldataScreenState();
}

class _VerificationpersonaldataScreenState extends State<VerificationpersonaldataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pribadi'),
        automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
          child: Column(
            children: [
              StepProgressIndicator(currentStep: 1),
              const SizedBox(height: 24,),
              FormWidget(
                title: 'Data Pribadi',
                enabled: false,
                hintText: 'Latar Belakang Pendidikan',
                onTap: (){
          
                },
                suffixIcon: Center(child: SvgPicture.asset(ImageAssets.arrow_down, width: 24,)),
              ),
              const SizedBox(height: 16,),
              FormWidget(
                hintText: 'Email',
              ),
              const SizedBox(height: 16,),
              FormWidget(
                hintText: 'Status Pernikahan',
                enabled: false,
                suffixIcon: Center(child: SvgPicture.asset(ImageAssets.arrow_down, width: 24,)),
              ),
              const SizedBox(height: 16,),
              FormWidget(
                hintText: 'Nama Ibu Kandung',
              ),
              const SizedBox(height: 16,),
              FormWidget(
                hintText: 'Alasan Peminjaman',
                enabled: false,
                suffixIcon: Center(child: SvgPicture.asset(ImageAssets.arrow_down, width: 24,)),
              ),
              const SizedBox(height: 16,),
              FormWidget(
                hintText: 'Apakah Anda punya kendaraan?',
                enabled: false,
                suffixIcon: Center(child: SvgPicture.asset(ImageAssets.arrow_down, width: 24,)),
              ),
              const SizedBox(height: 16,),
              FormWidget(
                hintText: 'Apakah Anda punya tempat tinggal?',
                enabled: false,
                suffixIcon: Center(child: SvgPicture.asset(ImageAssets.arrow_down, width: 24,)),
              ),
              const SizedBox(height: 16,),
              FormWidget(
                title: 'Kerabat yang dapat dihubungi',
                enabled: false,
                hintText: 'Kerabat',
                onTap: (){
          
                },
                suffixIcon: Center(child: SvgPicture.asset(ImageAssets.arrow_down, width: 24,)),
              ),
              const SizedBox(height: 16,),
              FormWidget(
                hintText: 'No. Telepon',
              ),
              const SizedBox(height: 16,),
          
              FormWidget(
                title: 'Informasi Pekerjaan',
                enabled: false,
                hintText: 'Kerjaan',
                onTap: (){
          
                },
                suffixIcon: Center(child: SvgPicture.asset(ImageAssets.arrow_down, width: 24,)),
              ),
          
              const SizedBox(height: 16,),
          
              FormWidget(
                title: 'Nama Perusahaan',
                hintText: 'Contoh : PT. ABC XYZ',
                onTap: (){
          
                },
              ),
              const SizedBox(height: 16,),
              ImagepickercardWidget(
                title: 'Upload Foto Perusahaan',
                onTap: () {

                },
                icon: Icon(Icons.upload_file)),
              
              const SizedBox(height: 16,),
              FormWidget(
                title: 'Periode Mulai Bekerja',
                enabled: false,
                hintText: 'Pilih Periode',
                onTap: (){
          
                },
                suffixIcon: Center(child: SvgPicture.asset(ImageAssets.arrow_down, width: 24,)),
              ),
              const SizedBox(height: 16,),
              FormWidget(
                title: 'Jabatan',
                
              ),

              const SizedBox(height: 16,),
              
              FormWidget(
                title: 'Alamat Perusahaan',
                
              ),
              const SizedBox(height: 16,),

              FormWidget(
                title: 'Nomor Telepon Perusahaan',
                
              ),
              const SizedBox(height: 16,),

              FormWidget(
                title: 'Pendapatan Bersih Perbulan',
                hintText: 'Rp.',

              ),
              const SizedBox(height: 16,),

              FormWidget(
                title: 'Pendapatan Lainnya (Optional)',
                hintText: 'Rp.',
              ),
              const SizedBox(height: 16,),

              FormWidget(
                title: 'Apakah Anda memiliki Pinjaman Lainnya?',
                enabled: false,
                hintText: 'Pilih Opsi',
                onTap: (){
          
                },
                suffixIcon: Center(child: SvgPicture.asset(ImageAssets.arrow_down, width: 24,)),
              ),

              const SizedBox(height: 16,),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationidentitycardScreen()));
                }, 
                child: Text(AppStrings.berikutnya, style: appTheme.textTheme.labelMedium,))

            ],
          ),
        )),
    );
  }
}