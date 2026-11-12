import 'package:flutter/material.dart';
import 'login.dart'; // Mengakses DummyAuth

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeTerms = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showMessage('Semua kolom wajib diisi.', isError: true);
      return;
    }

    if (password.length < 8) {
      _showMessage('Kata sandi minimal 8 karakter.', isError: true);
      return;
    }

    if (password != confirmPassword) {
      _showMessage('Konfirmasi kata sandi tidak cocok.', isError: true);
      return;
    }

    if (!_agreeTerms) {
      _showMessage(
        'Harap setujui Syarat & ketentuan terlebih dahulu.',
        isError: true,
      );
      return;
    }

    final success = DummyAuth.register(email, password);
    if (success) {
      _showMessage('Pendaftaran berhasil! Silakan masuk dengan akunmu.');
      Navigator.pop(context); // Kembali ke halaman Login
    } else {
      _showMessage('Email sudah terdaftar. Gunakan email lain.', isError: true);
    }
  }

  void _showMessage(String text, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: isError ? Colors.redAccent : const Color(0xFF344936),
      ),
    );
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
                    constraints: const BoxConstraints(maxWidth: 480),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
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
                                            color: darkGreen.withOpacity(0.3),
                                            width: 4,
                                          ),
                                          right: BorderSide(
                                            color: darkGreen.withOpacity(0.8),
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Form Register Sisi Kanan
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                          20,
                                          28,
                                          20,
                                          28,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.menu_book_outlined,
                                                  color: darkGreen,
                                                  size: 22,
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  'Literasiku',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: darkGreen,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:
                                                        'Times New Roman',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 16),
                                            Text(
                                              'BUKU BARU, CERITA BARU',
                                              style: TextStyle(
                                                fontSize: 10,
                                                letterSpacing: 1.1,
                                                color: Colors.grey.shade700,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              'Mulai ceritamu.',
                                              style: TextStyle(
                                                fontSize: 28,
                                                color: darkGreen,
                                                fontFamily: 'Times New Roman',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              'Daftar untuk menemukan buku yang menemani proses belajarmu.',
                                              style: TextStyle(
                                                color: Colors.grey.shade700,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(height: 20),

                                            // Nama Lengkap
                                            Text(
                                              'Nama lengkap',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.grey.shade800,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            TextFormField(
                                              controller: _nameController,
                                              decoration: InputDecoration(
                                                hintText: 'Nama lengkapmu',
                                                hintStyle: TextStyle(
                                                  color: Colors.grey.shade400,
                                                  fontSize: 13,
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
                                                      horizontal: 12,
                                                      vertical: 12,
                                                    ),
                                              ),
                                            ),
                                            const SizedBox(height: 14),

                                            // Alamat Email
                                            Text(
                                              'Alamat email',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.grey.shade800,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            TextFormField(
                                              controller: _emailController,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              decoration: InputDecoration(
                                                hintText: 'nama@email.com',
                                                hintStyle: TextStyle(
                                                  color: Colors.grey.shade400,
                                                  fontSize: 13,
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
                                                      horizontal: 12,
                                                      vertical: 12,
                                                    ),
                                              ),
                                            ),
                                            const SizedBox(height: 14),

                                            // Kata Sandi
                                            Text(
                                              'Kata sandi',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.grey.shade800,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            TextFormField(
                                              controller: _passwordController,
                                              obscureText: _obscurePassword,
                                              decoration: InputDecoration(
                                                hintText: 'Buat kata sandi',
                                                hintStyle: TextStyle(
                                                  color: Colors.grey.shade400,
                                                  fontSize: 13,
                                                ),
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    _obscurePassword
                                                        ? Icons
                                                              .visibility_off_outlined
                                                        : Icons
                                                              .visibility_outlined,
                                                    color: Colors.grey,
                                                    size: 18,
                                                  ),
                                                  onPressed: () => setState(
                                                    () => _obscurePassword =
                                                        !_obscurePassword,
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
                                                      horizontal: 12,
                                                      vertical: 12,
                                                    ),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              'Minimal 8 karakter, gunakan huruf dan angka.',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey.shade600,
                                              ),
                                            ),
                                            const SizedBox(height: 14),

                                            // Konfirmasi Kata Sandi
                                            Text(
                                              'Konfirmasi kata sandi',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.grey.shade800,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            TextFormField(
                                              controller:
                                                  _confirmPasswordController,
                                              obscureText:
                                                  _obscureConfirmPassword,
                                              decoration: InputDecoration(
                                                hintText: 'Ulangi kata sandi',
                                                hintStyle: TextStyle(
                                                  color: Colors.grey.shade400,
                                                  fontSize: 13,
                                                ),
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    _obscureConfirmPassword
                                                        ? Icons
                                                              .visibility_off_outlined
                                                        : Icons
                                                              .visibility_outlined,
                                                    color: Colors.grey,
                                                    size: 18,
                                                  ),
                                                  onPressed: () => setState(
                                                    () => _obscureConfirmPassword =
                                                        !_obscureConfirmPassword,
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
                                                      horizontal: 12,
                                                      vertical: 12,
                                                    ),
                                              ),
                                            ),
                                            const SizedBox(height: 14),

                                            // Syarat & Ketentuan Checkbox
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 18,
                                                  height: 18,
                                                  child: Checkbox(
                                                    value: _agreeTerms,
                                                    onChanged: (val) =>
                                                        setState(
                                                          () => _agreeTerms =
                                                              val!,
                                                        ),
                                                    activeColor: darkGreen,
                                                    side: BorderSide(
                                                      color:
                                                          Colors.grey.shade400,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Expanded(
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: 'Saya menyetujui ',
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey
                                                            .shade700,
                                                        fontSize: 11,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              'Syarat & ketentuan',
                                                          style: TextStyle(
                                                            color: darkGreen,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        const TextSpan(
                                                          text: ' serta ',
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              'Kebijakan privasi',
                                                          style: TextStyle(
                                                            color: darkGreen,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        const TextSpan(
                                                          text: ' Opik.',
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),

                                            // Tombol Daftar
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
                                                onPressed: _handleRegister,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Text(
                                                      'Daftar',
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

                                            // Kembali ke Login
                                            Center(
                                              child: TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: 'Sudah punya akun? ',
                                                    style: TextStyle(
                                                      color:
                                                          Colors.grey.shade600,
                                                      fontSize: 12,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: 'Masuk',
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

                            // Pita Bookmark Kanan Bawah
                            Positioned(
                              bottom: 0,
                              right: 25,
                              child: Icon(
                                Icons.bookmark,
                                color: darkGreen,
                                size: 40,
                              ),
                            ),
                          ],
                        ),

                        // Footer Bawah
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0,
                            bottom: 10.0,
                          ),
                          child: Text(
                            'Satu akun, banyak jendela pengetahuan.',
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontStyle: FontStyle.italic,
                              color: Colors.grey.shade700,
                              fontSize: 14,
                            ),
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
