import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class AddActivityScreen extends StatefulWidget {
  const AddActivityScreen({super.key});
  

  @override
  State<AddActivityScreen> createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivityScreen> {
  // Gunakan prefix underscore untuk variabel private
  final TextEditingController _controllerKegiatan = TextEditingController();
  final TextEditingController _controllernominal = TextEditingController();

  @override
  void dispose() {
    _controllerKegiatan.dispose();
    _controllernominal.dispose();
    super.dispose();
  }

  void _simpanKegiatan() {
    final String namaKegiatan = _controllerKegiatan.text.trim();
    final String nominal = _controllerKegiatan.text.trim();

    if (namaKegiatan.isEmpty || nominal.isEmpty) {
      // Tampilkan pesan error jika input kosong atau hanya spasi
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua field harus diisi'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      // Kembali ke halaman sebelumnya dengan membawa data
      debugPrint("Data Tersimpan: $namaKegiatan - Rp$nominal");
      Navigator.pop(context, (namaKegiatan, nominal));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kegiatan'),
        centerTitle: true, // Membuat judul di tengah (opsional)
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controllerKegiatan,
              textCapitalization: TextCapitalization.sentences, // Kapitalisasi otomatis
              decoration: const InputDecoration(
                labelText: 'Nama Kegiatan',
                hintText: "Contoh: Beli Buku",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: _controllernominal,
              keyboardType: TextInputType.number,
              inputFormatters: [
                // Hanya izinkan input angka
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                labelText: 'Nominal',
                hintText: "Contoh: 50000",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                
                ),
              ),
              onPressed: _simpanKegiatan, // Memanggil fungsi yang dipisah
              child: Text(
                'Simpan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}