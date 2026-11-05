import 'package:flutter/material.dart';
import 'package:literasikuu/footer.dart';

class AkunPage extends StatelessWidget {
  const AkunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Akun')),
      body: const Center(child: Text('Halaman Akun')),
      bottomNavigationBar: Footer(selectedIndex: 3),
    );
  }
}
