import 'package:flutter/material.dart';
import 'package:literasikuu/footer.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bookmark')),
      body: const Center(child: Text('Halaman  Bookmark')),
      bottomNavigationBar: Footer(selectedIndex: 2),
    );
  }
}
