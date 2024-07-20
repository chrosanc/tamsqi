import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/core/constants/strings.dart';
import 'package:online/presentation/views/user/main/credit/bank_account_screen.dart';
import 'package:online/presentation/widget/card/formcard_widget.dart';
import 'package:online/presentation/widget/form/dropdown_widget.dart';
import 'package:online/presentation/widget/form/form_widget.dart';
import 'package:online/presentation/widget/header/approvalheader_card.dart';

const List<String> periods = <String>['3', '6', '12'];
const List<String> types = <String>['Tahun', 'Bulan'];

class CreditacceptedScreen extends StatefulWidget {
  const CreditacceptedScreen({ Key? key }) : super(key: key);

  @override
  _CreditacceptedScreenState createState() => _CreditacceptedScreenState();
}

class _CreditacceptedScreenState extends State<CreditacceptedScreen> {
  String selectedPeriod = periods.first;
  String selectedType = types.first;
  double sliderValue = 400000;
  final int minCredit = 400000;
  final int maxCredit = 5000000;
  

  @override
  Widget build(BuildContext context) {
    int interest = ((sliderValue * 10)/100).toInt();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pinjam Sekarang'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 24),
        child: Column(
          children: [
            const ApprovalheaderCard(),
            const SizedBox(height: 27,),
            _creditPeriod(),
            const SizedBox(height: 20,),
            accountNumber(),
            const SizedBox(height: 20,),
            _totalPayment(interest),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
              }, 
              child: Text('Ajukan Sekarang', style: appTheme.textTheme.labelMedium,))
          ],
        ),
      ),
    );
  }

  FormcardWidget _totalPayment(int interest) {
    return FormcardWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Jumlah Pembayaran', style: appTheme.textTheme.titleSmall),
              const SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Pinjaman', style: appTheme.textTheme.bodySmall),
                Text('Rp. ${sliderValue.toInt()}', style: appTheme.textTheme.bodySmall),
              ],),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Bunga', style: appTheme.textTheme.bodySmall),
                Text('Rp. $interest', style: appTheme.textTheme.bodySmall),
              ],),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Total', style: appTheme.textTheme.bodySmall),
                Text('Rp. ${(interest + sliderValue).toInt()}', style: appTheme.textTheme.bodySmall),
              ],),
            ],));
  }

  FormcardWidget accountNumber() {
    return FormcardWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Nomor Rekening', style: appTheme.textTheme.titleSmall),
              const SizedBox(height: 10,),
              FormWidget(
                onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> AccountnumberScreen()));
                },
                enabled: false,
                hintText: 'Pilih Nomor Rekening',
                suffixIcon: Center(child: SvgPicture.asset(ImageAssets.arrow_right, width: 24, colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),)),
              )

            ],)
            );
  }

  FormcardWidget _creditPeriod() {
    return FormcardWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Periode Pinjaman', style: appTheme.textTheme.titleSmall),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomDropdown(
                            value: selectedPeriod,
                            items: periods,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedPeriod = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomDropdown(
                            value: selectedType,
                            items: types,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedType = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 26,),
                Text('Jumlah Pinjaman', style: appTheme.textTheme.titleSmall),
                const SizedBox(height: 12,),
                Center(
                  child: Text('Rp. ${sliderValue.toInt()}', style: appTheme.textTheme.titleMedium,),
                ),
                
                Slider(
                  value: sliderValue,
                  min: minCredit.toDouble(),
                  max: maxCredit.toDouble(), 
                  divisions: (maxCredit - minCredit) ~/ 100000,
                  label: sliderValue.toInt().toString(),
                  onChanged: (value){
                    setState(() {
                      sliderValue = value;
                    });
                  }),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Rp. $minCredit', style: appTheme.textTheme.bodySmall,),
                    Text('Rp. $maxCredit', style: appTheme.textTheme.bodySmall,)
                  ],
                ),
              ],
            ),
          );
  }
}
