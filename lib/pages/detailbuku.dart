import 'package:flutter/material.dart';

class DetailBukuPage extends StatelessWidget {
  const DetailBukuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
      ),
      body: const Center(
        child: Text('Halaman Detail Buku'),
      ),
    );
  }
}
