import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/core/constants/strings.dart';
import 'package:online/presentation/views/user/viewmodels/main/credit/bank_account_viewmodel.dart';
import 'package:online/presentation/widget/card/formcard_widget.dart';
import 'package:online/presentation/widget/form/form_widget.dart';
import 'package:online/presentation/widget/modal/bank_selection_modal.dart';
import 'package:provider/provider.dart';

class AccountnumberScreen extends StatelessWidget {
  const AccountnumberScreen({Key? key}) : super(key: key);

  void _showBankSelectionModal(BuildContext context, BankAccountViewModel viewModel, TextEditingController bankController) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BankSelectionModal(
          onBankSelected: (bank) {
            viewModel.selectBank(bank);
            bankController.text = bank;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController bankController = TextEditingController();

    return ChangeNotifierProvider(
      create: (_) => BankAccountViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rekening Bank'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Consumer<BankAccountViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                children: [
                  FormcardWidget(
                    child: Column(
                      children: [
                        Text(AppStrings.norek_description, style: appTheme.textTheme.bodyMedium,),
                        const SizedBox(height: 16,),
                        FormWidget(
                          hintText: 'Nama Rekening',
                        ),
                        const SizedBox(height: 16,),
                        FormWidget(
                          enabled: false,
                          controller: bankController,
                          onTap: () => _showBankSelectionModal(context, viewModel, bankController),
                          suffixIcon: Center(child: SvgPicture.asset(ImageAssets.arrow_right, width: 24, colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),),),
                          hintText: 'Bank',
                        ),
                        const SizedBox(height: 16,),
                        FormWidget(
                          hintText: 'No. Rekening',
                        ),
                      ],
                    )
                  ),
                  const SizedBox(height: 24,),
                  ElevatedButton(
                    onPressed: () {
                      // Simpan data
                    },
                    child: Text('Simpan', style: appTheme.textTheme.labelMedium,),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
