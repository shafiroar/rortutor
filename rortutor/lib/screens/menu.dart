
import 'package:flutter/material.dart';
import 'package:rortutor/screens/shoplist_form.dart';
import 'package:rortutor/widgets/left_drawer.dart';
import 'package:rortutor/screens/product_list.dart';

class MyHomePage extends StatelessWidget {
  final List<Product> products = [];
  
  MyHomePage({Key? key}) : super(key: key);
  
  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.pinkAccent),
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.blueAccent),
    ShopItem("Logout", Icons.logout, Colors.lightGreenAccent),
];
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        
      ),
      drawer : const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'PBP Shop', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
              ElevatedButton(
              onPressed: () {
                // Panggil fungsi untuk menavigasi ke halaman daftar produk
                _navigateToProductList(context, products);
              },
              child: const Text("Lihat Produk"),
            ),
          ],
        ),
      ),
    ),
  );
}

  void _navigateToProductList(BuildContext context, List<Product> products) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductListPage(),
      ),
    );
  }

}

class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          // Menavigasi langsung ke halaman daftar produk
          if (item.name == "Lihat Item") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductListPage(),
              ),
            );
          } else if (item.name == "Tambah Item") {
            // Menavigasi ke halaman formulir jika item adalah "Tambah Item"
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ShopFormPage()));
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
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

