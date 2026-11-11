import 'package:flutter/material.dart';
import 'package:literasikuu/footer.dart';
import 'package:literasikuu/book.dart';
import 'package:literasikuu/book_repisitory.dart';

class DaftarPencarianPage extends StatefulWidget {
  const DaftarPencarianPage({super.key});

  @override
  State<DaftarPencarianPage> createState() => _DaftarPencarianPageState();
}

class _DaftarPencarianPageState extends State<DaftarPencarianPage> {
  static const Color _bgColor = Color(0xFFFFFEFA);
  static const Color _primaryText = Color(0xFF292E27);
  static const Color _accentGreen = Color(0xFF344936);
  static const Color _mutedText = Color(0xFF727769);
  static const Color _pillBg = Color(0xFFF0F2E9);
  static const Color _dividerColor = Color(0xFFDDDFD2);
  static const Color _starColor = Color(0xFFA18B58);

  final TextEditingController _searchController = TextEditingController();

  String _selectedGenre = 'Semua genre';
  String _selectedTingkat = 'Semua tingkat';
  String _selectedTahun = 'Semua tahun';

  final List<String> _genreOptions = [
    'Semua genre',
    'Esai',
    'Pendidikan',
    'Literasi',
  ];

  final List<String> _tingkatOptions = [
    'Semua tingkat',
    'Umum',
    'SMA/SMK',
    'Perguruan Tinggi',
  ];

  final List<String> _tahunOptions = ['Semua tahun', '2025', '2024', '2023'];

  List<BookItem> get _allBooks => BookRepository.books;

