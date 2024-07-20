import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';
import 'package:online/presentation/views/user/main/home/home_screen.dart';
import 'package:online/presentation/views/user/main/payment/payment_screen.dart';
import 'package:online/presentation/views/user/main/profile/profile_screen.dart';
import 'package:online/presentation/views/user/viewmodels/main/navigation_viewmodel.dart';
import 'package:provider/provider.dart';

class UserNavigation extends StatelessWidget {
  const UserNavigation({Key? key}) : super(key: key);

  static const List<Widget> _widgetOptions = <Widget>[
    UserHomeScreen(),
    UserPaymentScreen(),
    UserProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final navigationViewModel = Provider.of<NavigationViewmodel>(context);
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(navigationViewModel.selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 7,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: 'Pembayaran'
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Akun'
              )
          ],
          currentIndex: navigationViewModel.selectedIndex,
          selectedItemColor: appTheme.colorScheme.primary,
          onTap: navigationViewModel.onItemTapped,
          ),
    );
  }
}
