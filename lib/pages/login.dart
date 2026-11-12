import 'package:flutter/material.dart';
import 'register.dart'; // Menghubungkan ke halaman register

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool _rememberMe = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color darkGreen = const Color(0xFF344936);
    final Color lightGreen = const Color(0xFFC7D3C0);
    final Color bgColor = const Color(0xFFF3F1E8);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      maxWidth: 480,
                    ), // Membatasi lebar maksimum di layar besar/web
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // HEADER (Logo & Bantuan)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.menu_book_outlined,
                                    color: darkGreen,
                                    size: 26,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Literasiku',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: darkGreen,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(Icons.help_outline, color: darkGreen),
                            ],
                          ),
                        ),

                        // CARD HALAMAN BUKU
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    // Tulang Buku Sisi Kiri
                                    Container(
                                      width: 24,
                                      decoration: BoxDecoration(
                                        color: lightGreen,
                                        border: Border(
                                          left: BorderSide(
                                            color: darkGreen.withValues(
                                              alpha: 0.3,
                                            ),
                                            width: 4,
                                          ),
                                          right: BorderSide(
                                            color: darkGreen.withValues(
                                              alpha: 0.8,
                                            ),
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Form Login Sisi Kanan
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                          20,
                                          32,
                                          20,
                                          32,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'BAB PERTAMA',
                                              style: TextStyle(
                                                fontSize: 11,
                                                letterSpacing: 1.2,
                                                color: Colors.grey.shade700,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            Text(
                                              'Selamat Datang.',
                                              style: TextStyle(
                                                fontSize: 30,
                                                color: darkGreen,
                                                fontFamily: 'Times New Roman',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            Text(
                                              'Buka halaman baru untuk rasa ingin tahumu.',
                                              style: TextStyle(
                                                color: Colors.grey.shade700,
                                                fontSize: 13,
                                              ),
                                            ),
                                            const SizedBox(height: 24),

                                            // Alamat Email
                                            Text(
                                              'Alamat email',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                color: Colors.grey.shade800,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            TextFormField(
                                              controller: _emailController,
                                              decoration: InputDecoration(
                                                hintText: 'nama@email.com',
                                                hintStyle: TextStyle(
                                                  color: Colors.grey.shade400,
                                                  fontSize: 14,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  borderSide: BorderSide(
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            6,
                                                          ),
                                                      borderSide: BorderSide(
                                                        color: Colors
                                                            .grey
                                                            .shade300,
                                                      ),
                                                    ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 14,
                                                      vertical: 14,
                                                    ),
                                              ),
                                            ),
                                            const SizedBox(height: 16),

                                            // Kata Sandi
                                            Text(
                                              'Kata sandi',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                color: Colors.grey.shade800,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            TextFormField(
                                              controller: _passwordController,
                                              obscureText: _obscureText,
                                              decoration: InputDecoration(
                                                hintText: 'Masukkan kata sandi',
                                                hintStyle: TextStyle(
                                                  color: Colors.grey.shade400,
                                                  fontSize: 14,
                                                ),
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    _obscureText
                                                        ? Icons
                                                              .visibility_off_outlined
                                                        : Icons
                                                              .visibility_outlined,
                                                    color: Colors.grey,
                                                    size: 20,
                                                  ),
                                                  onPressed: () => setState(
                                                    () => _obscureText =
                                                        !_obscureText,
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  borderSide: BorderSide(
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            6,
                                                          ),
                                                      borderSide: BorderSide(
                                                        color: Colors
                                                            .grey
                                                            .shade300,
                                                      ),
                                                    ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 14,
                                                      vertical: 14,
                                                    ),
                                              ),
                                            ),
                                            const SizedBox(height: 12),

                                            // Ingat saya & Lupa Sandi
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 18,
                                                      height: 18,
                                                      child: Checkbox(
                                                        value: _rememberMe,
                                                        onChanged: (val) =>
                                                            setState(
                                                              () =>
                                                                  _rememberMe =
                                                                      val!,
                                                            ),
                                                        activeColor: darkGreen,
                                                        side: BorderSide(
                                                          color: Colors
                                                              .grey
                                                              .shade400,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      'Ingat saya',
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey
                                                            .shade700,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                    padding: EdgeInsets.zero,
                                                    minimumSize: Size.zero,
                                                  ),
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Lupa kata sandi?',
                                                    style: TextStyle(
                                                      color:
                                                          Colors.grey.shade700,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),

                                            // Tombol Masuk
                                            SizedBox(
                                              width: double.infinity,
                                              height: 48,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: darkGreen,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          6,
                                                        ),
                                                  ),
                                                  elevation: 0,
                                                ),
                                                onPressed: () {
                                                  Navigator.pushReplacementNamed(context, '/');
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Text(
                                                      'Masuk',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Icon(
                                                      Icons.arrow_forward,
                                                      color: Colors.white,
                                                      size: 18,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 16),

                                            // Navigasi ke Daftar
                                            Center(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const RegisterPage(),
                                                    ),
                                                  );
                                                },
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: 'Belum punya akun? ',
                                                    style: TextStyle(
                                                      color:
                                                          Colors.grey.shade600,
                                                      fontSize: 13,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: 'Daftar',
                                                        style: TextStyle(
                                                          color: darkGreen,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
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
                            ),

                            // Pita Pembatas Buku (Bookmark)
                            Positioned(
                              top: 0,
                              right: 35,
                              child: Icon(
                                Icons.bookmark,
                                color: darkGreen,
                                size: 48,
                              ),
                            ),
                          ],
                        ),

                        // FOOTER BAWAH
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 24.0,
                            bottom: 10.0,
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Pencarian buku edukasi & literasi',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Temukan bacaan, tumbuhkan gagasan.',
                                style: TextStyle(
                                  fontFamily: 'Times New Roman',
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey.shade700,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
