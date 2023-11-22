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
| `Container` | Widget yang menambahkan padding, margin, border, warna latar belakang, atau dekorasi lainnya ke widget anaknya. | Digunakan saat kita ingin mengontrol detail tata letak yang spesifik seperti warna latar belakang, padding, dan lainnya. |
| `Row` dan `Column` | Widget yang mengatur widget anaknya secara horizontal (`Row`) atau vertikal (`Column`). | Digunakan saat kita ingin mengatur sekelompok widget dalam arah horizontal atau vertikal. |
| `Stack` | Widget yang mengatur widget anaknya di atas widget dasar. Widget anak dapat benar-benar atau sebagian tumpang tindih dengan widget dasar. | Digunakan saat kita ingin meletakkan satu widget di atas widget lainnya, seperti overlay atau efek tumpukan. |
| `ListView` | Widget yang mirip kolom, secara otomatis menyediakan scrolling ketika kontennya terlalu panjang untuk kotak render-nya. | Digunakan saat kita memiliki sejumlah widget yang harus ditampilkan dalam daftar scrollable. |
| `Card` | Menerima satu anak, tetapi anak tersebut bisa berupa `Row`, `Column`, atau widget lain yang memegang daftar anak-anak. | Digunakan untuk menampilkan informasi dalam blok dengan pencahayaan dan elevasi. |
| `ListTile` | Widget khusus dari Material library, digunakan untuk membuat baris yang berisi hingga 3 baris teks dan ikon leading dan trailing opsional. | Biasanya digunakan dalam `Card` atau `ListView`, tetapi bisa digunakan di tempat lain. |
| `Table` | Widget yang mengatur kontennya dalam baris dan kolom. | Digunakan saat kita ingin menampilkan data dalam format tabel. |
| `SizedBox` | Widget yang digunakan untuk membuat dimensi yang tepat. Saat `SizedBox` membungkus widget, ia mengubah ukuran widget menggunakan properti `height` dan `width`. | Digunakan saat kita ingin memberikan ukuran yang spesifik atau ruang kosong pada tata letak. |
| `Flexible` | Widget yang membungkus widget lain, membuat widget tersebut menjadi resizable. | Digunakan dalam `Row` atau `Column` saat kita ingin widget anak memanfaatkan ruang yang tersedia. |
| `AspectRatio` | Widget yang mencoba mengubah ukuran anaknya ke rasio aspek yang spesifik. | Digunakan saat kita ingin mempertahankan rasio aspek antara lebar dan tinggi widget. |
| `Align` | Widget yang mengatur anaknya dalam dirinya sendiri dan secara opsional menentukan ukuran dirinya sendiri berdasarkan ukuran anaknya. | Digunakan saat kita ingin mengatur posisi widget anak dalam widget induknya. |
| `LayoutBuilder` | Widget yang membangun widget berdasarkan batasan BoxConstraint dari widget induknya. | Digunakan saat kita ingin membuat tata letak responsif yang dapat beradaptasi dengan ukuran induknya. |
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

2. **Lapisan Domain**: Lapisan ini berisi entitas, use cases, dan interfaces repositori. Mulai dengan menulis entitas seperti `weather.dart`, kemudian buat kode untuk repositori seperti `weather_repository.dart`. Repositori ini merupakan sebuah abstract class dan akan diimplementasikan nanti pada lapisan data. Setelah itu, buat kode untuk use case seperti `get_current_weather.dart`.

3. **Lapisan Presentasi**: Lapisan ini mencakup manajemen state (BLoC) dan halaman (Pages). Untuk BLoC, buat kode state management seperti `weather_state.dart`, `weather_event.dart`, dan `weather_bloc.dart`. Untuk Pages, buat kode untuk pages atau UI dari aplikasi seperti `weather_page.dart`.

4. **Penulisan Kode Testing**: Untuk setiap lapisan dan fitur yang telah dibuat, buat kode testing yang sesuai. Misalnya, untuk use case `get_current_weather.dart`, buat kode testing `get_current_weather_test.dart`. Jalankan testing untuk memastikan kode berfungsi sebagaimana mestinya.

5. **Mengintegrasikan Lapisan**: Setelah semua lapisan dan fitur dibuat dan diuji, lapisan-lapisan tersebut perlu diintegrasikan. Misalnya, dalam kode presentasi, kita dapat membuat `StreamBuilder` yang memanfaatkan use case dari lapisan domain untuk memperbarui tampilan pengguna berdasarkan data yang diterima dari lapisan data.

