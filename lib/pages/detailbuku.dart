import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  final String title;
  final String author;
  final String image;

  const BookDetailPage({
    super.key,
    required this.title,
    required this.author,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Detail Buku"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(child: Image.asset(image, height: 250)),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              author,
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
