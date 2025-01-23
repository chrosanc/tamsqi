import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/core/utils/currency_utils.dart';
import 'package:online/presentation/viewmodels/main/credit/credit_request_viewmodel.dart';
import 'package:online/presentation/viewmodels/main/home/home_viewmodel.dart';
import 'package:online/presentation/views/success/success_screen.dart';
import 'package:online/presentation/widget/card/formcard_widget.dart';
import 'package:online/presentation/widget/form/dropdown_widget.dart';
import 'package:online/presentation/widget/form/form_widget.dart';
import 'package:online/presentation/widget/header/approvalheader_card.dart';
import 'package:provider/provider.dart';

import 'bank_account_screen.dart';

const List<String> periods = <String>['3 Bulan', '6 Bulan', '12 Bulan'];

class CreditAcceptedScreen extends StatefulWidget {
  const CreditAcceptedScreen({super.key});

  @override
  _CreditAcceptedScreenState createState() => _CreditAcceptedScreenState();
}

class _CreditAcceptedScreenState extends State<CreditAcceptedScreen> {
  String selectedPeriod = periods.first;
  String monthText = 'Bulan';
  double sliderValue = 400000;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CreditRequestViewmodel>(context);
    final homeViewModel = Provider.of<HomeViewmodel>(context);
    final limit =
        double.tryParse(homeViewModel.userData!.limitPinjaman!)!.toInt();
    const int minCredit = 400000;
    final int maxCredit = limit;

    int interest = ((sliderValue * 5) / 100).toInt();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pinjam Sekarang'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 24),
        child: Column(
          children: [
            ApprovalheaderCard(
              limit: CurrencyUtils().currencyFormat(limit),
            ),
            const SizedBox(height: 27),
            _buildCreditPeriodSection(minCredit, maxCredit),
            const SizedBox(height: 20),
            _buildAccountNumberSection(),
            const SizedBox(height: 20),
            _buildTotalPaymentSection(interest),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool isSuccess = await viewModel.submitCredit(
                    context,
                    interest.toString(),
                    sliderValue.toString(),
                    selectedPeriod);

                if (isSuccess && context.mounted) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const SuccessScreen(
                              title: 'Sukses',
                              subtitle: 'Harap tunggu proses pengajuan')));
                } else {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Pengajuan Gagal. Silahkan coba lagi")));
                  }
                }
              },
              child: Text(
                'Ajukan Sekarang',
                style: appTheme.textTheme.labelMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  FormcardWidget _buildTotalPaymentSection(int interest) {
    int? selectedPeriodValue = int.tryParse(selectedPeriod.split(' ')[0]);
    double monthlyPayment = selectedPeriodValue != null
        ? (interest + sliderValue) / selectedPeriodValue
        : 0;
    return FormcardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Jumlah Pembayaran', style: appTheme.textTheme.titleSmall),
          const SizedBox(height: 9),
          _buildDetailRow('Pinjaman', 'Rp. ${sliderValue.toInt()}'),
          const SizedBox(height: 5),
          _buildDetailRow('Bunga', 'Rp. $interest'),
          const SizedBox(height: 5),
          _buildDetailRow('Total', 'Rp. ${(interest + sliderValue).toInt()}'),
          const SizedBox(height: 5),
          _buildDetailRow(
            'Pembayaran per bulan',
            selectedPeriodValue != null
                ? 'Rp. ${monthlyPayment.toInt()}'
                : 'Rp. -',
          ),
        ],
      ),
    );
  }

  Row _buildDetailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: appTheme.textTheme.bodySmall),
        Text(value, style: appTheme.textTheme.bodySmall),
      ],
    );
  }

  FormcardWidget _buildAccountNumberSection() {
    final viewModel = Provider.of<CreditRequestViewmodel>(context);

    return FormcardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nomor Rekening', style: appTheme.textTheme.titleSmall),
          const SizedBox(height: 10),
          FormWidget(
            keyboardType: TextInputType.multiline,
            controller: viewModel.rekeningBankController,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountnumberScreen()),
              );
            },
            enabled: false,
            hintText: 'Pilih Nomor Rekening',
            suffixIcon: Center(
              child: SvgPicture.asset(
                ImageAssets.arrow_right,
                width: 24,
                colorFilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
    );
  }

  FormcardWidget _buildCreditPeriodSection(int minCredit, int maxCredit) {
    return FormcardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Periode Pinjaman', style: appTheme.textTheme.titleSmall),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDropdown('Periode', periods, selectedPeriod,
                  (String? newValue) {
                setState(() {
                  selectedPeriod = newValue!;
                });
              }),
            ],
          ),
          const SizedBox(height: 26),
          Text('Jumlah Pinjaman', style: appTheme.textTheme.titleSmall),
          const SizedBox(height: 12),
          Center(
            child: Text(
              CurrencyUtils().currencyFormat(sliderValue.toInt()),
              style: appTheme.textTheme.titleMedium,
            ),
          ),
          Slider(
            inactiveColor: Colors.grey,
            value: sliderValue,
            min: minCredit.toDouble(),
            max: maxCredit.toDouble(),
            divisions: (maxCredit - minCredit) ~/ 100000,
            label: CurrencyUtils().currencyFormat(sliderValue.toInt()),
            onChanged: (value) {
              setState(() {
                sliderValue = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rp. $minCredit', style: appTheme.textTheme.bodySmall),
              Text('Rp. $maxCredit', style: appTheme.textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _buildDropdown(
    String label,
    List<String> items,
    String value,
    ValueChanged<String?> onChanged,
  ) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDropdown(value: value, items: items, onChanged: onChanged),
        ],
      ),
    );
  }
}
