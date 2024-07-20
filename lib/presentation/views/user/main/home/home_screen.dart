import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';
import 'package:online/presentation/views/user/main/credit/creditaccepted_screen.dart';
import 'package:online/presentation/widget/circleicon/circleicon_widget.dart';
import 'package:online/presentation/widget/genericbutton/genericbutton_widget.dart';
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
              HeaderCard(
                title1: 'Limit Pinjaman Anda:', 
                title2: 'Rp. 5.000.000', 
              bottomChild: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                CircleiconWidget(icons: Icon(Icons.calendar_month, color: Colors.white,), description: 'Tenor 3-6 Bulan'),
                CircleiconWidget(icons: Icon(Icons.credit_card, color: Colors.white,), description: 'Syarat KTP'),
                CircleiconWidget(icons: Icon(Icons.percent, color: Colors.white,), description: 'Bunga Maks. 20%'),
              ],),
              ),
              const SizedBox(height: 8,),
              GenericbuttonWidget(
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CreditacceptedScreen()));
                },
                title: 'Pinjam Sekarang'),  
              const SizedBox(height: 12,),
              SlidebannerWidget(
                title: 'Syarat',
              ),
              const SizedBox(height: 12,),
              SlidebannerWidget(
                title: 'Company Profile',
              ),
              const SizedBox(height: 12,),
              SlidebannerWidget(
                title: 'Video'
              )
            ],
          ),
        ),
      ),
    );
  }
}