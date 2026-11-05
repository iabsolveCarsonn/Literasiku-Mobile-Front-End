# Proyek Mobile Front-End UTS - Literasiku

Aplikasi Mobile Literasiku dibuat menggunakan Flutter untuk keperluan Ujian Tengah Semester (UTS) Mata Kuliah Front End Mobile.

## 📁 Struktur Halaman (Pages)

Halaman aplikasi diletakkan di dalam folder `lib/pages/`:
- `lib/pages/login.dart` : Halaman Login / Masuk
- `lib/pages/home.dart` : Halaman Beranda / Katalog Utama
- `lib/pages/daftarpencarian.dart` : Halaman Pencarian & Hasil Filter Buku
- `lib/pages/detailbuku.dart` : Halaman Informasi Detail Buku
- `lib/pages/akun.dart` : Halaman Profil / Akun Pengguna

## 📂 Struktur Folder Proyek

```text
literasiku/
├── lib/
│   ├── models/          # Model data (misal: Buku, User)
│   ├── pages/           # Halaman tampilan antarmuka (UI)
│   │   ├── akun.dart
│   │   ├── daftarpencarian.dart
│   │   ├── detailbuku.dart
│   │   ├── home.dart
│   │   └── login.dart
│   ├── services/        # Komunikasi API / database / storage
│   ├── widgets/         # Komponen reusable (Button kustom, Card, dsb)
│   └── main.dart        # Titik masuk utama aplikasi (Entry Point)
├── pubspec.yaml         # Dependensi dan aset Flutter
└── README.md
```

## 🚀 Cara Menjalankan

1. Pastikan Flutter SDK sudah terpasang di komputer Anda.
2. Jalankan perintah:
   ```bash
   flutter run
   ```
