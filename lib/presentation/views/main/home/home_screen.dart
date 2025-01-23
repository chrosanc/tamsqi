import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/utils/currency_utils.dart';
import 'package:online/presentation/viewmodels/main/home/home_viewmodel.dart';
import 'package:online/presentation/viewmodels/main/navigation_viewmodel.dart';
import 'package:online/presentation/views/auth/verification/face_verification_screen.dart';
import 'package:online/presentation/views/auth/verification/identity_card_verification_screen.dart';
import 'package:online/presentation/views/auth/verification/personal_data_verification_screen.dart';
import 'package:online/presentation/views/main/credit/pending_account_screen.dart';
import 'package:online/presentation/widget/circleicon/circleicon_widget.dart';
import 'package:online/presentation/widget/genericbutton/genericbutton_widget.dart';
import 'package:online/presentation/widget/header/header_card.dart';
import 'package:online/presentation/widget/slidebanner/slidebanner_widget.dart';
import 'package:provider/provider.dart';

import '../credit/credit_request_screen.dart';

class UserHomeScreen extends HookWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewmodel>(context);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.getUser(context);
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: _buildAppBarTitle(viewModel),
        actions: [_buildNotificationIcon()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            children: [
              if (viewModel.userData != null) _buildHeader(viewModel),
              const SizedBox(height: 8),
              _buildActionButton(context, viewModel),
              const SizedBox(height: 12),
              const SlidebannerWidget(title: 'Syarat'),
              const SizedBox(height: 12),
              const SlidebannerWidget(title: 'Company Profile'),
              const SizedBox(height: 12),
              const SlidebannerWidget(title: 'Video'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBarTitle(HomeViewmodel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Halo, ', style: appTheme.textTheme.bodyMedium),
        Text(
          viewModel.userData?.namaLengkap ?? 'User',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildNotificationIcon() {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.notifications, color: appTheme.colorScheme.primary),
    );
  }

  Widget _buildHeader(HomeViewmodel viewModel) {
    final userData = viewModel.userData!;
    const headerTitle1 = 'Status Akun Anda';
    const defaultBottomChild = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleiconWidget(
          icons: Icon(Icons.calendar_month, color: Colors.white),
          description: 'Tenor 3-6 Bulan',
        ),
        CircleiconWidget(
          icons: Icon(Icons.credit_card, color: Colors.white),
          description: 'Syarat KTP',
        ),
        CircleiconWidget(
          icons: Icon(Icons.percent, color: Colors.white),
          description: 'Bunga Maks. 20%',
        ),
      ],
    );

    switch (userData.status) {
      case 'pending':
        return const HeaderCard(
          title1: headerTitle1,
          title2: 'Dalam Verifikasi',
          bottomChild: defaultBottomChild,
        );
      case 'ditolak':
        return const HeaderCard(
          title1: headerTitle1,
          title2: 'Ditolak',
          bottomChild: defaultBottomChild,
        );
      case 'diterima':
        if (viewModel.userCredit?.statusPengajuan == 'Diterima' &&
            userData.idPengajuanPinjaman != null) {
          return HeaderCard(
            title1: 'Tagihan Belum Dibayar',
            title2: CurrencyUtils().currencyFormat(
                double.tryParse(viewModel.userCredit!.jumlahPinjaman)!.toInt()),
            bottomChild: defaultBottomChild,
          );
        } else if (viewModel.userCredit?.statusPengajuan != 'Diterima' &&
            userData.idPengajuanPinjaman != null) {
          return HeaderCard(
              title1: 'Status Peminjaman Anda',
              title2:
                  viewModel.userCredit?.statusPengajuan! ?? 'Tidak diketahui',
              bottomChild: defaultBottomChild);
        } else {
          return const HeaderCard(
            title1: 'Status Pengajuan Anda',
            title2: 'Diterima',
            bottomChild: defaultBottomChild,
          );
        }
      default:
        return HeaderCard(
          title1: 'Limit Pinjaman Anda',
          title2: CurrencyUtils().currencyFormat(
              double.tryParse(userData.limitPinjaman!)!.toInt()),
          bottomChild: defaultBottomChild,
        );
    }
  }

  Widget _buildActionButton(BuildContext context, HomeViewmodel viewModel) {
    final userData = viewModel.userData;
    final userCredit = viewModel.userCredit;

    if (userCredit?.statusPengajuan != 'Diterima' &&
        userData?.idPengajuanPinjaman != null) {
      return const SizedBox.shrink();
    }

    if (userData?.status != null && userData?.status == 'ditolak') {
      return const SizedBox.shrink();
    }

    return GenericbuttonWidget(
      onTap: () => _handleActionButtonTap(context, viewModel),
      title: userData?.idPengajuanPinjaman != null &&
              userCredit?.statusPengajuan == 'Diterima' &&
              userData?.status == 'diterima'
          ? 'Bayar Sekarang'
          : 'Pinjam Sekarang',
    );
  }

  void _handleActionButtonTap(BuildContext context, HomeViewmodel viewModel) {
    final userData = viewModel.userData;
    final userCredit = viewModel.userCredit;
    final navigationViewModel =
        Provider.of<NavigationViewmodel>(context, listen: false);

    if (userData == null) return;

    if (userData.idDetailPribadi == null) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const VerificationpersonaldataScreen()),
      ).then((_) => viewModel.getUser(context));
    } else if (userData.idDetailIdentitas == null) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const VerificationidentitycardScreen()),
      ).then((_) => viewModel.getUser(context));
    } else if (userData.idVerifikasiWajah == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FaceverificationScreen()),
      ).then((_) => viewModel.getUser(context));
    } else if (userData.status == 'pending') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PendingAccountScreen()),
      ).then((_) => viewModel.getUser(context));
    } else if (userData.status == 'diterima' &&
        userData.idPengajuanPinjaman != null &&
        userCredit?.statusPengajuan == 'Diterima') {
      navigationViewModel.onItemTapped(1);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CreditAcceptedScreen()),
      );
    }
  }
}
