import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:online/app/routes.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/strings.dart';
import 'package:online/presentation/viewmodels/member/main/home/member_home_viewmodel.dart';
import 'package:online/presentation/widget/genericbutton/genericbutton_widget.dart';
import 'package:online/presentation/widget/header/header_card.dart';
import 'package:online/presentation/widget/slidebanner/slidebanner_widget.dart';
import 'package:provider/provider.dart';

class UnverifiedHome extends HookWidget {
  const UnverifiedHome({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MemberHomeViewmodel>(context);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.getMember(context);
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Halo, ',
            ),
            Text(viewModel.anggota?.namaLengkap ?? 'User')
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: appTheme.colorScheme.primary,
              ))
        ],
        titleTextStyle: appTheme.textTheme.titleSmall,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            children: [
              HeaderCard(
                  title1:
                      'Status Pendaftaran Anggota : ${viewModel.anggota?.status ?? 'Tidak Diketahui'}',
                  title2:
                      'Cabang ${viewModel.anggota?.kantor ?? 'Cabang Kantor'}',
                  bottomChild: viewModel.anggota?.status == 'pending'
                      ? const Text(
                          AppStrings.memberPending,
                          textAlign: TextAlign.center,
                        )
                      : viewModel.anggota?.status == 'ditolak'
                          ? const Text(
                              AppStrings.memberDitolak,
                              textAlign: TextAlign.center,
                            )
                          : viewModel.anggota?.status == 'diterima'
                              ? const Text(
                                  AppStrings.memberDiterima,
                                  textAlign: TextAlign.center,
                                )
                              : const Text(
                                  'Status dalam Anggota Tidak ditemukan')),
              const SizedBox(
                height: 12,
              ),
              viewModel.anggota?.status == 'diterima'
                  ? GenericbuttonWidget(
                      title: 'Masuk',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.login);
                      })
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 12,
              ),
              const SlidebannerWidget(
                title: 'Syarat',
              ),
              const SizedBox(
                height: 12,
              ),
              const SlidebannerWidget(title: 'Company Profile'),
              const SizedBox(
                height: 12,
              ),
              const SlidebannerWidget(
                title: 'Video',
              )
            ],
          ),
        ),
      ),
    );
  }
}
