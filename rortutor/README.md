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

# Tugas 8

<details>
  <summary>Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!</summary>

Navigator.push() dan Navigator.pushReplacement() adalah dua metode dalam Flutter yang digunakan untuk berpindah antar halaman (route). Perbedaan utama antara kedua metode tersebut adalah bagaimana mereka mempengaruhi stack navigasi.

1. **Navigator.push()**

   Metode ini digunakan untuk menambahkan route baru ke atas stack navigasi. Artinya, ketika kita berpindah ke halaman baru menggunakan Navigator.push(), halaman sebelumnya tetap tersimpan dalam stack dan kita bisa kembali ke halaman tersebut dengan menggunakan Navigator.pop().

   Contoh penggunaan Navigator.push():
   
   ```dart
   Navigator.push(
     context,
     MaterialPageRoute(builder: (context) => SecondRoute()),
   );
   ```
   Pada contoh di atas, kita berpindah dari halaman awal ke halaman 'SecondRoute'. Jika kita ingin kembali ke halaman awal, kita bisa memanggil Navigator.pop(context). 

2. **Navigator.pushReplacement()**

   Berbeda dengan Navigator.push(), metode Navigator.pushReplacement() menggantikan route saat ini dengan route baru dalam stack navigasi. Artinya, halaman sebelumnya akan dihapus dari stack dan kita tidak bisa kembali ke halaman tersebut dengan menggunakan Navigator.pop().

   Contoh penggunaan Navigator.pushReplacement():

   ```dart
   Navigator.pushReplacement(
     context,
     MaterialPageRoute(builder: (context) => SecondRoute()),
   );
   ```
   Pada contoh di atas, kita berpindah dari halaman awal ke halaman 'SecondRoute', tetapi halaman awal akan dihapus dari stack. Jadi, jika kita memanggil Navigator.pop(context), kita tidak akan kembali ke halaman awal.


   Salah satu kasus penggunaan umum Navigator.pushReplacement() adalah saat kita ingin mencegah pengguna kembali ke halaman login setelah berhasil login.

Dengan memahami perbedaan antara Navigator.push() dan Navigator.pushReplacement(), kita bisa memilih metode yang paling sesuai untuk digunakan dalam berbagai situasi saat membuat aplikasi Flutter.
</details>

<details>
  <summary> Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!</summary>

  Berikut ini adalah penjelasan beberapa widget layout pada Flutter:

| Widget | Deskripsi | Konteks Penggunaan |
| --- | --- | --- |
| `Container` | Widget yang menambahkan padding, margin, border, warna latar belakang, atau dekorasi lainnya ke widget anaknya. | Digunakan saat Anda ingin mengontrol detail tata letak yang spesifik seperti warna latar belakang, padding, dan lainnya. |
| `Row` dan `Column` | Widget yang mengatur widget anaknya secara horizontal (`Row`) atau vertikal (`Column`). | Digunakan saat Anda ingin mengatur sekelompok widget dalam arah horizontal atau vertikal. |
| `Stack` | Widget yang mengatur widget anaknya di atas widget dasar. Widget anak dapat benar-benar atau sebagian tumpang tindih dengan widget dasar. | Digunakan saat Anda ingin meletakkan satu widget di atas widget lainnya, seperti overlay atau efek tumpukan. |
| `ListView` | Widget yang mirip kolom, secara otomatis menyediakan scrolling ketika kontennya terlalu panjang untuk kotak render-nya. | Digunakan saat Anda memiliki sejumlah widget yang harus ditampilkan dalam daftar scrollable. |
| `Card` | Menerima satu anak, tetapi anak tersebut bisa berupa `Row`, `Column`, atau widget lain yang memegang daftar anak-anak. | Digunakan untuk menampilkan informasi dalam blok dengan pencahayaan dan elevasi. |
| `ListTile` | Widget khusus dari Material library, digunakan untuk membuat baris yang berisi hingga 3 baris teks dan ikon leading dan trailing opsional. | Biasanya digunakan dalam `Card` atau `ListView`, tetapi bisa digunakan di tempat lain. |
| `Table` | Widget yang mengatur kontennya dalam baris dan kolom. | Digunakan saat Anda ingin menampilkan data dalam format tabel. |
| `SizedBox` | Widget yang digunakan untuk membuat dimensi yang tepat. Saat `SizedBox` membungkus widget, ia mengubah ukuran widget menggunakan properti `height` dan `width`. | Digunakan saat Anda ingin memberikan ukuran yang spesifik atau ruang kosong pada tata letak. |
| `Flexible` | Widget yang membungkus widget lain, membuat widget tersebut menjadi resizable. | Digunakan dalam `Row` atau `Column` saat Anda ingin widget anak memanfaatkan ruang yang tersedia. |
| `AspectRatio` | Widget yang mencoba mengubah ukuran anaknya ke rasio aspek yang spesifik. | Digunakan saat Anda ingin mempertahankan rasio aspek antara lebar dan tinggi widget. |
| `Align` | Widget yang mengatur anaknya dalam dirinya sendiri dan secara opsional menentukan ukuran dirinya sendiri berdasarkan ukuran anaknya. | Digunakan saat Anda ingin mengatur posisi widget anak dalam widget induknya. |
| `LayoutBuilder` | Widget yang membangun widget berdasarkan batasan BoxConstraint dari widget induknya. | Digunakan saat Anda ingin membuat tata letak responsif yang dapat beradaptasi dengan ukuran induknya. |
</details>

