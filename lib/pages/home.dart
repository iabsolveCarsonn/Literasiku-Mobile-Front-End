import 'package:flutter/material.dart';
import 'package:literasikuu/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color primaryGreen = Color(0xFF445A46);
  static const Color softBackground = Color(0xFFF9F9F5);
  static const Color softCard = Color(0xFFEFEFE9);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Footer(selectedIndex: 0),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth > 700;

            return ListView(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 40 : 24,
                vertical: 16,
              ),
              children: [
                const SizedBox(height: 8),

                /// HEADER
                Row(
                  children: [
                    const Icon(
                      Icons.menu_book_outlined,
                      size: 34,
                      color: primaryGreen,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Literasiku',
                      style: TextStyle(
                        fontSize: isTablet ? 42 : 32,
                        fontWeight: FontWeight.w500,
                        color: primaryGreen,
                        fontFamily: 'Serif',
                      ),
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      radius: 24,
                      backgroundColor: softCard,
                      child: Text(
                        'AP',
                        style: TextStyle(
                          color: primaryGreen,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                const Text(
                  'HALAMAN MILIKMU',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: primaryGreen,
                    letterSpacing: 0.5,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  'Selamat datang, Ayu.',
                  style: TextStyle(
                    fontSize: isTablet ? 52 : 34,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Serif',
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Hari baik dimulai dari satu bacaan.',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),

                const SizedBox(height: 30),

                /// CAROUSEL
                SizedBox(
                  height: 280,
                  child: PageView(
                    children: const [
                      EditorialCard(),
                      EditorialCard(),
                      EditorialCard(),
                    ],
                  ),
                ),

                const SizedBox(height: 36),

                Text(
                  'Jelajahi kategori',
                  style: TextStyle(
                    fontSize: isTablet ? 40 : 28,
                    fontFamily: 'Serif',
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 24),

                /// CATEGORY GRID
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: isTablet ? 4 : 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                  children: const [
                    CategoryItem(
                      icon: Icons.school_outlined,
                      title: 'Pendidikan',
                    ),
                    CategoryItem(
                      icon: Icons.edit_note_outlined,
                      title: 'Literasi',
                    ),
                    CategoryItem(icon: Icons.science_outlined, title: 'Sains'),
                    CategoryItem(icon: Icons.menu_book_outlined, title: 'Esai'),
                  ],
                ),

                const SizedBox(height: 30),

                /// POPULAR BOOK
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Buku terpopuler',
                        style: TextStyle(
                          fontSize: isTablet ? 40 : 28,
                          fontFamily: 'Serif',
                        ),
                      ),
                    ),
                    const Text(
                      'Lihat semua',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: primaryGreen,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                SizedBox(
                  height: 330,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      BookCard(
                        title: 'Seni Menikmati Sepi',
                        rating: '4,8',
                        image: 'https://picsum.photos/200/300?random=1',
                      ),
                      SizedBox(width: 16),
                      BookCard(
                        title: 'Belajar Cara Belajar',
                        rating: '4,9',
                        image: 'https://picsum.photos/200/300?random=2',
                      ),
                      SizedBox(width: 16),
                      BookCard(
                        title: 'Sains di Sekitar Kita',
                        rating: '4,8',
                        image: 'https://picsum.photos/200/300?random=3',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            );
          },
        ),
      ),
    );
  }
}

///
/// REUSABLE WIDGET - EDITORIAL CARD
///
class EditorialCard extends StatelessWidget {
  const EditorialCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xFFEFEFE9),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'PILIHAN REDAKSI',
                  style: TextStyle(
                    color: Color(0xFF445A46),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Ruang tenang,\ngagasan baru.',
                  style: TextStyle(
                    fontSize: 28,
                    height: 1.2,
                    fontFamily: 'Serif',
                    color: Color(0xFF445A46),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Esai untuk merawat jeda dan rasa ingin tahu.',
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
                const Spacer(),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Color(0xFF445A46),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(text: 'Jelajahi buku '),
                      WidgetSpan(
                        child: Icon(
                          Icons.arrow_forward,
                          size: 20,
                          color: Color(0xFF445A46),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),

          /// STACK contoh penggunaan multi-child layout
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(blurRadius: 8, color: Colors.black12),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://picsum.photos/200/300?random=10',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///
/// REUSABLE WIDGET - CATEGORY ITEM
///
class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 82,
          width: 82,
          decoration: BoxDecoration(
            color: const Color(0xFFEFEFE9),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Icon(icon, size: 38, color: const Color(0xFF445A46)),
          ),
        ),
        const SizedBox(height: 10),
        Text(title),
      ],
    );
  }
}

///
/// REUSABLE WIDGET - BOOK CARD
///
class BookCard extends StatelessWidget {
  final String title;
  final String rating;
  final String image;

  const BookCard({
    super.key,
    required this.title,
    required this.rating,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 195,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(image, fit: BoxFit.cover),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(Icons.star, size: 18, color: Color(0xFF445A46)),
              const SizedBox(width: 4),
              Text(
                rating,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
