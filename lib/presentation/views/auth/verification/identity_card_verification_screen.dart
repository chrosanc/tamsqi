import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/strings.dart';
import 'package:online/presentation/viewmodels/auth/identity_card_verification_viewmodel.dart';
import 'package:online/presentation/views/auth/verification/face_verification_screen.dart';
import 'package:online/presentation/widget/form/form_widget.dart';
import 'package:online/presentation/widget/imagepicker/imagepickercard_widget.dart';
import 'package:online/presentation/widget/stepindicator/stepindicator_widget.dart';
import 'package:provider/provider.dart';

class VerificationidentitycardScreen extends StatefulWidget {
  const VerificationidentitycardScreen({Key? key}) : super(key: key);

  @override
  _VerificationidentitycardScreenState createState() =>
      _VerificationidentitycardScreenState();
}

class _VerificationidentitycardScreenState
    extends State<VerificationidentitycardScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<IdentityCardVerificationViewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pribadi'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StepProgressIndicator(currentStep: 2),
              const SizedBox(
                height: 35,
              ),
              Text(
                'Unggah Detail KTP',
                style: appTheme.textTheme.titleMedium,
              ),
              Text(
                'Pastikan foto yang Anda upload terlihat jelas',
                style: appTheme.textTheme.bodyMedium,
              ),
              ImagepickercardWidget(
                  image: viewModel.idCardImage,
                  icon: Icon(Icons.upload_file),
                  onTap: () {
                    viewModel.pickIdCardPhoto(context);
                  }),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Unggah Foto Selfie KTP',
                style: appTheme.textTheme.titleMedium,
              ),
              ImagepickercardWidget(
                  image: viewModel.idCardSelfieImage,
                  icon: Icon(Icons.upload_file),
                  onTap: () {
                    viewModel.pickIdCardSelfiePhoto(context);
                  }),
              const SizedBox(
                height: 16,
              ),
              FormWidget(
                title: 'NIK',
                controller: viewModel.nikController,
              ),
              const SizedBox(
                height: 16,
              ),
              FormWidget(
                title: 'Nama (Sesuai KTP)',
                controller: viewModel.nameController,
              ),
              const SizedBox(
                height: 16,
              ),
              FormWidget(
                title: 'Tempat, Tanggal Lahir (Sesuai KTP)',
                controller: viewModel.placeAndBirthDateController,
              ),
              const SizedBox(
                height: 16,
              ),
              FormWidget(
                title: 'Jenis Kelamin (Sesuai KTP)',
                controller: viewModel.genderController,
              ),
              const SizedBox(
                height: 16,
              ),
              FormWidget(
                title: 'Alamat (Sesuai KTP)',
                controller: viewModel.addressController,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () async {
                    bool isSuccess =
                        await viewModel.submitIdentityCard(context);
                    if (isSuccess) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FaceverificationScreen()));
                    }
                  },
                  child: Text(
                    AppStrings.berikutnya,
                    style: appTheme.textTheme.labelMedium,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