<details>
  <summary>Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!</summary>

  Pada form yang kita buat, terdapat tiga elemen input, yaitu:

1. Nama Item
2. Harga
3. Deskripsi

Setiap elemen input ini direpresentasikan dengan widget `TextFormField` yang memungkinkan pengguna untuk memasukkan teks.

**Nama Item**

Elemen input ini digunakan untuk memasukkan nama item. Kita menggunakan widget `TextFormField` dengan atribut `onChanged` dan `validator`. `onChanged` digunakan untuk memperbarui nilai variabel `_name` setiap kali ada perubahan pada isi `TextFormField`. `validator` digunakan untuk memeriksa apakah input dari pengguna valid atau tidak. Dalam kasus ini, kita memeriksa apakah input kosong atau tidak.

```dart
TextFormField(
  decoration: InputDecoration(
    hintText: "Nama Item",
    labelText: "Nama Item",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  onChanged: (String? value) {
    setState(() {
      _name = value!;
    });
  },
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Nama tidak boleh kosong!";
    }
    return null;
  },
),
```

**Harga**

Elemen input ini digunakan untuk memasukkan harga produk. Sama seperti elemen input nama produk, kita menggunakan widget `TextFormField` dengan atribut `onChanged` dan `validator`. Kali ini, selain memeriksa apakah input kosong atau tidak, kita juga memeriksa apakah input dapat dikonversi menjadi angka atau tidak.

```dart
TextFormField(
  decoration: InputDecoration(
    hintText: "Harga",
    labelText: "Harga",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  onChanged: (String? value) {
    setState(() {
      _price = int.parse(value!);
    });
  },
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Harga tidak boleh kosong!";
    }
    if (int.tryParse(value) == null) {
      return "Harga harus berupa angka!";
    }
    return null;
  },
),
```

**Deskripsi**

Elemen input ini digunakan untuk memasukkan deskripsi produk. Kita menggunakan widget `TextFormField` dengan atribut `onChanged` dan `validator` untuk memperbarui nilai variabel `_description` dan memeriksa apakah input kosong atau tidak.

```dart
TextFormField(
  decoration: InputDecoration(
    hintText: "Deskripsi",
    labelText: "Deskripsi",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  onChanged: (String? value) {
    setState(() {
      _description = value!;
    });
  },
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Deskripsi tidak boleh kosong!";
    }
    return null;
  },
),
```
</details>

