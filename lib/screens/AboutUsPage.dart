import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // FAB untuk komentar
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCommentDialog(context);
        },
        backgroundColor: Colors.orange,
        elevation: 4.0,
        child: const Icon(Icons.add, size: 36),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      // jika halaman over flow tetap bisa di scroll
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // judul
              Text(
                'Tentang kami',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Bingung Mau Masak Apa???',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // grid gambar
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,     
                  crossAxisSpacing: 8,    
                  mainAxisSpacing: 8,     
                  childAspectRatio: 1,    
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _buildProfileImage('assets/muka.jpg', size: 10);
                },
              ),
              const SizedBox(height: 10),
              Text(
                'Hai kawan-kawan, Terima kasih telah mengunjungi halaman Website kami cuyy!!!! '
                'Di dalam Website kami banyak tersajikan cara-cara dan langkah-langkah yang tepat '
                'untuk menghasilkan masakan yang Anda inginkan. Ketika Anda bingung ingin masak apa, '
                'silahkan klik di halaman Home kami, di sana tersajikan aneka ragam masakan yang sangat '
                'direkomendasikan untuk semua. Jangan lupa tinggalkan jejak yang favorite untuk menu yang '
                'disukai oleh teman-teman.',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // tombol back
              SizedBox(
                width: 180,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                  child: const Text("Halaman Home"),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(String assetPath, {double size = 60}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        assetPath,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }

  // menampilkan dialog komentar
  void _showCommentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String comment = '';
        return AlertDialog(
          title: const Text('Tambahkan Komentar'),
          content: TextField(
            onChanged: (value) {
              comment = value;
            },
            decoration: const InputDecoration(
              hintText: 'Tulis komentar atau masukan Anda...',
            ),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (comment.isNotEmpty) {
                  // logika penyimpanan komentar 
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Komentar berhasil disimpan!')),
                  );
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }
}