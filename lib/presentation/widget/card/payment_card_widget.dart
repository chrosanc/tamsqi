import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/image_assets.dart';
import 'package:online/presentation/views/main/payment/detail_payment_screen.dart';

class PaymentCardWidget extends StatelessWidget {
  final Function()? onClick;

  const PaymentCardWidget({Key? key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 174,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(15),
                blurRadius: 12,
                offset: const Offset(0, 4))
          ],
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jumlah Pinjaman',
                        style: appTheme.textTheme.bodySmall),
                    Text('Rp.5000000', style: appTheme.textTheme.titleSmall),
                    const SizedBox(
                      height: 16,
                    ),
                    Text('Periode Pinjaman',
                        style: appTheme.textTheme.bodySmall),
                    Text('6 Bulan', style: appTheme.textTheme.titleSmall),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Status Pinjaman',
                        style: appTheme.textTheme.bodySmall),
                    Text('Dalam Proses Verifikasi',
                        style: appTheme.textTheme.titleSmall),
                    const SizedBox(
                      height: 16,
                    ),
                    Text('Kode Pinjaman', style: appTheme.textTheme.bodySmall),
                    Text('76HG5AANKJ', style: appTheme.textTheme.titleSmall),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.withAlpha(50),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetailPaymentScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Detail Pinjaman', style: appTheme.textTheme.titleSmall),
                  SvgPicture.asset(ImageAssets.arrow_right)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
