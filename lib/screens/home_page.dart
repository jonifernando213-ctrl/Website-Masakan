import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'detail_resep.dart';
import 'package:kelompok6_resepmasakan/providers/recipe_provider.dart';
import 'package:kelompok6_resepmasakan/utils/dummy_data.dart';
import 'package:kelompok6_resepmasakan/widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  final String userEmail;
  final String userName;

  const HomePage({super.key, required this.userEmail, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tambahkan drawer di sini
      drawer: AppDrawer(userName: userName, userEmail: userEmail),
      
      appBar: AppBar(
        title: const Text('Resep Masakan'),
        backgroundColor: Colors.orange,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(
                  MediaQuery.of(context).size.width - 120.0,
                  kToolbarHeight + 10.0,
                  0.0,
                  0.0,
                ),
                items: [
                  PopupMenuItem(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/muka.jpg'),
                        ),
                        const SizedBox(height: 8),
                        Text(userName, style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(userEmail, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                      ],
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),

      // memeriksa data resep jika belum ada di provider
      body: Consumer<RecipeProvider>(
        builder: (context, recipeProvider, child) {
          if (recipeProvider.allRecipes.isEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              recipeProvider.initializeRecipes(dummyRecipes);
            });
          }

          // menampilkan gambar dan teks setelah appbar
          return Column(
            children: [
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/muka.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Mau masak apa hari ini?',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              //  radio button kesulitan memasak
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDifficultyRadio(context, 'Semua'),
                    _buildDifficultyRadio(context, 'Mudah'),
                    _buildDifficultyRadio(context, 'Menengah'),
                    _buildDifficultyRadio(context, 'Sulit'),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // dropdown jenis masakan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _buildFoodTypeDropdown(context, recipeProvider),
              ),
              const SizedBox(height: 16),

              // tampilan ui lebih bagus
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),

                  // navigasi untuk fitur pencarian
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Cari resep...',
                            prefixIcon: const Icon(Icons.search, color: Colors.deepOrange),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          ),
                          onSubmitted: (value) {
                            recipeProvider.setSearchKeyword(value);
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.orange[100],
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),

                        // navigasi ke favorit
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Favorit', style: TextStyle(fontSize: 12)),
                            Switch(
                              value: recipeProvider.showFavoritesOnly,
                              onChanged: (val) {
                                recipeProvider.toggleShowFavoritesOnly();
                              },
                              activeColor: Colors.deepOrange,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // pengaturan tata letak gambar
              Expanded(
                child: GridView.builder(
                  itemCount: recipeProvider.filteredRecipes.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    final resep = recipeProvider.filteredRecipes[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailResepPage(
                              nama: resep.nama,
                              gambar: resep.gambar,
                              bahan: resep.bahan,
                              cara: resep.cara,
                            ),
                          ),
                        );
                      },

                      // gambar resep di halaman utama
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              resep.gambar,
                              fit: BoxFit.cover,
                            ),
                            // gradasi warna di atas gambar
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.7),
                                  ],
                                ),
                              ),
                            ),
                            // menampilkan nama resep
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    resep.nama,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  // menjalankan fungsi favorit
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          recipeProvider.isFavorite(resep.nama)
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.redAccent,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          recipeProvider.toggleFavorite(resep.nama);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // menampilkan pilihan tingkat kesulitan
  Widget _buildDifficultyRadio(BuildContext context, String difficulty) {
    final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: difficulty,
          groupValue: recipeProvider.selectedDifficulty,
          onChanged: (value) {
            recipeProvider.setSelectedDifficulty(value!);
          },
          activeColor: Colors.orange,
        ),
        Text(difficulty),
      ],
    );
  }

 // menampilkan dropdown 
 Widget _buildFoodTypeDropdown(BuildContext context, RecipeProvider provider) {
  return Container(
    width: 150,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey[300]!,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(6),
      color: Colors.white, 
    ),

    // dropdown filter jenis masakan
    child: DropdownButtonHideUnderline( 
      child: DropdownButton<String>(
        value: provider.selectedFoodType,
        isExpanded: false, 
        icon: const Icon(Icons.arrow_drop_down, 
          color: Colors.orange, 
          size: 20,
        ),
        style: TextStyle(
          color: Colors.grey[800],
          fontSize: 12,
        ),
        dropdownColor: Colors.white, 
        items: const [

          // dropdown button untuk jenis masakan
          DropdownMenuItem(
            value: 'Semua', 
            child: Text('Semua Jenis', style: TextStyle(fontSize: 12))
          ),
          DropdownMenuItem(
            value: 'Berkuah', 
            child: Text('Berkuah', style: TextStyle(fontSize: 12))
          ),
          DropdownMenuItem(
            value: 'Kering', 
            child: Text('Kering', style: TextStyle(fontSize: 12))
          ),
          DropdownMenuItem(
            value: 'Soup', 
            child: Text('Soup', style: TextStyle(fontSize: 12))
          ),
        ],
        onChanged: (value) {
          // menyimpan pilihan masakan supaya dapat difilter sesuai jenis masakan
          provider.setSelectedFoodType(value!);
        },
      ),
    ),
  );
}
}