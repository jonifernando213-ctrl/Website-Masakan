import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController(); // Controller for name input
  bool showPassword = false;
  bool isChecked = false; // Variabel untuk status checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Gambar background
          Image.asset(
            'background.jpg', // Pastikan file ini tersedia di assets dan sudah ditambahkan di pubspec.yaml
            fit: BoxFit.cover,
          ),
          // Warna transparan gelap di atas gambar
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          // menampilkan kotak login di tengah layar
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[800],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    // Input untuk login 
                    controller: nameController, 
                    decoration: const InputDecoration(
                      labelText: 'Nama Pengguna',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: passwordController,
                    obscureText: !showPassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Checkbox untuk menyetujui
                  CheckboxListTile(
                    title: const Text("Apakah Anda Setuju dengan Syarat dan Ketentuan Yang tersedia?"),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isChecked ? () {
                      String email = emailController.text;
                      String userName = nameController.text; // Ambil nama pengguna
                      // Kirimkan email dan nama pengguna ke HomePage
                      Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => HomePage(
      userEmail: emailController.text, // atau sesuai variabel email
      userName: nameController.text,   // atau sesuai variabel nama
    ),
  ),
);

                    } : null, 
                    // Disable tombol jika checkbox belum dicentang
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Login'),
                  ),
                  //bagian untuk menuju halaman register
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const RegisterPage()),
                      );
                    },
                    child: const Text(
                      'Belum punya akun? Daftar di sini',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
