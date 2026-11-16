import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Kami'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Info tentang pengembang'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Banner versi
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.info, size: 40, color: Colors.blue),
                      const SizedBox(height: 10),
                      const Text(
                        'Versi 1.0.0',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Terakhir diperbarui: ${DateTime.now().toString().substring(0, 10)}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                
                const FlutterLogo(size: 100),
                const SizedBox(height: 20),
                
                const Text(
                  'Resep Masakan',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                
                // Anggota tim
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          'Tim Pengembang',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildTeamMember('Anggota 1', 'Product Owner'),
                        _buildTeamMember('Anggota 2', 'UI/UX Designer'),
                        _buildTeamMember('Anggota 3', 'Flutter Developer'),
                        _buildTeamMember('Anggota 4', 'Backend Developer'),
                        _buildTeamMember('Anggota 5', 'QA Tester'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Lisensi
                ElevatedButton(
                  onPressed: () {
                    showLicensePage(context: context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Membuka halaman lisensi'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: const Text('Lihat Lisensi'),
                ),
                const SizedBox(height: 20),
                
                // Kontak
                OutlinedButton.icon(
                  icon: const Icon(Icons.email),
                  label: const Text('Hubungi Kami'),
                  onPressed: () {
                    _showContactDialog(context);
                  },
                ),
              ],
            ),
          ),
          
          // Banner footer
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              color: Colors.green[100],
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.eco, color: Colors.green),
                  SizedBox(width: 8),
                  Text('© 2024 Kelompok 6 - Resep Masakan'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMember(String name, String role) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(name),
      subtitle: Text(role),
      onTap: () {
        // Bisa ditambahkan dialog detail anggota
      },
    );
  }

  void _showContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Kontak Kami'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('kelompok6@example.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Telepon'),
              subtitle: Text('+62 123 4567 890'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }
}