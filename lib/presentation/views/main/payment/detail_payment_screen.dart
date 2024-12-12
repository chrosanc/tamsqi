import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';
import 'package:online/presentation/views/main/payment/payment_list_screen.dart';
import 'package:online/presentation/widget/card/formcard_widget.dart';

class DetailPaymentScreen extends StatelessWidget {
  const DetailPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pinjaman'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jumlah yang harus dibayar perbulan',
                        style: appTheme.textTheme.bodyMedium,
                      ),
                      Row(
                        children: [
                          Text(
                            '13.666.666',
                            style: appTheme.textTheme.titleLarge,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('1/6 Bulan')
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Batas Waktu Pembayaran',
                            style: TextStyle(color: Colors.red),
                          ),
                          Text(
                            '13 Juli 2024',
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                FormcardWidget(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Pinjaman',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Kode Pinjaman',
                            style: appTheme.textTheme.bodySmall),
                        Text('76HG5AANKJ')
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tanggal Pinjaman',
                            style: appTheme.textTheme.bodySmall),
                        Text('13 Juni 2024, 20:59 WIB')
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Status Pinjaman',
                            style: appTheme.textTheme.bodySmall),
                        Text('Dalam Proses Verifikasi')
                      ],
                    )
                  ],
                )),
                const SizedBox(
                  height: 30,
                ),
                FormcardWidget(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rincian Biaya',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Jumlah Pinjaman',
                            style: appTheme.textTheme.bodySmall),
                        Text('80.000.000')
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Bunga', style: appTheme.textTheme.bodySmall),
                        Text('2.000.000')
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Periode Pinjaman',
                            style: appTheme.textTheme.bodySmall),
                        Text('6 Bulan')
                      ],
                    )
                  ],
                )),
                const SizedBox(
                  height: 30,
                ),
                FormcardWidget(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kode Kantor',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Kode Kantor',
                            style: appTheme.textTheme.bodySmall),
                        Text('76HG5AANKJ')
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tanggal Alamat',
                            style: appTheme.textTheme.bodySmall),
                        Text('13 Juni 2024, 20:59 WIB')
                      ],
                    ),
                  ],
                )),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentListScreen()));
                    },
                    child: Text(
                      'Bayar',
                      style: appTheme.textTheme.labelMedium,
                    ))
              ]),
        ),
      ),
    );
  }
}
