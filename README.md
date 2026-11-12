# 📚 Literasiku - Aplikasi Katalog & Koleksi Bacaan

Aplikasi Mobile **Literasiku** dibuat menggunakan **Flutter** untuk keperluan Ujian Tengah Semester (UTS) Mata Kuliah **Front-End Mobile**. Aplikasi ini dirancang dengan tema *earthy & editorial* menggunakan **Material Design 3**, font **Inter** & **Cormorant Garamond**, serta tata letak responsif.

---

## ✨ Fitur Utama

1. **Autentikasi Pengguna (`login.dart` & `register.dart`)**
   - Masuk (*Login*) dengan validasi input dan penyimpanan akun *in-memory* (`DummyAuth`).
   - Pendaftaran akun baru (*Register*) dengan validasi panjang kata sandi, konfirmasi kata sandi, dan persetujuan syarat & ketentuan.
   - **Akun Demo Default:**
     - **Email:** `ayu.pratiwi@email.com`
     - **Password:** `ayu12345678`

2. **Beranda / Katalog Utama (`home.dart`)**
   - Menampilkan sapaan pengguna, kutipan literasi, rekomendasi buku pilihan (*featured book*), dan daftar koleksi buku populer.
   - Mendukung tampilan responsif (*mobile* & *tablet*) menggunakan `LayoutBuilder`.

3. **Pencarian & Filter Buku (`daftarpencarian.dart`)**
   - Pencarian buku secara *real-time* berdasarkan judul atau penulis.
   - Filter interaktif menggunakan *Modal Bottom Sheet* berdasarkan **Genre** (`Esai`, `Pendidikan`, `Literasi`), **Tingkat Pendidikan** (`Umum`, `SMA/SMK`, `Perguruan Tinggi`), dan **Tahun Terbit** (`2023`–`2025`).
   - Fitur *toggle bookmark* langsung dari daftar hasil pencarian.

4. **Rak Personal / Bookmark (`bookmark.dart`)**
   - Menampilkan daftar buku yang telah disimpan ke dalam koleksi pribadi pengguna.
   - Terintegrasi secara sinkron dengan halaman Pencarian dan Detail Buku melalui `BookRepository`.

5. **Detail Buku (`detailbuku.dart`)**
   - Menyajikan sampul buku, judul, penulis, rating, kategori, tahun terbit, tingkat pendidikan, serta sinopsis lengkap per buku.
   - Tombol interaktif untuk menyimpan atau menghapus buku dari *Bookmark*.

6. **Profil & Akun Pengguna (`akun.dart`)**
   - Menampilkan informasi profil pengguna, statistik bacaan, preferensi pengaturan akun, dan tombol keluar (*Logout*).

7. **Navigasi Terpusat (`main_navigation.dart`)**
   - Menggunakan `IndexedStack` dan `NavigationBar` (Material 3) dengan 4 tab utama (**Home**, **Search**, **Bookmark**, **Acc**) agar perpindahan antarhalaman mulus dan status data tetap terjaga.

---

## 📁 Struktur Halaman & File (`lib/`)

- `lib/main.dart` : Titik masuk utama aplikasi (*Entry Point*) dan konfigurasi tema Material 3.
- `lib/book.dart` : Model data buku (`BookItem`).
- `lib/book_repisitory.dart` : Penyimpanan data katalog buku terpusat (`BookRepository`).
- `lib/footer.dart` : Komponen *Bottom Navigation Bar* tambahan (`Footer`).
- `lib/navigation/main_navigation.dart` : Pengatur *routing* (`AppRoutes`) dan kerangka utama navigasi 4 tab (`MainNavigation`).
- `lib/pages/` :
  - `login.dart` : Halaman Masuk (*Login*) & `DummyAuth`
  - `register.dart` : Halaman Daftar Akun (*Register*)
  - `home.dart` : Halaman Beranda / Katalog Utama
  - `daftarpencarian.dart` : Halaman Pencarian & Filter Buku
  - `bookmark.dart` : Halaman Rak Personal / Koleksi Tersimpan
  - `detailbuku.dart` : Halaman Informasi Detail & Sinopsis Buku
  - `akun.dart` : Halaman Profil / Akun Pengguna

---

## 📂 Struktur Folder Proyek

```text
literasiku/
├── assets/
│   ├── fonts/                       # Font kustom (Inter & Cormorant Garamond)
│   │   ├── CormorantGaramond-*.ttf
│   │   └── Inter-*.ttf
│   └── images/                      # Aset gambar sampul buku & ikon aplikasi
│       ├── belajar_cara_belajar.png
│       ├── book-Logo-literasiku.png
│       ├── Checklist-Icon.png
│       ├── Literasiku · Pencarian.png
│       ├── merawat_kata.png
│       └── seni_menikmati_sepi.png
├── lib/
│   ├── navigation/
│   │   └── main_navigation.dart     # Navigasi pusat & konfigurasi route
│   ├── pages/                       # Halaman tampilan antarmuka (UI)
│   │   ├── akun.dart
│   │   ├── bookmark.dart
│   │   ├── daftarpencarian.dart
│   │   ├── detailbuku.dart
│   │   ├── home.dart
│   │   ├── login.dart
│   │   └── register.dart
│   ├── book.dart                    # Model data BookItem
│   ├── book_repisitory.dart         # Data repository buku
│   ├── footer.dart                  # Widget navigasi bawah
│   └── main.dart                    # Entry point aplikasi
├── KetentuanProject.md              # Dokumentasi ketentuan tugas UTS
├── pubspec.yaml                     # Konfigurasi dependensi, font, dan aset Flutter
└── README.md                        # Dokumentasi proyek
```

---

## 🛠️ Penerapan Konsep Flutter (Ketentuan UTS)

- **Flutter Fundamentals:** Penggunaan `Scaffold`, `SafeArea`, `StatefulWidget`, dan `StatelessWidget`.
- **Flutter UI Components:** `Text`, `Icon`, `Image.asset`, `RichText`, `CircleAvatar`, `TextField`, `SnackBar`, dan *Reusable Widget*.
- **Material Design 3 & Tema:** Palet warna hijau *sage/forest* (`#344936`) dan latar krem hangat (`#FFFEFA`), tipografi `Inter` & `Cormorant Garamond`, serta `NavigationBar` Material 3.
- **Flutter Layout & Multi-Child Layout:** `Row`, `Column`, `ListView`, `SingleChildScrollView`, `Stack`, `Expanded`, `Wrap`, `Container`, `Padding`, `SizedBox`, dan `IndexedStack`.
- **Responsive & Adaptive UI:** Adaptasi ukuran layar dan *padding* menggunakan `LayoutBuilder` serta `MediaQuery`.

---

## 🚀 Cara Menjalankan Aplikasi

1. Pastikan **Flutter SDK** (`^3.11.0`) sudah terpasang di komputer Anda.
2. Masuk ke direktori proyek `literasiku`:
   ```bash
   cd literasiku
   ```
3. Unduh seluruh paket dependensi:
   ```bash
   flutter pub get
   ```
4. Jalankan aplikasi di emulator atau perangkat yang terhubung:
   ```bash
   flutter run
   ```
