// untuk menyimpan data resep masakan/ makanan
class Recipe {
  final String nama;
  final String gambar;
  final String bahan;
  final String cara;
  final String kesulitan; //  mudah, menengah, sulit
  final String foodType;     // 'Berkuah', 'Kering', 'Soup'

  Recipe({
    required this.nama,
    required this.gambar,
    required this.bahan,
    required this.cara,
    required this.kesulitan,
    required this.foodType,
  });

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      nama: map['nama'] ?? '',
      gambar: map['gambar'] ?? '',
      bahan: map['bahan'] ?? '',
      cara: map['cara'] ?? '',
      kesulitan: map['kesulitan'] ?? 'Medium',
      foodType: map['foodType'] ?? 'Berkuah',
    );
  }
}