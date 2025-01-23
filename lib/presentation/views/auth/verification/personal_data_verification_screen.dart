import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/core/constants/strings.dart';
import 'package:online/core/utils/currency_utils.dart';
import 'package:online/presentation/viewmodels/auth/personal_data_verification_viewmodel.dart';
import 'package:online/presentation/views/auth/verification/identity_card_verification_screen.dart';
import 'package:online/presentation/widget/form/form_widget.dart';
import 'package:online/presentation/widget/imagepicker/imagepickercard_widget.dart';
import 'package:online/presentation/widget/stepindicator/stepindicator_widget.dart';
import 'package:provider/provider.dart';

class VerificationpersonaldataScreen extends StatefulWidget {
  const VerificationpersonaldataScreen({super.key});

  @override
  _VerificationpersonaldataScreenState createState() =>
      _VerificationpersonaldataScreenState();
}

class _VerificationpersonaldataScreenState
    extends State<VerificationpersonaldataScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PersonalDataVerificationViewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pribadi'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
        child: Column(
          children: [
            const StepProgressIndicator(currentStep: 1),
            const SizedBox(
              height: 24,
            ),
            FormWidget(
              title: 'Data Pribadi',
              enabled: false,
              controller: viewModel.edcucationBackgroundController,
              hintText: 'Latar Belakang Pendidikan',
              onTap: () async {
                await viewModel.selectEducationBackground(context);
              },
              suffixIcon: Center(
                  child: SvgPicture.asset(
                ImageAssets.arrow_down,
                width: 24,
              )),
            ),
            const SizedBox(
              height: 16,
            ),
            FormWidget(
              controller: viewModel.emailController,
              hintText: 'Email',
            ),
            const SizedBox(
              height: 16,
            ),
            FormWidget(
              hintText: 'Status Pernikahan',
              enabled: false,
              controller: viewModel.marriageController,
              onTap: () async {
                viewModel.selectMarriage(context);
              },
              suffixIcon: Center(
                  child: SvgPicture.asset(
                ImageAssets.arrow_down,
                width: 24,
              )),
            ),
            const SizedBox(
              height: 16,
            ),
            FormWidget(
              controller: viewModel.motherNameController,
              hintText: 'Nama Ibu Kandung',
            ),
            const SizedBox(
              height: 16,
            ),
            FormWidget(
              controller: viewModel.creditReasonController,
              onTap: () {
                viewModel.selectReason(context);
              },
              hintText: 'Alasan Peminjaman',
              enabled: false,
              suffixIcon: Center(
                  child: SvgPicture.asset(
                ImageAssets.arrow_down,
                width: 24,
              )),
            ),
            const SizedBox(
              height: 16,
            ),
            FormWidget(
              hintText: 'Apakah Anda punya kendaraan?',
              controller: viewModel.vehicleController,
              onTap: () {
                viewModel.selectVehicle(context);
              },
              enabled: false,
              suffixIcon: Center(
                  child: SvgPicture.asset(
                ImageAssets.arrow_down,
                width: 24,
              )),
            ),
            const SizedBox(
              height: 16,
            ),
            FormWidget(
              controller: viewModel.houseController,
              onTap: () {
                viewModel.selectPlace(context);
              },
              hintText: 'Apakah Anda punya tempat tinggal?',
              enabled: false,
              suffixIcon: Center(
                  child: SvgPicture.asset(
                ImageAssets.arrow_down,
                width: 24,
              )),
            ),
            const SizedBox(
              height: 16,
            ),
            FormWidget(
              controller: viewModel.relationsController,
              title: 'Kerabat yang dapat dihubungi',
              enabled: false,
              hintText: 'Kerabat',
              onTap: () {
                viewModel.selectRelations(context);
              },
              suffixIcon: Center(
                  child: SvgPicture.asset(
                ImageAssets.arrow_down,
                width: 24,
              )),
            ),
            const SizedBox(
              height: 16,
            ),
            FormWidget(
              keyboardType: TextInputType.phone,
              controller: viewModel.relationsPhoneNumberController,
              hintText: 'No. Telepon',
            ),
            const SizedBox(
              height: 16,
            ),
            FormWidget(
              title: 'Informasi Pekerjaan',
              controller: viewModel.workController,
              enabled: false,
              hintText: 'Kerjaan',
              onTap: () {
                viewModel.selectWork(context);
              },
              suffixIcon: Center(
                  child: SvgPicture.asset(
                ImageAssets.arrow_down,
                width: 24,
              )),
            ),
            const SizedBox(
              height: 16,
            ),
            FormWidget(
              title: 'Nama Perusahaan',
              hintText: 'Contoh : PT. ABC XYZ',
              controller: viewModel.businessNameController,
            ),
            const SizedBox(
              height: 16,
            ),
            ImagepickercardWidget(
                title: 'Upload Foto Perusahaan',
                image: viewModel.image,
                onTap: () {
                  viewModel.selectBusinessPhoto(context);
                },
                icon: const Icon(Icons.upload_file)),
            const SizedBox(
              height: 16,
            ),
            FormWidget(
              controller: viewModel.periodStartWorkController,
              title: 'Periode Mulai Bekerja',
              enabled: false,
              hintText: 'Pilih Periode',
              onTap: () {
                viewModel.selectWorkPeriod(context);
              },
              suffixIcon: Center(
                  child: SvgPicture.asset(
                ImageAssets.arrow_down,
                width: 24,
              )),
            ),
            const SizedBox(
              height: 16,
            ),
            FormWidget(
                title: 'Jabatan', controller: viewModel.jobPositionController),
            const SizedBox(
              height: 16,
            ),
            FormWidget(
              title: 'Alamat Perusahaan',
              controller: viewModel.workAddressController,
            ),
            const SizedBox(
              height: 16,
            ),
            FormWidget(
              title: 'Nomor Telepon Perusahaan',
              controller: viewModel.businessPhoneNumberController,
            ),
            const SizedBox(
              height: 16,
            ),
            FormWidget(
              inputFormatters: [CurrencyInputFormatter()],
              controller: viewModel.workSalaryPerMonthController,
              title: 'Pendapatan Bersih Perbulan',
              keyboardType: TextInputType.number,
              hintText: 'Rp.',
            ),
            const SizedBox(
              height: 16,
            ),
            FormWidget(
              inputFormatters: [CurrencyInputFormatter()],
              controller: viewModel.otherSalaryController,
              title: 'Pendapatan Lainnya (Optional)',
              hintText: 'Rp.',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 16,
            ),
            FormWidget(
              title: 'Apakah Anda memiliki Pinjaman Lainnya?',
              enabled: false,
              hintText: 'Pilih Opsi',
              controller: viewModel.otherCreditController,
              onTap: () {
                viewModel.selectOtherCredit(context);
              },
              suffixIcon: Center(
                  child: SvgPicture.asset(
                ImageAssets.arrow_down,
                width: 24,
              )),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () async {
                  bool isSuccess = await viewModel.uploadPersonalData(context);
                  if (isSuccess) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const VerificationidentitycardScreen()));
                  }
                },
                child: Text(
                  AppStrings.berikutnya,
                  style: appTheme.textTheme.labelMedium,
                ))
          ],
        ),
      )),
    );
  }
}