6. **Struktur Proyek**: Untuk memudahkan navigasi dan pemahaman kode, kita bisa mengorganisasikan kode dalam struktur folder tertentu. Misalnya, kita bisa membuat folder `core` yang berisi lapisan data & domain, dan folder `feature` untuk lapisan presentasi.
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

# Tugas 9
<details>
<summary>Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?</summary>

Ya, kita dapat melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Kita dapat melakukan ini dengan menggunakan fungsi seperti json.loads() dalam Python atau JSON.parse() dalam JavaScript untuk mengubah string JSON menjadi objek atau struktur data yang dapat digunakan dalam bahasa pemrograman

Namun, meskipun kita dapat melakukan ini, bukan berarti ini adalah cara terbaik. Membuat model sebelum melakukan pengambilan data JSON memiliki beberapa keuntungan:

1. `Kejelasan Struktur Data`: Dengan mendefinisikan model, kita akan memiliki gambaran yang jelas tentang struktur data yang kita harapkan dari JSON. Ini akan memudahkan kita untuk menavigasi dan memanipulasi data tersebut.
2. `Validasi Data`: Model dapat digunakan untuk melakukan validasi data. kita dapat memastikan bahwa data yang kita terima dalam JSON sesuai dengan apa yang kita harapkan dalam model kita.
3. `Kesalahan Dapat Ditangani Lebih Baik`: Jika ada kesalahan dalam data JSON, seperti atribut yang hilang atau tipe data yang salah, model dapat membantu kita menangkap dan menangani kesalahan tersebut.
4. `Pemeliharaan Kode`: Model membuat kode kita lebih mudah dibaca dan dipelihara. Jika struktur data JSON berubah, kita hanya perlu memperbarui model kita, bukan setiap tempat di kode kita di mana kita mengakses data JSON 2.

Jadi, meskipun membuat model sebelum melakukan pengambilan data JSON memerlukan sedikit usaha lebih, manfaatnya dalam jangka panjang biasanya melebihi usaha tersebut.
</details>

<details>
<summary>Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.</summary>

CookieRequest dalam konteks pengembangan Flutter biasanya merujuk pada permintaan HTTP yang mencakup cookie dalam header permintaan. Cookie adalah potongan data kecil yang disimpan di perangkat pengguna dan dikirim kembali ke server setiap kali permintaan dibuat. Cookie sering digunakan untuk otentikasi pengguna, pelacakan sesi, dan penyimpanan preferensi pengguna/

Berikut adalah contoh sederhana bagaimana cara mengatur cookie dalam permintaan HTTP di Flutter:
.
```dart
var cookies = [
  'cookie1=value1',
  'cookie2=value2',
];

var headers = {
  'Cookie': cookies.join('; '),
};

var response = await http.get('https://www.example.com', headers: headers);
```

Dalam contoh di atas, kita membuat dua cookie dan menggabungkannya menjadi satu string dengan pemisah '; '. Kemudian, kita mengatur string cookie ini sebagai nilai dari header 'Cookie' dalam permintaan HTTP kita .

Membagikan instance CookieRequest ke semua komponen dalam aplikasi Flutter penting karena beberapa alasan:

- **Persistensi Sesi**: Cookie sering digunakan untuk melacak sesi pengguna. Dengan membagikan instance CookieRequest, kita dapat memastikan bahwa semua komponen dalam aplikasi kita menggunakan sesi yang sama.

- **Konsistensi Data**: Jika beberapa komponen dalam aplikasi kita memerlukan data yang sama (misalnya, data pengguna yang masuk), kita dapat menyimpan data ini dalam cookie dan membagikannya di antara semua komponen. Ini memastikan bahwa semua komponen kita memiliki akses ke data yang paling up-to-date dan konsisten.

- **Performa**: Dengan membagikan instance CookieRequest, kita dapat menghindari membuat permintaan HTTP tambahan untuk mengambil data yang sama. Ini dapat meningkatkan performa aplikasi kita.

</details>

<details>
<summary> Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.</summary>

Berikut adalah mekanisme untuk mengambil data dari JSON:

1. **Membuat model kustom:** kita dapat menggunakan situs web Quicktype untuk menghasilkan model kustom dari JSON kita. Model ini akan digunakan untuk memetakan data JSON ke dalam objek Dart yang bisa kita gunakan di aplikasi Flutter kita.

2. **Menambahkan dependensi HTTP:** Pada proyek Flutter kita, tambahkan dependensi `http` di file `pubspec.yaml`. Ini akan memungkinkan kita untuk melakukan permintaan HTTP untuk mendapatkan data JSON. kita juga perlu menambahkan izin internet pada file `AndroidManifest.xml` yang berada di `android/app/src/main/AndroidManifest.xml` dengan menambahkan kode berikut: `<uses-permission android:name="android.permission.INTERNET" />`.

