import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/utils/currency_utils.dart';
import 'package:online/presentation/viewmodels/main/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class UserPaymentScreen extends HookWidget {
  const UserPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewmodel>(context);
    final credit = viewModel.userCredit;
    final userData = viewModel.userData;
    final pinjaman = double.tryParse(credit?.jumlahPinjaman ?? '0') ?? 0;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.getUser(context);
      });
      return null;
    }, []);


    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Pinjaman')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Pinjaman',
              style: appTheme.textTheme.bodyMedium,
            ),
            Text(
              '${CurrencyUtils().currencyFormat(pinjaman.toInt()) ?? 0}',
              style: appTheme.textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
          ],
        )
      ),
    );
  }
}


// Empty Credit
// Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Image.asset(ImageAssets.pending_image, height: 200,),
// Text(
// AppStrings.belumVerifikasi,
// style: appTheme.textTheme.bodyMedium,
// textAlign: TextAlign.center,
// )
// ],
// ),