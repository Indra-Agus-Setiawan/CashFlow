import 'package:flutter/material.dart';
import 'add_activity.dart';

class KategoriScreen extends StatelessWidget {
  KategoriScreen({super.key});

  // 1. Data Kategori dalam bentuk List Map
  final List<Map<String, dynamic>> listKategori = [
    {"nama": "Makanan", "icon": Icons.restaurant, "warna": Colors.orange},
    {"nama": "Transportasi", "icon": Icons.directions_car, "warna": Colors.blue},
    {"nama": "Belanja", "icon": Icons.shopping_bag, "warna": Colors.green},
    {"nama": "Hiburan", "icon": Icons.sports_esports, "warna": Colors.purple},
    {"nama": "Tagihan", "icon": Icons.receipt_long, "warna": Colors.red},
    {"nama": "Pemasukan", "icon": Icons.savings, "warna": Colors.teal},
    {"nama": "Kesehatan", "icon": Icons.local_hospital, "warna": Colors.grey},
    {"nama": "Zakat/Sedekah", "icon": Icons.category, "warna": Colors.brown},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilih Kategori Transaksi"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        // 2. Implementasi GridView.builder
        child: GridView.builder(
          itemCount: listKategori.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,    // 2 kolom
            crossAxisSpacing: 12, // Jarak horizontal antar kotak
            mainAxisSpacing: 12,  // Jarak vertikal antar kotak
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            final item = listKategori[index];
            return InkWell(
              onTap: () {
                // 3. Pindah ke halaman input & bawa data kategori
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddActivityScreen(kategoriPilihan: item["nama"]),
                  ),
                ).then((dataBaru) {
                  // Jika ada data transaksi baru, lempar balik ke Home
                  if (dataBaru != null) {
                    Navigator.pop(context, dataBaru);
                  }
                });
              },
              child: Card(
                color: item["warna"].withOpacity(0.15),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: item["warna"], width: 1.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: item["warna"],
                      child: Icon(item["icon"], color: Colors.white, size: 28),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      item["nama"],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}