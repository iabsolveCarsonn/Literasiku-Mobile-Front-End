import 'package:flutter/material.dart';
import 'package:literasikuu/book.dart';
import 'package:literasikuu/book_repisitory.dart';

class DetailBukuPage extends StatefulWidget {
  final BookItem? book;

  const DetailBukuPage({super.key, this.book});

  @override
  State<DetailBukuPage> createState() => _DetailBukuPageState();
}

/// Alias agar tetap kompatibel jika ada halaman lain yang memanggil BookDetailPage
class BookDetailPage extends DetailBukuPage {
  const BookDetailPage({super.key, super.book});
}

class _DetailBukuPageState extends State<DetailBukuPage> {
  static const Color _bgColor = Color(0xFFFFFEFA);
  static const Color _primaryText = Color(0xFF292E27);
  static const Color _bodyText = Color(0xFF3B4038);
  static const Color _accentGreen = Color(0xFF344936);
  static const Color _mutedText = Color(0xFF727769);
  static const Color _cardSurface = Color(0xFFF0F2E9);
  static const Color _dividerColor = Color(0xFFDDDFD2);
  static const Color _starColor = Color(0xFFA18B58);

  late BookItem _book;

  @override
  void initState() {
    super.initState();
    _book = widget.book ?? BookRepository.books.first;
  }

  String _getSubCategory(BookItem book) {
    switch (book.genre.toLowerCase()) {
      case 'esai':
        return 'ESAI · LITERASI DIRI';
      case 'pendidikan':
        return 'PENDIDIKAN · METODE BELAJAR';
      case 'literasi':
        return 'LITERASI · BAHASA & KATA';
      default:
        return '${book.genre.toUpperCase()} · LITERASI';
    }
  }

  List<String> _getSynopsisParagraphs(BookItem book) {
    if (book.title == 'Seni Menikmati Sepi') {
      return const [
        'Di tengah hari yang penuh suara dan tuntutan, sepi sering dianggap sebagai sesuatu yang harus dihindari. Laras Kinanti mengajak kita melihatnya dari sisi lain: sebagai ruang untuk mendengar diri sendiri, menata pikiran, dan menemukan kembali hal-hal yang berarti.',
        'Melalui esai tentang rutinitas kecil, hubungan dengan orang lain, dan keberanian mengambil jeda, buku ini menawarkan cara sederhana untuk hadir dengan lebih sadar. Setiap bagian ditutup dengan pertanyaan reflektif yang membantu pembaca memahami perasaannya. Bukan ajakan untuk menjauh dari dunia, melainkan undangan untuk kembali dengan hati yang lebih lapang.',
      ];
    } else if (book.title == 'Belajar Cara Belajar') {
      return const [
        'Banyak orang menghabiskan waktu berjam-jam untuk membaca dan menghafal, namun cepat melupakan apa yang baru saja dipelajari. Nadia Aksara membedah cara kerja pikiran saat menyerap pengetahuan baru dan bagaimana membangun kebiasaan belajar yang tahan lama.',
        'Dilengkapi panduan praktis memetakan konsep, teknik mencatat aktif, serta cara mengelola fokus tanpa kelelahan mental, buku ini membantu pelajar maupun mahasiswa menemukan ritme belajar yang paling sesuai bagi dirinya.',
      ];
    } else {
      return const [
        'Kata-kata bukan sekadar alat bertukar kabar, melainkan jembatan untuk memahami pengalaman manusia. Bima Pradana mengajak pembaca menelusuri bagaimana pilihan kata membentuk cara kita berpikir, berempati, dan merawat ingatan.',
        'Lewat rangkaian tulisan yang hangat dan dekat dengan keseharian, buku ini menjadi teman baca yang menumbuhkan kepekaan berbahasa sekaligus memperkaya cara kita bercerita.',
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final paragraphs = _getSynopsisParagraphs(_book);

    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        backgroundColor: _bgColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: _primaryText,
            size: 22,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Detail buku',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: _primaryText,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.share_outlined,
              color: _primaryText,
              size: 21,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 8, 22, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card Sampul Buku
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 22),
                decoration: BoxDecoration(
                  color: _cardSurface,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.16),
                          blurRadius: 14,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        _book.coverAsset,
                        width: 144,
                        height: 216,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Kategori
              Text(
                _getSubCategory(_book),
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 11.5,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                  color: _mutedText,
                ),
              ),
              const SizedBox(height: 6),

              // Judul Buku (Cormorant Garamond SemiBold)
              Text(
                _book.title,
                style: const TextStyle(
                  fontFamily: 'Cormorant Garamond',
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: _primaryText,
                  height: 1.15,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 6),

              // Nama Penulis
              Text(
                _book.author,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15.5,
                  fontWeight: FontWeight.w400,
                  color: _mutedText,
                ),
              ),
              const SizedBox(height: 10),

              // Baris Bintang & Penilaian Pembaca
              Row(
                children: [
                  ...List.generate(
                    5,
                    (_) => const Padding(
                      padding: EdgeInsets.only(right: 3),
                      child: Icon(
                        Icons.star_rounded,
                        size: 18,
                        color: _starColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _book.rating,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: _primaryText,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Penilaian pembaca',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13.5,
                      fontWeight: FontWeight.w400,
                      color: _mutedText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Metadata Buku (Tingkat, Terbit, Bahasa)
              const Divider(color: _dividerColor, thickness: 1, height: 1),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMetaItem('TINGKAT', _book.educationLevel),
                    _buildMetaItem('TERBIT', _book.year),
                    _buildMetaItem('BAHASA', 'Indonesia'),
                  ],
                ),
              ),
              const Divider(color: _dividerColor, thickness: 1, height: 1),
              const SizedBox(height: 22),

              // Judul Sinopsis (Cormorant Garamond SemiBold)
              const Text(
                'Sinopsis',
                style: TextStyle(
                  fontFamily: 'Cormorant Garamond',
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: _primaryText,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),

              // Paragraf Sinopsis
              ...paragraphs.map(
                (text) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.5,
                      fontWeight: FontWeight.w400,
                      color: _bodyText,
                      height: 1.58,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Tombol Tersimpan di Bookmark
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _accentGreen,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _book.isBookmarked = !_book.isBookmarked;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _book.isBookmarked
                            ? 'Tersimpan di Bookmark'
                            : 'Simpan ke Bookmark',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 22,
                        height: 24,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const Icon(
                              Icons.bookmark_border_rounded,
                              size: 22,
                              color: Colors.white,
                            ),
                            if (_book.isBookmarked)
                              Positioned(
                                top: 5.5,
                                child: SizedBox(
                                  width: 6,
                                  height: 9,
                                  child: CustomPaint(
                                    painter: _ButtonCheckmarkPainter(
                                      color: Colors.white,
                                      strokeWidth: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Keterangan Koleksi di Bawah Tombol
              Center(
                child: Text(
                  _book.isBookmarked
                      ? 'Ada di koleksi “Semua buku” milikmu.'
                      : 'Belum disimpan di koleksi buku milikmu.',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12.5,
                    fontWeight: FontWeight.w400,
                    color: _mutedText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetaItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 11,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            color: _mutedText,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: _primaryText,
          ),
        ),
      ],
    );
  }
}

class _ButtonCheckmarkPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  const _ButtonCheckmarkPainter({
    required this.color,
    this.strokeWidth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path()
      ..moveTo(size.width * 0.12, size.height * 0.46)
      ..lineTo(size.width * 0.42, size.height * 0.88)
      ..lineTo(size.width * 0.92, size.height * 0.16);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _ButtonCheckmarkPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
}
