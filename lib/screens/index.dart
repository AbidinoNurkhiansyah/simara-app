import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simara/screens/beranda_screen.dart';
import 'package:simara/screens/profile_screen.dart';
import 'package:simara/screens/suscatin_screen.dart';
import '../providers/navigation_provider.dart';
import '../widgets/bottom_navbar.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({super.key});

  final List<Widget> _screens = [
    BerandaScreen(), // Beranda utama
    SuscatinScreen(), // Suscatin
    ProfileScreen(), // Profil
  ];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: _screens[navigationProvider.currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: navigationProvider.currentIndex,
        onTap: (index) {
          navigationProvider.changePage(index);
        },
      ),
    );
  }
}
