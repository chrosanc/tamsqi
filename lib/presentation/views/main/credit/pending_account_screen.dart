import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';

class PendingAccountScreen extends StatelessWidget {
  const PendingAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pinjam Sekarang'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.access_time,
                size: 80,
                color: appTheme.colorScheme.primary,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Status Pinjaman Anda sedang dalam Proses, silahkan tunggu notifikasi dari Admin.',
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
