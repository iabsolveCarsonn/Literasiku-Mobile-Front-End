import 'package:flutter/material.dart';
import 'package:literasikuu/pages/bookmark.dart';

import '../pages/akun.dart';
import '../pages/daftarpencarian.dart';
import '../pages/home.dart';
import '../pages/login.dart';

/// ===================================================================
/// NAVIGASI PUSAT APLIKASI LITERASIKU
/// -------------------------------------------------------------------
/// Semua perpindahan halaman diatur di file ini, jadi tiap halaman
/// tidak perlu membuat bottom navigation bar dan Navigator sendiri.
///
/// Isi file:
/// 1. [AppRoutes]       : daftar nama route + peta route untuk MaterialApp
/// 2. [MainNavigation]  : kerangka utama berisi 4 tab (Home, Search,
///                        Bookmark, Acc) dengan satu bottom navigation bar
/// ===================================================================

/// Daftar nama route yang dipakai di seluruh aplikasi.
class AppRoutes {
  AppRoutes._();

  static const String main = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String akun = '/akun';
  static const String bookmark = '/bookmark';
  static const String pancarian = '/pencarian';

  /// Dipasang di MaterialApp: `routes: AppRoutes.routes`
  static Map<String, WidgetBuilder> get routes => {
    main: (context) => const MainNavigation(),
    login: (context) => const LoginPage(),
    home: (context) => const HomePage(),
    akun: (context) => const AkunPage(),
    bookmark: (context) => const BookmarkPage(),
    pancarian: (context) => const DaftarPencarianPage(),
  };
}

/// Kerangka utama aplikasi dengan bottom navigation bar bersama.
class MainNavigation extends StatefulWidget {
  /// Tab yang aktif saat pertama dibuka.
  /// 0 = Home, 1 = Search, 2 = Bookmark, 3 = Akun
  final int initialIndex;

  const MainNavigation({super.key, this.initialIndex = 0});

  /// Pindah tab dari halaman mana pun di dalam MainNavigation, contoh:
  /// `MainNavigation.goTo(context, 3);` untuk membuka tab Acc.
  static void goTo(BuildContext context, int index) {
    context.findAncestorStateOfType<_MainNavigationState>()?._onTabSelected(
      index,
    );
  }

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  static const Color _bgColor = Color(0xFFFFFEFA);
  static const Color _primaryText = Color(0xFF292E27);
  static const Color _mutedText = Color(0xFF727769);
  static const Color _pillBg = Color(0xFFF0F2E9);

  late int _currentIndex;

  /// Urutan halaman harus sama dengan urutan [_destinations].
  final List<Widget> _pages = const [
    HomePage(),
    DaftarPencarianPage(),
    _BookmarkPlaceholder(),
    AkunPage(),
  ];

  static const List<NavigationDestination> _destinations = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home_rounded),
      label: 'Home',
    ),
    NavigationDestination(icon: Icon(Icons.search_rounded), label: 'Search'),
    NavigationDestination(
      icon: Icon(Icons.bookmark_border_rounded),
      selectedIcon: Icon(Icons.bookmark_rounded),
      label: 'Bookmark',
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline_rounded),
      selectedIcon: Icon(Icons.person_rounded),
      label: 'Acc',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex.clamp(0, _pages.length - 1);
  }

  void _onTabSelected(int index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack menjaga state tiap halaman, misalnya teks pencarian
      // dan filter di halaman Search tidak hilang saat pindah tab.
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: _pillBg, width: 1.2)),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              final selected = states.contains(WidgetState.selected);
              return TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                color: selected ? _primaryText : _mutedText,
              );
            }),
            iconTheme: WidgetStateProperty.resolveWith((states) {
              final selected = states.contains(WidgetState.selected);
              return IconThemeData(
                size: 22,
                color: selected ? _primaryText : _mutedText,
              );
            }),
          ),
          child: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: _onTabSelected,
            backgroundColor: _bgColor,
            indicatorColor: _pillBg,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            height: 68,
            destinations: _destinations,
          ),
        ),
      ),
    );
  }
}

/// Halaman sementara untuk tab Bookmark karena belum ada file halamannya.
class _BookmarkPlaceholder extends StatelessWidget {
  const _BookmarkPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Halaman Bookmark',
          style: TextStyle(fontSize: 16, color: Color(0xFF727769)),
        ),
      ),
    );
  }
}
