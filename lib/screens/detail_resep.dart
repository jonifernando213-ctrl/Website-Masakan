import 'package:flutter/material.dart';

class DetailResepPage extends StatelessWidget {
  final String nama;
  final String gambar;
  final String bahan;
  final String cara;

  const DetailResepPage({
    super.key,
    required this.nama,
    required this.gambar,
    required this.bahan,
    required this.cara,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nama),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Berbagi resep...'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$nama ditambahkan ke favorit'),
                  action: SnackBarAction(
                    label: 'Batal',
                    onPressed: () {
                      // Aksi undo favorit
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner resep
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.emoji_food_beverage, color: Colors.green),
                  const SizedBox(width: 10),
                  Text(
                    'Resep $nama',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Gambar resep
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                gambar,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            
            // Bahan-bahan
            const Text(
              'Bahan-bahan:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(bahan),
            const SizedBox(height: 20),
            
            // Cara membuat
            const Text(
              'Langkah Pembuatan:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(cara),
            const SizedBox(height: 20),
            
            // Tombol aksi
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.print),
                    label: const Text('Cetak'),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Menyiapkan untuk mencetak...'),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    label: const Text('Mulai Memasak'),
                    onPressed: () {
                      _showCookingDialog(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showCookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Mulai Memasak'),
        content: const Text('Siapkan semua bahan dan ikuti langkah-langkahnya. Selamat memasak!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Tutup'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Timer memasak diaktifkan'),
                ),
              );
            },
            child: const Text('Aktifkan Timer'),
          ),
        ],
      ),
    );
  }
}