import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online/app/routes.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/core/constants/strings.dart';
import 'package:online/core/utils/currency_utils.dart';
import 'package:online/data/models/binderbyte_model.dart';
import 'package:online/presentation/viewmodels/member/memberregristation/member_regristation_viewmodel.dart';
import 'package:online/presentation/widget/form/form_widget.dart';
import 'package:online/presentation/widget/modal/member_registration_modals.dart';
import 'package:provider/provider.dart';

class MemberRegistrationScreen extends StatefulWidget {
  const MemberRegistrationScreen({super.key});

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
                      onTap: () async {
                        Province? selectedProvince =
                            await MemberRegistrationModals()
                                .provinceModal(context);
                        if (selectedProvince != null) {
                          viewModel.setProvince(
                              selectedProvince.name, selectedProvince.id);
                        }
                      },
                      enabled: false,
                      suffixIcon: Center(
                          child: SvgPicture.asset(ImageAssets.arrow_down,
                              width: 24, height: 24)),
                      hintText: AppStrings.provinsi,
                      controller: viewModel.provinceController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    //Form  Kota / Kabupaten
                    FormWidget(
                      enabled: false,
                      onTap: () async {
                        if (viewModel.selectedProvinceId != null) {
                          Regency? selectedRegency =
                              await MemberRegistrationModals().regencyModal(
                                  context, viewModel.selectedProvinceId!);
                          if (selectedRegency != null) {
                            viewModel.setRegency(
                                selectedRegency.name, selectedRegency.id);
                          }
                        }
                      },
                      suffixIcon: Center(
                          child: SvgPicture.asset(ImageAssets.arrow_down,
                              width: 24, height: 24)),
                      hintText: AppStrings.kota,
                      controller: viewModel.regencyController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    //Form Kecamatan
                    FormWidget(
                      enabled: false,
                      onTap: () async {
                        if (viewModel.selectedRegencyId != null) {
                          SubDistrict? selectedSubDistrict =
                              await MemberRegistrationModals().subDistrictModal(
                                  context, viewModel.selectedRegencyId!);
                          if (selectedSubDistrict != null) {
                            viewModel.setSubDistrict(selectedSubDistrict.name,
                                selectedSubDistrict.id);
                          }
                        }
                      },
                      suffixIcon: Center(
                          child: SvgPicture.asset(ImageAssets.arrow_down,
                              width: 24, height: 24)),
                      hintText: AppStrings.kecamatan,
                      controller: viewModel.subDistrictController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    // Desa
                    FormWidget(
                      enabled: false,
                      onTap: () async {
                        if (viewModel.selectedSubDistrictId != null) {
                          Village? selectedVillage =
                              await MemberRegistrationModals().villageModal(
                                  context, viewModel.selectedSubDistrictId!);
                          if (selectedVillage != null) {
                            viewModel.setVillage(selectedVillage.name);
                          }
                        }
                      },
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
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        CurrencyInputFormatter()
                      ],
                      title: 'Rencana Pembiayaan',
                      hintText: AppStrings.rp,
                      controller: viewModel.paymentPlanController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormWidget(
                      enabled: false,
                      onTap: () async {
                        String? selectedPaymentProduct =
                            await MemberRegistrationModals()
                                .paymentProductModal(context);
                        viewModel.setPaymentProduct(selectedPaymentProduct!);
                      },
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
                      onTap: () async {
                        String? selectedBusinessData =
                            await MemberRegistrationModals()
                                .businessDataModal(context);
                        viewModel.setbusinessData(selectedBusinessData!);
                      },
                      suffixIcon: Center(
                          child: SvgPicture.asset(ImageAssets.arrow_down,
                              width: 24, height: 24)),
                      title: 'Data Usaha',
                      hintText: 'Usaha',
                      controller: viewModel.businessDataController,
                    ),

                    const SizedBox(
                      height: 16,
                    ),


                    FormWidget(
                      enabled: true,
                      title: 'Kantor',
                      hintText: 'Kantor',
                      controller: viewModel.officeController,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: ElevatedButton(
                  onPressed: () async {
                    if (viewModel.checkEmpty()) {
                      bool isSuccess = await viewModel.addAnggota(context);
                      if (isSuccess) {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.member_registration_success,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Registrasi Member Gagal')));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Silahkan isi Form terlebih dahulu')));
                    }
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
