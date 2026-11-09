import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Literasiku',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Serif',
        scaffoldBackgroundColor: const Color(0xFFFCFCF6),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF233A2D),
          surface: const Color(0xFFFCFCF6),
        ),
      ),
      home: const AkunPage(),
    );
  }
}

class AkunPage extends StatelessWidget {
  const AkunPage({super.key});

  final Color darkGreen = const Color(0xFF233A2D);
  final Color sageGreen = const Color(0xFFEFF1E6);
  final Color darkSage = const Color(0xFFC7D0B7);
  final Color greyText = const Color(0xFF757575);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- 1. Header Aplikasi ---
                Row(
                  children: [
                    Icon(Icons.menu_book_outlined, color: darkGreen, size: 28),
                    const SizedBox(width: 12),
                    Text(
                      'Literasiku',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: darkGreen,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // --- 2. Judul Halaman ---
                Text(
                  'Akun saya.',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: darkGreen,
                  ),
                ),
                const SizedBox(height: 24),

                // --- 3. Kartu Profil ---
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: sageGreen,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 34,
                        backgroundColor: darkSage,
                        child: Text(
                          'AP',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: darkGreen,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ayu Pratiwi',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: darkGreen,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'ayu.pratiwi@email.com',
                              style: TextStyle(fontSize: 14, color: greyText),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {
                                // NAVIGASI KE HALAMAN EDIT PROFIL
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const HalamanDetail(
                                          judul: 'Edit Profil',
                                        ),
                                  ),
                                );
                              },
                              child: Text(
                                'Edit profil',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: darkGreen,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // --- 4. Sub-bagian: PREFERENSI BACAAN ---
                Text(
                  'PREFERENSI BACAAN',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: greyText,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                const SizedBox(height: 8),
                _buildMenuItem(
                  context,
                  icon: Icons.school_outlined,
                  title: 'Tingkat pendidikan',
                  trailingText:
                      'Mahasiswa', // Lebih spesifik dari sekadar 'Umum'
                  showDivider: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.library_books_outlined,
                  title: 'Genre favorit',
                  trailingText: 'Esai, Literasi',
                  showDivider: true,
                ),
                const SizedBox(height: 24),

                // --- 5. Sub-bagian: PENGATURAN AKUN ---
                Text(
                  'PENGATURAN AKUN',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: greyText,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                _buildMenuItem(
                  context,
                  icon: Icons.verified_user_outlined,
                  title: 'Keamanan & kata sandi',
                  showDivider: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.notifications_none_outlined,
                  title: 'Notifikasi',
                  trailingText: 'Aktif',
                  showDivider: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.help_outline,
                  title: 'Pusat bantuan',
                  showDivider: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.description_outlined,
                  title: 'Privasi & ketentuan',
                  showDivider: true,
                ),
                const SizedBox(height: 8),

                // --- 6. Tombol Keluar ---
                Material(
                  color: Colors.transparent,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.logout, color: darkGreen),
                    title: Text(
                      'Keluar dari akun',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: darkGreen,
                      ),
                    ),
                    onTap: () {
                      // Contoh menampilkan Dialog Konfirmasi saat mau keluar
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text('Keluar'),
                              content: const Text(
                                'Apakah Anda yakin ingin keluar dari akun?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed:
                                      () => Navigator.pop(
                                        context,
                                      ), // Tutup dialog
                                  child: const Text('Batal'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Tutup dialog
                                  },
                                  child: const Text(
                                    'Keluar',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 48),

                // --- 7. Footer Version ---
                Center(
                  child: Text(
                    'Opik - Ruang untuk bertumbuh - Versi 1.0',
                    style: TextStyle(fontSize: 12, color: greyText),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi helper untuk merender setiap item menu
  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? trailingText,
    bool showDivider = false,
  }) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(icon, color: darkGreen),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: darkGreen,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (trailingText != null) ...[
                  Text(
                    trailingText,
                    style: TextStyle(fontSize: 14, color: greyText),
                  ),
                  const SizedBox(width: 8),
                ],
                Icon(Icons.chevron_right, color: greyText, size: 20),
              ],
            ),
            onTap: () {
              // --- NAVIGASI KE HALAMAN BARU ---
              // MaterialPageRoute mengurus animasi transisi halaman secara otomatis
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HalamanDetail(judul: title),
                ),
              );
            },
          ),
        ),
        if (showDivider)
          Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
      ],
    );
  }
}

// =====================================================================
// HALAMAN BARU (DUMMY) UNTUK MENERIMA NAVIGASI
// =====================================================================
class HalamanDetail extends StatelessWidget {
  final String judul;

  const HalamanDetail({super.key, required this.judul});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul, style: const TextStyle(color: Color(0xFF233A2D))),
        backgroundColor: const Color(0xFFFCFCF6),
        iconTheme: const IconThemeData(
          color: Color(0xFF233A2D),
        ), // Warna tombol 'Back' otomatis
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'Ini adalah isi dari halaman\n$judul',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xFF233A2D),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}