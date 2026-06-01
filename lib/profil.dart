import 'package:flutter/material.dart';

void main() => runApp(const ProfilScreen());

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profil Pertamaku'),
          backgroundColor: Colors.blueAccent,
          automaticallyImplyLeading: false, // Menghilangkan tombol back default
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Widget Ikon dengan bingkai profil
              const CircleAvatar(
                radius: 106,
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(
                    'endmin2.jpg',
                  ), // Ganti dengan path gambar yang sesuai
                ),
              ),

              const SizedBox(height: 16),

              // Widget Teks Nama
              const Text(
                'Nelvan Arata',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              // Widget Teks Deskripsi
              const Text('Siswa SMK Negeri 1 Sampit - Belajar Flutter'),

              const SizedBox(height: 20), // Memberi jarak kosong
              // Widget Row untuk info tambahan
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.location_on, color: Colors.red),
                  SizedBox(width: 4),
                  Text('Kalimantan Tengah, Indonesia'),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  // Fungsi untuk menutup halaman aktif dan kembali ke sebelumnya
                  Navigator.pop(context);
                },
                child: const Text(
                  'Keluar / Kembali',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
