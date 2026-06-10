import 'package:flutter/material.dart';

import 'kategori_screen.dart';
import 'profil.dart';

void main() {
  runApp(const CashFlowApp());
}

class CashFlowApp extends StatelessWidget {
  const CashFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CashFlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> daftarTransaksi = [
    {'kegiatan': 'Beli Makan Siang', 'nominal': 25000, 'kategori': 'Makanan'},
    {'kegiatan': 'Bayar Uang Kas', 'nominal': 50000, 'kategori': 'Belanja'},
    {
      'kegiatan': 'Beli Kuota Internet',
      'nominal': 75000,
      'kategori': 'Hiburan',
    },
  ];

  IconData _iconForKategori(String? kategori) {
    switch (kategori) {
      case 'Makanan':
        return Icons.restaurant;
      case 'Transportasi':
        return Icons.directions_car;
      case 'Belanja':
        return Icons.shopping_bag;
      case 'Hiburan':
        return Icons.sports_esports;
      case 'Tagihan':
        return Icons.receipt_long;
      case 'Pemasukan':
        return Icons.savings;
      default:
        return Icons.monetization_on;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Keuangan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilScreen()),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final hasilDataTransaksi = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KategoriScreen()),
          );

          if (hasilDataTransaksi != null &&
              hasilDataTransaksi is Map<String, dynamic>) {
            setState(() {
              daftarTransaksi.add(hasilDataTransaksi);
            });
          }
        },
        child: const Icon(Icons.add),
        tooltip: 'Tambah Kegiatan',
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: daftarTransaksi.length,
        itemBuilder: (context, index) {
          final transaksi = daftarTransaksi[index];
          final kategori = transaksi['kategori'] as String?;
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: index.isEven ? Colors.indigo : Colors.green,
                child: Icon(_iconForKategori(kategori), color: Colors.white),
              ),
              title: Text(transaksi['kegiatan'] ?? 'Transaksi baru'),
              subtitle: Text(kategori ?? 'Kategori tidak diketahui'),
              trailing: Text('Rp ${transaksi['nominal'] ?? 0}'),
              onTap: () {
                debugPrint('Anda mengklik ${transaksi['kegiatan']}');
              },
            ),
          );
        },
      ),
    );
  }
}