3. **Melakukan Fetch Data:** Implementasikan fungsi asinkronus untuk mengirim permintaan HTTP dan mendapatkan data JSON. Berikut adalah contoh fungsi `fetchAlbum()` yang bisa kita tambahkan pada file `lib/screens/album_list.dart`:

```dart
Future<List<Album>> fetchAlbum() async {
  var url = Uri.parse('(Nama URL)');
  var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
  );

  // Melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // Melakukan konversi data json menjadi object Album
  List<Album> list_album = [];
  for (var d in data) {
      if (d != null) {
          list_album.add(Album.fromJson(d));
      }
  }
  return list_album;
}
```

4. **Menampilkan Data:** Kita dapat menggunakan widget `FutureBuilder` untuk menampilkan data yang telah di-fetch. Nilai `future` dari `FutureBuilder` adalah fungsi `fetchAlbum()`. Ketika fungsi ini dipanggil dan telah selesai melakukan proses, maka `snapshot` akan berisi `list_ablbum` yang di-return oleh fungsi tersebut. Kemudian, `snapshot.data` ini akan diolah untuk ditampilkan pada `ListView.builder`.

Contoh penggunaan `FutureBuilder` untuk menampilkan data:

```dart
FutureBuilder<List<Album>>(
  future: fetchAlbum(),
  builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(snapshot.data[index].title),
            subtitle: Text(snapshot.data[index].artist),
          );
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  },
)
```

Pada contoh di atas, kita menggunakan `ListView.builder` untuk menampilkan setiap album dalam bentuk `ListTile`. Jika data belum tersedia (misalnya, permintaan HTTP masih berlangsung), maka akan ditampilkan `CircularProgressIndicator` [Source 0](https://www.geeksforgeeks.org/flutter-fetching-json-data-using-http/).
</details>

<details>
<summary> Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.</summary>

Proses autentikasi pengguna dapat diuraikan sebagai berikut:

1. Pengguna memasukkan informasi akun mereka, termasuk nama pengguna dan kata sandi, pada halaman LoginPage di aplikasi Flutter.

2. Ketika pengguna menekan tombol login, fungsi login pada CookieRequest dipanggil. Fungsi ini mengirimkan permintaan HTTP ke URL proyek Django.

3. Di sisi Django, autentikasi dilakukan dengan memanggil fungsi `authenticate(username=username, password=password)` pada file views.py milik modul authentication.

4. Django kemudian memeriksa apakah user tidak sama dengan None dan apakah user masih aktif. Jika kedua kondisi ini terpenuhi, maka autentikasi berhasil.

5. Kembali ke aplikasi Flutter, jika permintaan berhasil dan pengguna berhasil login, pengguna akan diarahkan ke MyHomePage dan muncul pesan selamat datang menggunakan widget SnackBar.

Berikut adalah contoh kode untuk mengimplementasikan proses tersebut dalam Flutter dan Django:

Flutter:

```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

void loginUser(String username, String password) async {
  final response = await http.post(
    'your Django project URL',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, then parse the JSON.
    var jsonResponse = json.decode(response.body);
    if(jsonResponse["loggedIn"] == true){
      // redirect to MyHomePage and show SnackBar
    } else {
      // show error message
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
```


Django:

```python
from django.contrib.auth import authenticate
from django.http import JsonResponse

def login(request):
    data = json.loads(request.body)
    username = data.get("username")
    password = data.get("password")
    user = authenticate(request, username=username, password=password)
    if user is not None and user.is_active:
        return JsonResponse({"loggedIn": True})
    else:
        return JsonResponse({"loggedIn": False})
```

Harap dicatat bahwa kode di atas hanyalah contoh dasar dan mungkin perlu disesuaikan dengan kebutuhan spesifik kita. Misalnya, kita mungkin ingin menambahkan lebih banyak detail pengguna ke respons login, atau mengimplementasikan mekanisme token atau session untuk menjaga pengguna tetap masuk setelah mereka menutup aplikasi.

</details>

<details>
<summary>Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.</summary>
Berikut adalah parafrase dari informasi yang diberikan, dan tabel yang merangkum fungsi dan penjelasan implementasi untuk setiap widget:

| Widget         | Fungsi                                            | Penjelasan Implementasi                                                                                                               |
|----------------|-----------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| TextField      | Memungkinkan pengguna untuk memasukkan teks          | Digunakan untuk memasukkan nama pengguna dan kata sandi                                                                                                      |
| FutureBuilder  | Membangun widget secara asinkron                       | Mengelola status loading, error, dan data yang tersedia                                                                                         |
| ListView.builder | Membuat daftar yang dapat digulirkan                 | Menampilkan daftar album yang diambil                                                                                                      |
| Column        | Menyusun komponen secara vertikal                      | Menyusun detail album seperti nama, jumlah, dan deskripsi secara vertikal                                                                 |
| SizedBox       | Menambahkan ruang vertikal                                 | Menambahkan ruang antara berbagai informasi tentang album                                                                                             |

Parafrase:

1. **TextField**: Widget ini memungkinkan pengguna memasukkan teks ke dalam aplikasi. Ini biasanya digunakan untuk memasukkan kredensial pengguna seperti nama pengguna dan kata sandi.

2. **FutureBuilder**: Widget ini membangun widget lain secara asinkron. Ini berguna untuk mengelola keadaan loading, error, dan data yang tersedia.

3. **ListView.builder**: Widget ini membuat daftar item yang dapat digulirkan. Ini sering digunakan untuk menampilkan daftar data yang diambil dari suatu sumber, seperti daftar album.

4. **Column**: Widget ini menyusun anak-anaknya secara vertikal. Ini berguna untuk menyusun informasi detail tentang suatu objek, seperti nama album, jumlah, dan deskripsi, dalam daftar vertikal.

5. **SizedBox**: Widget ini menambahkan ruang vertikal dalam layout. Ini berguna untuk menambahkan ruang antara berbagai informasi tentang suatu objek, seperti album.
</details

<details>
<summary> Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).</summary>

