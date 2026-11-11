class BookItem {
  final String title;
  final String author;
  final String genre;
  final String educationLevel;
  final String year;
  final String rating;
  final String coverAsset;
  bool isBookmarked;

  BookItem({
    required this.title,
    required this.author,
    required this.genre,
    required this.educationLevel,
    required this.year,
    required this.rating,
    required this.coverAsset,
    this.isBookmarked = true,
  });
}