  List<BookItem> get _filteredBooks {
    final query = _searchController.text.trim().toLowerCase();
    return _allBooks.where((book) {
      final matchesQuery =
          query.isEmpty ||
          book.title.toLowerCase().contains(query) ||
          book.author.toLowerCase().contains(query);
      final matchesGenre =
          _selectedGenre == 'Semua genre' ||
          book.genre.toLowerCase() == _selectedGenre.toLowerCase();
      final matchesTingkat =
          _selectedTingkat == 'Semua tingkat' ||
          book.educationLevel.toLowerCase() == _selectedTingkat.toLowerCase();
      final matchesTahun =
          _selectedTahun == 'Semua tahun' || book.year == _selectedTahun;
      return matchesQuery && matchesGenre && matchesTingkat && matchesTahun;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showFilterPicker({
    required String title,
    required List<String> options,
    required String currentValue,
    required ValueChanged<String> onSelected,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: _bgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _primaryText,
                  ),
                ),
                const SizedBox(height: 12),
                ...options.map((option) {
                  final isSelected = option == currentValue;
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      option,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: isSelected ? _accentGreen : _primaryText,
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(Icons.check_rounded, color: _accentGreen)
                        : null,
                    onTap: () {
                      onSelected(option);
                      Navigator.pop(context);
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final books = _filteredBooks;

    return Scaffold(
      bottomNavigationBar: Footer(selectedIndex: 1),
      backgroundColor: _bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 18, 22, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo Literasiku
              Image.asset(
                'assets/images/book-Logo-literasiku.png',
                height: 28,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 22),

              // Judul Utama
              const Text(
                'Mau baca apa?',
                style: TextStyle(
                  fontFamily: 'Cormorant Garamond',
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                  color: _primaryText,
                  letterSpacing: -0.3,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 18),

              // Kolom Pencarian
              Container(
                height: 52,
                decoration: BoxDecoration(
                  color: _bgColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: _accentGreen, width: 1.1),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (_) => setState(() {}),
                  style: const TextStyle(fontSize: 15, color: _primaryText),
                  decoration: InputDecoration(
                    hintText: 'Cari judul buku atau penulis',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: _mutedText,
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 14, right: 10),
                      child: Icon(
                        Icons.search_rounded,
                        color: _accentGreen,
                        size: 24,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 44,
                      minHeight: 44,
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              _searchController.clear();
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.close_rounded,
                              color: _mutedText,
                              size: 20,
                            ),
                          )
                        : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Header Sesuaikan Pencarian
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sesuaikan pencarian',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: _primaryText,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      setState(() {
                        _selectedGenre = 'Semua genre';
                        _selectedTingkat = 'Semua tingkat';
                        _selectedTahun = 'Semua tahun';
                        _searchController.clear();
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.tune_rounded,
                        color: _accentGreen,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // 3 Filter Dropdowns (Genre, Tingkat pendidikan, Tahun diterbitkan)
              Row(
                children: [
                  Expanded(
                    child: _buildFilterColumn(
                      label: 'Genre',
                      value: _selectedGenre,
                      onTap: () => _showFilterPicker(
                        title: 'Pilih Genre',
                        options: _genreOptions,
                        currentValue: _selectedGenre,
                        onSelected: (val) =>
                            setState(() => _selectedGenre = val),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildFilterColumn(
                      label: 'Tingkat pendidikan',
                      value: _selectedTingkat,
                      onTap: () => _showFilterPicker(
                        title: 'Pilih Tingkat Pendidikan',
                        options: _tingkatOptions,
                        currentValue: _selectedTingkat,
                        onSelected: (val) =>
                            setState(() => _selectedTingkat = val),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildFilterColumn(
                      label: 'Tahun diterbitkan',
                      value: _selectedTahun,
                      onTap: () => _showFilterPicker(
                        title: 'Pilih Tahun Diterbitkan',
                        options: _tahunOptions,
                        currentValue: _selectedTahun,
                        onSelected: (val) =>
                            setState(() => _selectedTahun = val),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Header Hasil Pencarian
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const Text(
                    'Hasil pencarian',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: _primaryText,
                    ),
                  ),
                  Text(
                    '${books.length} buku · Paling relevan',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: _mutedText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Daftar Buku
              if (books.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 36),
                  child: Center(
                    child: Text(
                      'Tidak ada buku yang sesuai dengan pencarian.',
                      style: TextStyle(fontSize: 14, color: _mutedText),
                    ),
                  ),
                )
              else
                ...books.map((book) => _buildBookCard(book)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterColumn({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: _mutedText,
          ),
        ),
        const SizedBox(height: 6),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              color: _pillBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                      color: _accentGreen,
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 18,
                  color: _accentGreen,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBookCard(BookItem book) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Sampul Buku
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    book.coverAsset,
                    width: 68,
                    height: 104,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Detail Metadata Buku
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${book.genre.toUpperCase()} · ${book.year}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                        color: _mutedText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      book.title,
                      style: const TextStyle(
                        fontFamily: 'Cormorant Garamond',
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: _primaryText,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      book.author,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: _mutedText,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 17,
                          color: _starColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          book.rating,
                          style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w500,
                            color: _primaryText,
                          ),
                        ),
                        const Text(
                          ' · Ulasan pembaca',
                          style: TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w400,
                            color: _mutedText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Tombol Checklist Bookmark di kanan (menggunakan materi Stack)
              IconButton(
                tooltip: book.isBookmarked
                    ? 'Tersimpan di bookmark'
                    : 'Simpan ke bookmark',
                hoverColor: _accentGreen.withValues(alpha: 0.08),
                splashColor: _accentGreen.withValues(alpha: 0.15),
                highlightColor: _accentGreen.withValues(alpha: 0.1),
                onPressed: () {
                  setState(() {
                    book.isBookmarked = !book.isBookmarked;
                  });
                },
                icon: SizedBox(
                  width: 26,
                  height: 28,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Icon dasar bookmark outline
                      Icon(
                        Icons.bookmark_border_rounded,
                        size: 26,
                        color: book.isBookmarked ? _accentGreen : _mutedText,
                      ),
                      // Tanda centang tebal dan presisi di dalam bookmark
                      if (book.isBookmarked)
                        Positioned(
                          top: 6,
                          child: SizedBox(
                            width: 7,
                            height: 11,
                            child: CustomPaint(
                              painter: _CheckmarkPainter(
                                color: _accentGreen,
                                strokeWidth: 2.3,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(color: _dividerColor, thickness: 1, height: 26),
      ],
    );
  }
}

/// CustomPainter untuk menggambar tanda centang yang tebal dan proporsional
/// di dalam icon bookmark, persis seperti pada desain Checklist-Icon.png
class _CheckmarkPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  const _CheckmarkPainter({required this.color, this.strokeWidth = 2.3});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    // Titik awal kaki kiri pendek
    path.moveTo(size.width * 0.12, size.height * 0.46);
    // Sudut siku bawah (vertex)
    path.lineTo(size.width * 0.42, size.height * 0.88);
    // Ujung kaki kanan panjang
    path.lineTo(size.width * 0.92, size.height * 0.16);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _CheckmarkPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
}
