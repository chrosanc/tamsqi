import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';

class PaymentCardWidget extends StatelessWidget {
  final String idPinjaman;
  final String tanggalTagihan;
  final String jumlahTagihan;
  final String hariTersisa;
  final bool isChecked;
  final Function(bool?)? onChanged;

  const PaymentCardWidget({super.key,
    required this.idPinjaman,
    required this.tanggalTagihan,
    required this.jumlahTagihan,
    required this.hariTersisa,
    required this.isChecked,
    required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Checkbox(
                            visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                            shape: const CircleBorder(),
                            value: isChecked,
                            onChanged: onChanged),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('ID Pinjaman'),
                          Text(idPinjaman),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Tanggal Tagihan'),
                          Text(tanggalTagihan),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          jumlahTagihan,
                          style: appTheme.textTheme.titleMedium,
                        ),
                        Text(hariTersisa)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
