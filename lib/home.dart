import 'package:flutter/material.dart';
import 'package:cashflow/profil.dart';
import 'package:cashflow/add_activity.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
Widget build(BuildContext context) {
  final List<String> daftarKegiatan = [
  "Beli Makan Siang",
  "Bayar Uang Kas",
  "Beli Kuota Internet",
  "Bensin Motor",
  "Jajan Boba",
  "Tabungan Mingguan",
  "Bayar Listrik",
  "Beli Buku Pelajaran",
  "Main Ps",
  "Sawer Vtuber",
  "Beli Kopi"
  ];
  var scaffold3 = Scaffold(
    appBar: AppBar(
      title: const Text("Dashboard Keuangan"),
      backgroundColor: Colors.indigo,
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
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddActivityScreen()),
    );
  },
  tooltip: 'Tambah Kegiatan',
  child: const Icon(Icons.add),
),
    body: ListView.builder(
      itemCount: daftarKegiatan.length, // Jumlah item yang muncul
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: index % 2 == 0 ? Colors.blue : Colors.green,
              child:  Icon(Icons.monetization_on, color: Colors.white),
            ),
            title: Text(daftarKegiatan[index]), // Ambil data sesuai urutan index)
            subtitle: const Text("Hari ini"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              print("Anda mengklik {daftarKegiatan[index]}");
            },
          ),
        );
      },
    ),
  );
  var scaffold2 = scaffold3;
  var scaffold = scaffold2;
  return scaffold;
}
}