Untuk membuat halaman login dan mengintegrasikan sistem autentikasi Django, berikut adalah langkah-langkah yang perlu Anda lakukan:

1. **Membuat Django App untuk Autentikasi**

   Pertama-tama, Anda perlu membuat aplikasi Django khusus untuk menangani proses autentikasi. Anda juga perlu menginstall library corsheaders untuk mengatasi masalah CORS jika aplikasi Anda diakses dari domain lain [Source 1](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Django/Authentication).

2. **Membuat Fungsi Login pada views.py**

   Di dalam aplikasi Django tersebut, Anda perlu membuat fungsi login pada `views.py` untuk menangani proses autentikasi login. Anda dapat menggunakan decorator `login_required` untuk membatasi akses ke view ini hanya untuk user yang sudah login. Jika user belum login, mereka akan di-redirect ke halaman login yang telah ditentukan di `settings.LOGIN_URL` [Source 1](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Django/Authentication).

   Contoh kode fungsi login:

   ```python
   from django.contrib.auth.decorators import login_required
   @login_required
   def my_view(request):
       # …
   ```

3. **Menggunakan Package pbp_django_auth**

   Anda bisa menggunakan package `pbp_django_auth` untuk mempermudah proses autentikasi. Anda perlu menginstall package ini dan melakukan konfigurasi yang diperlukan [Source 10](https://www.django-rest-framework.org/api-guide/authentication/).

4. **Membuat login.dart**

   Buat berkas baru `lib/screens/login.dart` dan isilah kode untuk menampilkan halaman login. Anda bisa merujuk ke Tutorial 8 untuk contoh kode halaman login.

5. **Membuat Model Kustom**

   Anda perlu membuat model kustom untuk menangani data user. Model ini nantinya akan digunakan untuk mengambil data user dari database dan melakukan operasi lain yang diperlukan [Source 2](https://docs.djangoproject.com/en/4.2/topics/auth/default/).

6. **Membuat Halaman Daftar Album dan Detail Album**

   Buat berkas `lib/screens/album_list.dart` dan `lib/screens/album_detail.dart` untuk menampilkan daftar album dan detail album. Anda bisa merujuk ke Mekanisme Pengambilan Data JSON dan Tutorial 8 untuk contoh kode halaman ini.

Contoh kode routing dari halaman daftar album ke detail album:

```dart
onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AlbumDetailPage(album: snapshot.data![index]),
    ),
  );
},
```

Contoh kode untuk halaman detail album:

```dart
class AlbumDetailPage extends StatelessWidget {
  final Album album;

  const AlbumDetailPage({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        ...
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          ...
          children: [
            Text(
              'Name: ${album.fields.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Amount: ${album.fields.amount}'),
            SizedBox(height: 10),
            Text('Description: ${album.fields.description}'),
          ],
        ),
      ),
    );
  }
}
```

Setelah menyelesaikan langkah-langkah di atas, Anda seharusnya sudah memiliki halaman login yang berfungsi dan sistem autentikasi Django yang terintegrasi dengan baik di aplikasi Anda.

</details>


 