<details>
  <summary>Bagaimana penerapan clean architecture pada aplikasi Flutter?</summary>

Penerapan clean architecture dalam aplikasi Flutter melibatkan pembagian kode menjadi beberapa lapisan yang berbeda, dengan setiap lapisan memiliki tanggung jawab dan tujuan sendiri. Lapisan ini biasanya mencakup lapisan data, lapisan domain, dan lapisan presentasi.

Berikut adalah langkah-langkah penerapan clean architecture dalam aplikasi Flutter:

1. **Lapisan Data**: Lapisan ini terletak pada lapisan paling luar. Lapisan ini terdiri dari kode sumber data seperti Rest API, database lokal, Firebase, atau sumber lainnya. Juga kode platform yang membangun tampilan aplikasi (widgets).

2. **Lapisan Domain**: Lapisan ini berisi entitas, use cases, dan interfaces repositori. Mulai dengan menulis entitas seperti `weather.dart`, kemudian buat kode untuk repositori seperti `weather_repository.dart`. Repositori ini merupakan sebuah abstract class dan akan diimplementasikan nanti pada lapisan data. Setelah itu, buat kode untuk use case seperti `get_current_weather.dart`[Source 0].

3. **Lapisan Presentasi**: Lapisan ini mencakup manajemen state (BLoC) dan halaman (Pages). Untuk BLoC, buat kode state management seperti `weather_state.dart`, `weather_event.dart`, dan `weather_bloc.dart`. Untuk Pages, buat kode untuk pages atau UI dari aplikasi seperti `weather_page.dart`[Source 0].

4. **Penulisan Kode Testing**: Untuk setiap lapisan dan fitur yang telah dibuat, buat kode testing yang sesuai. Misalnya, untuk use case `get_current_weather.dart`, buat kode testing `get_current_weather_test.dart`. Jalankan testing untuk memastikan kode berfungsi sebagaimana mestinya[Source 0].

5. **Mengintegrasikan Lapisan**: Setelah semua lapisan dan fitur dibuat dan diuji, lapisan-lapisan tersebut perlu diintegrasikan. Misalnya, dalam kode presentasi, Anda dapat membuat `StreamBuilder` yang memanfaatkan use case dari lapisan domain untuk memperbarui tampilan pengguna berdasarkan data yang diterima dari lapisan data[Source 2].

6. **Struktur Proyek**: Untuk memudahkan navigasi dan pemahaman kode, Anda bisa mengorganisasikan kode dalam struktur folder tertentu. Misalnya, Anda bisa membuat folder `core` yang berisi lapisan data & domain, dan folder `feature` untuk lapisan presentasi.
</details>

<details>
  <summary>Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)</summary>
 
Untuk menambahkan drawer menu di aplikasi Flutter, kita dapat mengikuti langkah-langkah berikut:

1. **Membuat class LeftDrawer**: Pertama, buat berkas baru `left_drawer.dart` di dalam direktori `widgets`. Di dalam berkas ini, buatlah class `LeftDrawer` yang merupakan turunan dari `StatelessWidget`. Di dalam method `build`, return sebuah `Drawer` yang memiliki `ListView` sebagai child. `ListView` ini akan berisi `DrawerHeader` dan `ListTile` untuk setiap halaman yang ingin kita navigasikan.

```dart
import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // TODO: Bagian drawer header
          ),
          // TODO: Bagian routing
        ],
      ),
    );
  }
}
```

2. **Menambahkan navigasi ke halaman**: Selanjutnya, impor halaman yang ingin kita masukkan navigasinya ke dalam `Drawer` menu. Pada contoh ini, kita akan menambahkan navigasi ke halaman `MyHomePage` dan `ShopFormPage`.

```dart
import 'package:flutter/material.dart';
import 'package:rortutor/menu.dart';
// TODO: Impor halaman ShopFormPage jika sudah dibuat
```

3. **Menambahkan routing**: Setelah berhasil impor, kita akan memasukkan routing untuk halaman-halaman yang kita impor ke bagian `TODO: Bagian routing`.

