import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddActivityScreen extends StatefulWidget {
  // `kategoriPilihan` dibuat optional dengan default '' agar
  // menambahkan layar ini tidak memecah pemanggil yang lama.
  final String kategoriPilihan;
  const AddActivityScreen({Key? key, this.kategoriPilihan = ''})
    : super(key: key);

  @override
  State<AddActivityScreen> createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends State<AddActivityScreen> {
  final TextEditingController _controllerKegiatan = TextEditingController();
  final TextEditingController _controllerNominal = TextEditingController();

  @override
  void dispose() {
    _controllerKegiatan.dispose();
    _controllerNominal.dispose();
    super.dispose();
  }

  void _simpanKegiatan() {
    final String namaKegiatan = _controllerKegiatan.text.trim();
    final String nominalText = _controllerNominal.text.trim();

    if (namaKegiatan.isEmpty || nominalText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua field harus diisi'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final int? nominal = int.tryParse(
      nominalText.replaceAll('.', '').replaceAll(',', ''),
    );
    if (nominal == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nominal harus berupa angka yang valid'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final Map<String, dynamic> dataBaru = {
      'kegiatan': namaKegiatan,
      'nominal': nominal,
      'kategori': widget.kategoriPilihan,
    };

    Navigator.pop(context, dataBaru);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Transaksi')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tampilkan kategori jika tersedia
            if (widget.kategoriPilihan.isNotEmpty) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Kategori Dipilih: ${widget.kategoriPilihan}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],

            TextField(
              controller: _controllerKegiatan,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Keterangan / Nama Kegiatan',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: _controllerNominal,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Nominal Uang (Rp)',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _simpanKegiatan,
                child: const Text('Simpan Transaksi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
