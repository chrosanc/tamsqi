import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';
import 'package:online/presentation/viewmodels/main/navigation_viewmodel.dart';
import 'package:online/presentation/views/main/home/home_screen.dart';
import 'package:online/presentation/views/main/payment/credit_request_list_screen.dart';
import 'package:online/presentation/views/main/profile/profile_screen.dart';
import 'package:provider/provider.dart';

class UserNavigation extends StatelessWidget {
  const UserNavigation({super.key});

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
