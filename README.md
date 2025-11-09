Nama: Ratu Naurah Calista
Nim: H1D023004
Shift: B

Penjelasan Proses Passing Data 
Proyek ini mendemonstrasikan cara mengirim (passing) data dari satu halaman (StatefulWidget) ke halaman lain (StatelessWidget) di Flutter menggunakan Navigasi via Constructor.
Proses ini melibatkan dua file utama:
1.  `lib/ui/form_data.dart` (Halaman Pengirim)
2.  `lib/ui/tampil_data.dart` (Halaman Penerima)
   
1. Halaman Pengirim (`form_data.dart`)
Di halaman ini, kita mengumpulkan data dari pengguna dan "mendorong" data tersebut ke halaman berikutnya.
Langkah-langkah:
1.  Mengumpulkan Data: Kita menggunakan `TextEditingController` untuk setiap `TextFormField` (`_namaController`, `_nimController`, `_tahunLahirController`) untuk mendapatkan teks yang diinput oleh pengguna.
2.  Memicu Navigasi: Aksi pengiriman data terjadi di dalam fungsi `_kirimData` yang dipanggil oleh `onPressed` pada `ElevatedButton` ("Simpan").
3.  Kalkulasi Data: Sebelum mengirim, kita melakukan kalkulasi sederhana untuk mengubah "Tahun Lahir" menjadi "Umur".
4.  Mengirim Data: Inti prosesnya ada di sini. Kita menggunakan `Navigator.push` untuk pindah halaman. Di dalam `MaterialPageRoute`, kita memanggil *constructor* dari halaman tujuan (`TampilData`) dan memasukkan data yang ingin kita kirim sebagai argumennya.

2. Halaman Penerima (`tampil_data.dart`)
Halaman ini didesain untuk *menerima* data saat ia dibuat (diinisialisasi).
Langkah-langkah:
1.  Menyiapkan Constructor: Kita mendeklarasikan variabel `final` di dalam class `TampilData` untuk setiap data yang kita harapkan (nama, nim, umur).
2.  Mewajibkan Data: Kita menambahkan variabel-variabel tersebut ke *constructor* class dan memberinya *keyword* `required`. Ini berarti siapa pun yang ingin membuat halaman `TampilData` **wajib** menyertakan data-data tersebut.
3.  Menggunakan Data: Setelah data diterima dan disimpan dalam variabel `nama`, `nim`, dan `umur`, kita bisa langsung menggunakannya di dalam method `build` untuk menampilkannya di layar, misalnya di dalam `Text` widget.

 Output: 
 <img width="474" height="1077" alt="Screenshot 2025-11-09 171918" src="https://github.com/user-attachments/assets/4974c8d1-5259-4a02-9263-21c7e52d314d" />
 <img width="470" height="1074" alt="Screenshot 2025-11-09 171935" src="https://github.com/user-attachments/assets/ed1f8bee-d223-49ea-84ee-8826d1a365dd" />



**`form_data.dart` (onPressed)** → `Navigator.push` → **Memanggil Constructor `TampilData(nama: ..., nim: ..., umur: ...)`** → **`tampil_data.dart` (Constructor)** → Variabel `nama`, `nim`, `umur` terisi → **`tampil_data.dart` (build())** → Data ditampilkan di `Text` widget.