```dart
ListTile(
  leading: const Icon(Icons.home_outlined),
  title: const Text('Halaman Utama'),
  // Bagian redirection ke MyHomePage
  onTap: () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
  },
),
ListTile(
  leading: const Icon(Icons.add_shopping_cart),
  title: const Text('Tambah Item'),
  // Bagian redirection ke ShopFormPage
  onTap: () {
    /*
    TODO: Buatlah routing ke ShopFormPage di sini,
    setelah halaman ShopFormPage sudah dibuat.
    */
  },
),
```

4. **Menghias drawer**: Selanjutnya, kita akan menghias drawer kita dengan memasukkan drawer header di `TODO: Bagian drawer header`.

```dart
const DrawerHeader(
  decoration: BoxDecoration(
    color: Colors.indigo,
  ),
  child: Column(
    children: [
      Text(
        'RORTUTOR',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Padding(padding: EdgeInsets.all(10)),
      Text("Catat seluruh keperluan belanjamu di sini!",
          // TODO: Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
          ),
    ],
  ),
),
```

5. **Menambahkan drawer ke halaman**: Sekarang, masukkan drawer tersebut ke halaman yang ingin kamu tambahkan drawer. Untuk poin ini, kami akan berikan contoh untuk memasukkan ke halaman `menu.dart`.

```dart
// Impor drawer widget
import 'package:rortutor/widgets/left_drawer.dart';
...
return Scaffold(
  appBar: AppBar(
    title: const Text(
      'RORTUTOR',
    ),
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
  ),
  // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
  drawer: const LeftDrawer(),
)
...
```
6. **Menambahkan Bonus**

1. **Impor Paket dan Berkas:**
   - Mengimpor paket `flutter/material.dart`.
   - Mengimpor dua paket kustom (`left_drawer.dart` dan `product_list.dart`).
   - Membuat kelas `ShopFormPage` yang merupakan StatefulWidget.

2. **Membuat State:**
   - Membuat state class `_ShopFormPageState` yang meng-extend `State<ShopFormPage>`.

3. **Membuat GlobalKey dan Variabel Form:**
   - Membuat `GlobalKey<FormState>` dengan nama `_formKey`.
   - Mendeklarasikan variabel `_name`, `_price`, dan `_description` yang akan digunakan untuk menyimpan input pengguna.

4. **Membuat Widget Build:**
   - Membuat method `build` untuk merender tampilan form.
   - Menambahkan Scaffold dengan AppBar dan judul 'Form Tambah Item'.
   - Menambahkan drawer yang telah dibuat sebelumnya.
   - Membuat widget Form dengan key `_formKey` untuk validasi form.

5. **Membuat Input Fields:**
   - Membuat TextFormField untuk nama item, harga, dan deskripsi.
   - Mengaitkan setiap TextFormField dengan metode onChanged untuk menyimpan nilai ke dalam variabel yang sesuai.
   - Menambahkan validasi untuk memastikan bahwa input tidak boleh kosong dan sesuai dengan tipe data yang diharapkan.

6. **Membuat Button Simpan:**
   - Menambahkan ElevatedButton di bagian bawah form.
   - Menetapkan aksi onPressed untuk menyimpan data jika formulir valid.
   - Setelah berhasil menyimpan, menampilkan AlertDialog dengan informasi produk yang disimpan.
   - Menambahkan reset formulir setelah menyimpan.

7. **Menampilkan Produk yang Tersimpan:**
   - Setelah menyimpan produk, menambahkannya ke dalam daftar produk (`ProductListPage.products`).
   - Menampilkan AlertDialog dengan informasi produk yang baru disimpan (nama, harga, deskripsi).

8. **Reset Formulir:**
   - Menggunakan `_formKey.currentState!.reset()` untuk mereset formulir setelah menyimpan.

9. **Tambahan:**
   - Menampilkan drawer yang telah dibuat sebelumnya di bagian kiri halaman.


</details>