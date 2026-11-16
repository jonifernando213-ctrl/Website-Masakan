import 'package:flutter/material.dart';
import 'package:kelompok6_resepmasakan/models/recipe_model.dart';


class RecipeProvider with ChangeNotifier {
  List<Recipe> _allRecipes = [];
  final Set<String> _favoriteRecipes = {};
  String _searchKeyword = "";
  String _selectedCategory = 'Semua';
  String _selectedDifficulty = 'Semua';
  String _selectedFoodType = 'Semua';
  bool _showFavoritesOnly = false;

  // mengambil suatu data
  List<Recipe> get allRecipes => _allRecipes;
  Set<String> get favoriteRecipes => _favoriteRecipes;
  String get searchKeyword => _searchKeyword;
  String get selectedCategory => _selectedCategory;
  String get selectedDifficulty => _selectedDifficulty;
  bool get showFavoritesOnly => _showFavoritesOnly;
String get selectedFoodType => _selectedFoodType;
  
  // data food type
  void setSelectedFoodType(String foodType) {
    _selectedFoodType = foodType;
    notifyListeners();
  }

  //mengolah daftar resep dari data map
  void initializeRecipes(List<Map<String, dynamic>> recipesData) {
    _allRecipes = recipesData.map((map) => Recipe.fromMap(map)).toList();
    notifyListeners();
  }

  // mengubah menjadi tetap
  void setSearchKeyword(String keyword) {
    _searchKeyword = keyword;
    notifyListeners();
  }


  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setSelectedDifficulty(String difficulty) {
    _selectedDifficulty = difficulty;
    notifyListeners();
  }

// Mengubah status flag untuk menampilkan hanya resep favorit
  void toggleShowFavoritesOnly() {
    _showFavoritesOnly = !_showFavoritesOnly;
    notifyListeners();
  }

//Menambah atau menghapus resep dari daftar favorit berdasarkan nama resep
  void toggleFavorite(String recipeName) {
    if (_favoriteRecipes.contains(recipeName)) {
      _favoriteRecipes.remove(recipeName);
    } else {
      _favoriteRecipes.add(recipeName);
    }
    notifyListeners();
  }

  bool isFavorite(String recipeName) {
    return _favoriteRecipes.contains(recipeName);
  }

  // melhiat kata kunci dari semua resep yang ada
  List<Recipe> get filteredRecipes {
    return _allRecipes.where((recipe) {
      final matchesKeyword = recipe.nama.toLowerCase().contains(_searchKeyword.toLowerCase());
      final matchesFavorite = !_showFavoritesOnly || _favoriteRecipes.contains(recipe.nama);
      final matchesDifficulty = _selectedDifficulty == 'Semua' || 
          recipe.kesulitan.toLowerCase() == _selectedDifficulty.toLowerCase();
      final matchesFoodType = _selectedFoodType == 'Semua' ||
          recipe.foodType.toLowerCase() == _selectedFoodType.toLowerCase();
      
      return matchesKeyword && matchesFavorite && matchesDifficulty && matchesFoodType;
    }).toList();
  }
}