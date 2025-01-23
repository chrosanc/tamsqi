import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/core/constants/strings.dart';
import 'package:online/presentation/viewmodels/main/credit/credit_request_viewmodel.dart';
import 'package:online/presentation/widget/card/formcard_widget.dart';
import 'package:online/presentation/widget/form/form_widget.dart';
import 'package:online/presentation/widget/modal/bank_selection_modal.dart';
import 'package:provider/provider.dart';

class AccountnumberScreen extends StatelessWidget {
  const AccountnumberScreen({super.key});

  void _showBankSelectionModal(BuildContext context, CreditRequestViewmodel viewModel) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BankSelectionModal(
          onBankSelected: (bank) {
            viewModel.selectBank(bank);
            viewModel.bankController.text = bank;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CreditRequestViewmodel>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Rekening Bank'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
              child:  Column(
                children: [
                  FormcardWidget(
                    child: Column(
                      children: [
                        Text(AppStrings.norek_description, style: appTheme.textTheme.bodyMedium,),
                        const SizedBox(height: 16,),
                        FormWidget(
                          controller: viewModel.nameController,
                          hintText: 'Nama Rekening',
                        ),
                        const SizedBox(height: 16,),
                        FormWidget(
                          enabled: false,
                          controller: viewModel.bankController,
                          onTap: () => _showBankSelectionModal(context, viewModel),
                          suffixIcon: Center(child: SvgPicture.asset(ImageAssets.arrow_right, width: 24, colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),),),
                          hintText: 'Bank',
                        ),
                        const SizedBox(height: 16,),
                        FormWidget(
                          controller: viewModel.rekeningNumberController,
                          hintText: 'No. Rekening',
                        ),
                      ],
                    )
                  ),
                  const SizedBox(height: 24,),
                  ElevatedButton(
                    onPressed: () async {
                      await viewModel.saveData();
                      Navigator.pop(context);
                    },
                    child: Text('Simpan', style: appTheme.textTheme.labelMedium,),
                  )
                ],
              )
      )
    );
  }
}
