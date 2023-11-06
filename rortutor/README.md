## Nama    : Shafira Nurrohmah
## NPM     : 2206030035
## Kelas   : PBP C

# rortutor

# Tugas 7
<details>
<summary>Perbedaan antara Stateless dan Stateful Widget dalam Flutter</summary>

Stateless widget dan stateful widget adalah dua jenis widget yang digunakan dalam pengembangan aplikasi Flutter. Berikut adalah perbandingan antara keduanya:

| Ciri                       | Stateless Widget                               | Stateful Widget                                 |
|--------------------------- | ---------------------------------------------  | ----------------------------------------------  |
| **Keadaan (State)**        | Tidak memiliki keadaan (state) yang berubah.   | Memiliki keadaan (state) yang dapat berubah.    |
| **Perubahan Tampilan**     | Tampilan tidak berubah berdasarkan interaksi pengguna atau perubahan data. | Tampilan perlu berubah berdasarkan interaksi pengguna atau perubahan data. |
| **Data yang Dibutuhkan**   | Memerlukan data yang diberikan saat pembuatan widget dan tidak dapat diubah setelahnya. | Memerlukan data yang dapat berubah untuk mengupdate tampilan. |
| **Contoh**                 | Teks, gambar, tombol yang tidak berubah.       | Input pengguna, animasi, tampilan daftar yang dapat diubah. |


Stateless widget digunakan ketika tampilan tidak perlu berubah berdasarkan interaksi pengguna atau perubahan data. Contoh dari stateless widget adalah teks, gambar, dan tombol yang tidak berubah.

Sementara itu, stateful widget digunakan ketika tampilan perlu berubah berdasarkan interaksi pengguna atau perubahan data. Contoh dari stateful widget adalah input pengguna, animasi, dan tampilan daftar yang dapat diubah.
</details>

<details>
<summary>Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing!</summary>

| Widget               | Fungsi                                                                                                  |
|----------------------|---------------------------------------------------------------------------------------------------------|
| Material             | Memastikan aplikasi mengikuti desain material yang konsisten pada platform Android.                    |
| Scaffold             | Menyediakan kerangka dasar aplikasi dengan AppBar, body, dan floating action button.                    |
| SingleChildScrollView   | Memungkinkan konten discrollable jika melebihi ukuran layar untuk menghindari masalah overflow.          |
| Padding              | Menambahkan ruang di sekeliling widget untuk memperbaiki tata letak dan penampilan.                     |
| Column               | Menata widget-child secara vertikal dalam satu kolom.                                                   |
| GridView.count       | Menampilkan children dalam bentuk grid dengan jumlah baris dan kolom yang dapat disesuaikan.             |
| InkWell              | Membuat area responsif terhadap sentuhan, sering digunakan untuk menangani interaksi ketika disentuh.    |
| Text                 | Menampilkan teks di antarmuka pengguna.                                                                   |
| Icon                 | Menampilkan ikon yang membantu membuat antarmuka pengguna lebih informatif dan menarik.                  |
| SnackBar             | Menampilkan pesan singkat di bagian bawah layar, umumnya untuk memberikan informasi atau feedback.       |

Setiap widget memiliki perannya masing-masing dalam membangun tampilan dan fungsionalitas aplikasi Flutter. Tabel ini memberikan gambaran singkat tentang penggunaan dan fungsi setiap widget yang digunakan dalam tugas yang diberikan.
</details>
<details>
<summary>Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)</summary>

### Langkah 1: Membuat Proyek Flutter Baru

1. Buka Terminal atau Command Prompt.
2. Masuk ke direktori di mana proyek Flutter akan disimpan.
3. Generate proyek Flutter baru dengan perintah `flutter create rortutor`.
4. Masuk ke dalam direktori proyek tersebut dengan perintah `cd rortutor`.

### Menjalankan Proyek

- Untuk menjalankan proyek, gunakan perintah `flutter run`.
- Untuk pengguna macOS, ada beberapa opsi untuk menjalankan aplikasi Flutter: menggunakan emulator di Android Studio atau menggunakan Google Chrome.
- Untuk menjalankan aplikasi di Google Chrome, jalankan perintah `flutter config --enable-web` dan kemudian `flutter run -d chrome`.

### Git Initialization dan Push ke GitHub

1. Lakukan `git init` pada root folder proyek.
2. Tambahkan, commit, dan push proyek ke repositori baru di GitHub dengan perintah sesuai langkah-langkah GitHub.
3. Nama repositori bisa disesuaikan dengan `rortutor`.

### Merapikan Struktur Proyek

1. Buat file baru bernama `menu.dart` dalam direktori `rortutor/lib`.
2. Pindahkan kode dari file `main.dart` ke file `menu.dart`.
3. Tambahkan `import 'package:shopping_list/menu.dart';` di awal file `main.dart` untuk memperbaiki kesalahan.
4. Pastikan aplikasi tetap berjalan dengan baik.

### Membuat Widget Sederhana pada Flutter

1. Buka file `main.dart`.
2. Ubah warna tema aplikasi menjadi indigo dengan kode `colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),`.
3. Ubah sifat widget halaman menjadi stateless di `main.dart` dan `menu.dart`.
4. Tambahkan daftar item yang dijual dalam kelas `ShopItem`.
5. Tambahkan kode untuk menampilkan teks dan kartu produk.
6. Buat widget stateless baru `ShopCard` untuk menampilkan kartu produk.
7. Ubah warna tombol berdasarkan variabel warna dalam kelas `ShopItem`.
8. Jalankan proyek dan pastikan bahwa tampilan sudah menampilkan perubahan.

### Untuk mengganti warna tombol pada setiap item dalam daftar, kita perlu menyesuaikan tata letak widget dan menerapkan properti `color` dari `ShopItem` ke dalam kode pembuatan widget.
1. **Tetapkan Warna pada ShopItem:**
    ```dart
    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Colors.pinkAccent),
        ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.blueAccent),
        ShopItem("Logout", Icons.logout, Colors.lightGreenAccent),
    ];
    ```

2. **Definisikan Warna pada ShopItem:**
    ```dart
    class ShopItem {
      final String name;
      final IconData icon;
      final Color color;

      ShopItem(this.name, this.icon, this.color);
    }
    ```

3. **Perbarui Bagian Tampilan Widget untuk Menggunakan Warna:**
    ```dart
    class ShopCard extends StatelessWidget {
      final ShopItem item;

      const ShopCard(this.item); // Constructor

      @override
      Widget build(BuildContext context) {
        return Material(
          color: item.color, // Gunakan warna dari ShopItem
          child: InkWell(
            // Area responsif terhadap sentuhan
            onTap: () {
              // Tampilkan SnackBar saat tombol diklik
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Text("Kamu telah menekan tombol ${item.name}!"),
                ));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      color: Colors.white, // Sesuaikan jika diperlukan
                      size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }
    ```
   </details>