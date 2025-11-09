// lib/ui/form_data.dart
import 'package:flutter/material.dart';
import 'package:h1d023004_tugas6/ui/tampil_data.dart';

class FormData extends StatefulWidget {
  const FormData({super.key});

  @override
  State<FormData> createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  // Controller untuk mengambil teks dari TextFields
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunLahirController = TextEditingController();

  // GlobalKey untuk validasi form (opsional, tapi best practice)
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Selalu dispose controller ketika widget tidak lagi digunakan
    _namaController.dispose();
    _nimController.dispose();
    _tahunLahirController.dispose();
    super.dispose();
  }

  void _kirimData() {
    // Validasi form sebelum mengirim
    if (_formKey.currentState!.validate()) {
      // 1. Ambil data dari controllers
      final String nama = _namaController.text;
      final String nim = _nimController.text;
      final int tahunLahir = int.parse(_tahunLahirController.text);

      // 2. Hitung umur
      // Kita gunakan tahun saat ini untuk menghitung umur
      final int tahunIni = DateTime.now().year;
      final int umur = tahunIni - tahunLahir;

      // 3. Navigasi ke TampilData dan kirim data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TampilData(
            nama: nama,
            nim: nim,
            umur: umur, // Kirim umur yang sudah dihitung
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        // Agar bisa di-scroll jika keyboard muncul
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Field Nama
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                    hintText: 'Masukkan nama lengkap Anda',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Field NIM
                TextFormField(
                  controller: _nimController,
                  decoration: const InputDecoration(
                    labelText: 'NIM',
                    hintText: 'Masukkan NIM Anda',
                    prefixIcon: Icon(Icons.school),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'NIM tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Field Tahun Lahir
                TextFormField(
                  controller: _tahunLahirController,
                  decoration: const InputDecoration(
                    labelText: 'Tahun Lahir',
                    hintText: 'Contoh: 2004',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  keyboardType: TextInputType.number, // Keyboard angka
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tahun lahir tidak boleh kosong';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Format tahun tidak valid';
                    }
                    if (value.length != 4) {
                      return 'Tahun harus 4 digit';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24.0),

                // Tombol Simpan
                ElevatedButton(
                  onPressed: _kirimData, // Panggil fungsi _kirimData
                  child: const Text('Simpan'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}