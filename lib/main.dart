import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kelompok6_resepmasakan/providers/auth_provider.dart';
import 'package:kelompok6_resepmasakan/providers/recipe_provider.dart';
import 'package:kelompok6_resepmasakan/providers/theme_provider.dart';
import 'package:kelompok6_resepmasakan/screens/login_page.dart';
import 'package:kelompok6_resepmasakan/screens/register_page.dart';
import 'package:kelompok6_resepmasakan/screens/about_page.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Resep Masakan',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.isDarkMode
          ? ThemeData.dark().copyWith(
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                elevation: 0,
              ),
            )
          : ThemeData(
              primarySwatch: Colors.orange,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                elevation: 0,
              ),
            ),
      // Kita hapus initialRoute dan routes untuk home, karena HomePage perlu parameter
      // Gunakan named route hanya untuk yang tidak butuh parameter
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
