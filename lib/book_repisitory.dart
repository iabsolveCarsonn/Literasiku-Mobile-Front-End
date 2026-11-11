import 'package:literasikuu/book.dart';

class BookRepository {
  static final List<BookItem> books = [
    BookItem(
      title: 'Seni Menikmati Sepi',
      author: 'Laras Kinanti',
      genre: 'Esai',
      educationLevel: 'Umum',
      year: '2024',
      rating: '4,8',
      coverAsset: 'assets/images/seni_menikmati_sepi.png',
      isBookmarked: true,
    ),
    BookItem(
      title: 'Belajar Cara Belajar',
      author: 'Nadia Aksara',
      genre: 'Pendidikan',
      educationLevel: 'Perguruan Tinggi',
      year: '2025',
      rating: '4,9',
      coverAsset: 'assets/images/belajar_cara_belajar.png',
      isBookmarked: true,
    ),
    BookItem(
      title: 'Merawat Kata',
      author: 'Bima Pradana',
      genre: 'Literasi',
      educationLevel: 'SMA/SMK',
      year: '2023',
      rating: '4,7',
      coverAsset: 'assets/images/merawat_kata.png',
      isBookmarked: true,
    ),
  ];
}
