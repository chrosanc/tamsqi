import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';
import 'package:online/presentation/widget/header/header_card.dart';
import 'package:online/presentation/widget/slidebanner/slidebanner_widget.dart';

class UserHomeScreen extends StatelessWidget {
const UserHomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Halo, ',),
            Text('Akbar Maulana')
          ],
          
        ),
        actions: [
          IconButton(onPressed: () {
          }, 
          icon: Icon(Icons.notifications, color: appTheme.colorScheme.primary,))
        ],
        titleTextStyle: appTheme.textTheme.titleSmall,
        centerTitle: false,
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            children: [
              HeaderCard(),
              const SizedBox(height: 8,),
              Text('Pengajuan anggota sedang dalam proses verifikasi'),
              const SizedBox(height: 12,),
              SlidebannerWidget(),
              const SizedBox(height: 12,),
              SlidebannerWidget(),
              const SizedBox(height: 12,),
              SlidebannerWidget()
            ],
          ),
        ),
      ),
    );
  }
}