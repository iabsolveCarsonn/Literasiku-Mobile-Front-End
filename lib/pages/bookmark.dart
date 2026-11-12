import 'package:flutter/material.dart';
import 'package:literasikuu/book.dart';
import 'package:literasikuu/footer.dart';
import 'package:literasikuu/book_repisitory.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  List<BookItem> get books => BookRepository.books;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF334E3B);
    const lightColor = Color(0xFFF2F3ED);

    final bookmarkedBooks = books.where((book) => book.isBookmarked).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              const Text(
                'RAK PERSONAL',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Koleksi bacaanmu.',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'Buku pilihan, tersimpan untuk nanti.',
                style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
              ),

              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.menu_book_outlined,
                      color: primaryColor,
                      size: 40,
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${bookmarkedBooks.length} buku tersimpan',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            'Ruang kecil untuk gagasan besar.',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'Semua buku',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${bookmarkedBooks.length}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  const Row(
                    children: [
                      Icon(Icons.sort, color: primaryColor),
                      SizedBox(width: 8),
                      Text(
                        'Terbaru disimpan',
                        style: TextStyle(color: primaryColor, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              if (bookmarkedBooks.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  child: Center(
                    child: Text(
                      'Belum ada buku yang disimpan',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              else
                ...bookmarkedBooks.map((book) => _bookItem(book)),

              const SizedBox(height: 12),

              Divider(color: Colors.grey.shade300),

              const SizedBox(height: 24),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.bookmark_border,
                    size: 28,
                    color: Colors.grey.shade600,
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      'Simpan buku dari halaman detail agar mudah ditemukan kembali di sini.',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const Footer(selectedIndex: 2),
    );
  }

  Widget _bookItem(BookItem book) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              book.coverAsset,
              width: 90,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${book.genre} • ${book.year}',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),

                const SizedBox(height: 8),

                Text(
                  book.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  book.author,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(Icons.star, size: 18, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      '${book.rating} • Tersimpan',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          IconButton(
            icon: Icon(
              book.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: const Color(0xFF334E3B),
              size: 30,
            ),
            onPressed: () {
              setState(() {
                book.isBookmarked = !book.isBookmarked;
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${book.title} dihapus dari bookmark'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
