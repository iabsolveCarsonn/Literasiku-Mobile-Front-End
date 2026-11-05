import 'package:flutter/material.dart';
import 'package:literasikuu/footer.dart';

class DaftarPencarianPage extends StatelessWidget {
  const DaftarPencarianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Pencarian')),
      body: const Center(child: Text('Halaman Daftar Pencarian')),
      bottomNavigationBar: Footer(selectedIndex: 1),
    );
  }
}
