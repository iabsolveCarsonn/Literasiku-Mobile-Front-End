import 'package:flutter/material.dart';
import 'package:literasikuu/pages/daftarpencarian.dart';
import 'package:literasikuu/pages/bookmark.dart';
import 'package:literasikuu/pages/akun.dart';
import 'package:literasikuu/pages/home.dart';

class Footer extends StatelessWidget {
  const Footer({super.key, this.selectedIndex = 0});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
            break;

          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DaftarPencarianPage()),
            );
            break;

          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const BookmarkPage()),
            );
            break;

          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AkunPage()),
            );
            break;
        }
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
        NavigationDestination(
          icon: Icon(Icons.bookmark_border),
          selectedIcon: Icon(Icons.bookmark),
          label: 'Bookmark',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: 'Acc',
        ),
      ],
    );
  }
}
