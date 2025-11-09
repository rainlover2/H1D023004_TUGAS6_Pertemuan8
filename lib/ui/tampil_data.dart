
import 'package:flutter/material.dart';

class TampilData extends StatelessWidget {
  // Deklarasikan variabel untuk menampung data yang dikirim
  final String nama;
  final String nim;
  final int umur;

  // Buat constructor untuk menerima data tersebut
  // 'required' berarti data ini wajib dikirim saat TampilData dipanggil
  const TampilData({
    Key? key,
    required this.nama,
    required this.nim,
    required this.umur,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perkenalan'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        // Tombol kembali (back) akan muncul otomatis
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          // Gunakan Card agar tampilan lebih menarik
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                // Gunakan data yang sudah diterima
                'Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                  height: 1.5, // Jarak antar baris
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}