import 'package:flutter/material.dart';
import 'package:kelompok6_resepmasakan/screens/login_page.dart';
import 'package:kelompok6_resepmasakan/screens/AboutUsPage.dart';
import 'package:kelompok6_resepmasakan/screens/settings_page.dart'; // Pastikan file ini sudah ada

class AppDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;

  const AppDrawer({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(userEmail),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/muka.jpg'),
            ),
            decoration: const BoxDecoration(
              color: Colors.orange,
            ),
          ),
          ListTile(
  leading: const Icon(Icons.home),
  title: const Text('Home'),
  onTap: () {
    Navigator.pop(context); // Tutup drawer
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Berpindah ke Home'),
        duration: Duration(milliseconds: 500),
      ),
    );
  },
),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Pengaturan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  SettingsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Tentang Kami'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUsPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
      
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text('Apakah Anda yakin ingin logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}