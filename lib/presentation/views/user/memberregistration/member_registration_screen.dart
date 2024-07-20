import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/core/constants/strings.dart';
import 'package:online/presentation/views/user/viewmodels/memberregristation/member_regristation_viewmodel.dart';
import 'package:online/presentation/views/success/success_screen.dart';
import 'package:online/presentation/widget/form/form_widget.dart';
import 'package:online/presentation/widget/modal/member_registration_modals.dart';
import 'package:provider/provider.dart';

class MemberRegistrationScreen extends StatefulWidget {
  const MemberRegistrationScreen({Key? key}) : super(key: key);

  @override
  _MemberRegistrationScreenState createState() =>
      _MemberRegistrationScreenState();
}

class _MemberRegistrationScreenState extends State<MemberRegistrationScreen> {

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MemberRegristationViewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.daftar_anggota),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              elevation: 7,
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                child: Column(
                  children: [
                    FormWidget(
                      hintText: AppStrings.nama_lengkap,
                      controller: viewModel.nameController,
                    ),
                    const SizedBox(height: 16),
                    FormWidget(
                      hintText: AppStrings.nomer_hp,
                      controller: viewModel.phoneNumberController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    //Form Provinsi
                    FormWidget(
                      enabled: false,
                      suffixIcon: Center(
                          child: SvgPicture.asset(ImageAssets.arrow_down,
                              width: 24, height: 24)),
                     onTap: () async {
                        final selectedProvince = await MemberRegistrationModals().provinceModal(context);
                        if (selectedProvince != null) {
                          viewModel.setProvince(selectedProvince);
                        }
                      },

                      hintText: AppStrings.provinsi,
                      controller: viewModel.provinceController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    //Form  Kota / Kabupaten
                    FormWidget(
                      onTap: (){
                      },
                      enabled: false,
                      suffixIcon: Center(
                          child: SvgPicture.asset(ImageAssets.arrow_down,
                              width: 24, height: 24)),
                      hintText: AppStrings.kota,
                      controller: viewModel.regencyController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormWidget(
                      onTap: (){
                      },
                      enabled: false,
                      suffixIcon: Center(
                          child: SvgPicture.asset(ImageAssets.arrow_down,
                              width: 24, height: 24)),
                      hintText: AppStrings.kecamatan,
                      controller: viewModel.subDistrictController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormWidget(
                      onTap: (){

                      },
                      enabled: false,
                      suffixIcon: Center(
                          child: SvgPicture.asset(ImageAssets.arrow_down,
                              width: 24, height: 24)),
                      hintText: AppStrings.desa,
                      controller: viewModel.villageController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormWidget(
                      title: 'Rencana Pembiayaan',
                      hintText: AppStrings.rp,
                      controller: viewModel.paymentPlanController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormWidget(
                      enabled: false,
                      suffixIcon: Center(
                          child: SvgPicture.asset(ImageAssets.arrow_down,
                              width: 24, height: 24)),
                      title: 'Produk Pembiayaan',
                      hintText: '1 Mingguan',
                      controller: viewModel.productPaymentController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormWidget(
                      enabled: false,
                      suffixIcon: Center(
                          child: SvgPicture.asset(ImageAssets.arrow_down,
                              width: 24, height: 24)),
                      title: 'Data Usaha',
                      hintText: 'Usaha',
                      controller: viewModel.businessDataController,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SuccessScreen()), (route) => false,);
                  },
                  child: Text(AppStrings.daftar_anggota,
                      style: appTheme.textTheme.labelMedium)),
            )
          ],
        ),
      ),
    );
  }
}
