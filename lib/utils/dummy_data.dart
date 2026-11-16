//menyinpan data makanan yang kelompok kami buat
final List<Map<String, dynamic>> dummyRecipes = [
  {
    'nama': 'Ayam Bakar',
    'gambar': 'assets/ayam_bakar.jpg',
    'kesulitan' : 'sulit',
    'foodType' : 'Kering' ,
    'bahan': '''
- 1 ekor ayam, potong sesuai selera
- 3 siung bawang putih
- 5 sdm kecap manis
- 1 sdt garam
- 1 sdt merica
- 2 sdm air jeruk nipis
- 1 batang serai, geprek
''',
    'cara': '''
1. Lumuri ayam dengan air jeruk nipis, diamkan 15 menit lalu cuci bersih.
2. Haluskan bawang putih, garam, merica lalu campur dengan kecap dan serai.
3. Balur ayam dengan bumbu, diamkan 30 menit.
4. Bakar ayam sambil sesekali diolesi bumbu hingga matang dan harum.
''',
  },
  {
    'nama': 'Bakso',
    'gambar': 'assets/bakso.jpg',
    'kesulitan' : 'sulit',
    'foodType' : 'Berkuah' ,
    'bahan': '''
- 500 gr daging sapi giling
- 100 gr tepung tapioka
- 3 siung bawang putih goreng
- 1 sdt garam
- 1/2 sdt merica bubuk
- Air es secukupnya
''',
    'cara': '''
1. Haluskan semua bahan dengan blender atau food processor.
2. Bentuk adonan menjadi bulatan dengan tangan atau sendok.
3. Rebus dalam air mendidih hingga bakso mengapung.
4. Angkat dan tiriskan. Sajikan dengan kuah kaldu.
''',
  },
  {
    'nama': 'Nasi Goreng',
    'gambar': 'assets/nasi_goreng.jpg',
    'kesulitan' : 'mudah',
    'foodType' : 'kering' ,
    'bahan': '''
- 2 piring nasi putih
- 2 siung bawang putih, cincang
- 3 butir bawang merah, iris tipis
- 1 butir telur
- 3 sdm kecap manis
- Garam dan merica secukupnya
''',
    'cara': '''
1. Tumis bawang merah dan bawang putih hingga harum.
2. Masukkan telur, orak-arik.
3. Tambahkan nasi, aduk rata.
4. Tuangkan kecap, garam, dan merica. Aduk rata hingga matang.
''',
  },
  {
    'nama': 'Mie Goreng',
    'gambar': 'assets/mie_goreng.jpg',
    'kesulitan' : 'mudah',
    'foodType' : 'Kering ' ,
    'bahan': '''
- 1 bungkus mie telur
- 2 siung bawang putih
- 1 butir telur
- 3 sdm kecap manis
- Sayuran (kol, wortel, sawi)
- Garam dan merica secukupnya
''',
    'cara': '''
1. Rebus mie hingga matang, tiriskan.
2. Tumis bawang putih hingga harum.
3. Masukkan telur, orak-arik, lalu tambahkan sayur.
4. Tambahkan mie, kecap, garam, dan merica. Aduk rata hingga matang.
''',
  },
  {
    'nama': 'Rendang',
    'gambar': 'assets/rendang.jpg',
    'kesulitan' : 'Menengah',
    'foodType' : 'Berkuah' ,
    'bahan': '''
- 500 gr daging sapi, potong kotak
- 500 ml santan kental
- 5 siung bawang putih
- 8 butir bawang merah
- 5 buah cabai merah besar
- 2 lembar daun salam
- 2 batang serai
- Rempah: lengkuas, kunyit, jahe
''',
    'cara': '''
1. Haluskan semua bumbu.
2. Tumis bumbu dengan daun salam dan serai hingga harum.
3. Masukkan daging, aduk hingga berubah warna.
4. Tuang santan, kecilkan api, masak hingga kuah menyusut dan rendang mengering.
''',
  },
  {
    'nama': 'Sate',
    'gambar': 'assets/sate_ayam.jpg',
    'kesulitan' : 'sulit',
    'foodType' : 'kering' ,
    'bahan': '''
- 500 gr daging ayam atau sapi, potong kecil
- 4 sdm kecap manis
- 3 siung bawang putih
- 1 sdt ketumbar bubuk
- 1 sdt garam
- Tusuk sate
''',
    'cara': '''
1. Haluskan bawang putih, garam, dan ketumbar.
2. Campur bumbu dengan kecap, lumuri daging dan diamkan 1 jam.
3. Tusuk daging ke tusukan sate.
4. Bakar hingga matang, sambil dioles sisa bumbu.
''',
  },
  {
    'nama': 'Soto Ayam',
    'gambar': 'assets/soto_ayam.webp',
    'kesulitan' : 'Menengah',
    'foodType' : 'Soup' ,
    'bahan': '''
- 1/2 ekor ayam
- 2 liter air
- 3 lembar daun salam
- 5 lembar daun jeruk
- 2 batang serai, memarkan
- 3 cm lengkuas, memarkan
- 5 siung bawang putih
- 8 siung bawang merah
- 1 ruas kunyit
- 1 sdm ketumbar
- Pelengkap: tauge, soun, telur rebus, daun bawang, bawang goreng
''',
    'cara': '''
1. Rebus ayam dengan daun salam, daun jeruk, serai, dan lengkuas hingga empuk.
2. Haluskan bawang merah, bawang putih, kunyit, dan ketumbar.
3. Tumis bumbu halus hingga harum, masukkan ke dalam rebusan ayam.
4. Angkat ayam, suwir-suwir dagingnya, masukkan kembali ke dalam kuah.
5. Sajikan dengan pelengkap.
''',
  },
  {
    'nama': 'Gado-gado',
    'gambar': 'assets/gado_gado.webp',
    'kesulitan' : 'mudah',
    'foodType' : 'kering' ,
    'bahan': '''
- Aneka sayuran rebus (kangkung, bayam, tauge, kacang panjang)
- Lontong atau ketupat
- 200 gr kacang tanah goreng
- 5 buah cabai merah
- 3 siung bawang putih
- 1 sdt garam
- 100 gr gula merah
- 2 sdm air asam jawa
- Air secukupnya
''',
    'cara': '''
1. Haluskan kacang tanah, cabai, bawang putih, garam, dan gula merah.
2. Tambahkan air asam jawa dan air secukupnya, aduk hingga kental.
3. Tata sayuran rebus dan lontong di piring.
4. Siram dengan bumbu kacang, taburi bawang goreng.
''',
  },
  {
    'nama': 'Nasi Uduk',
    'gambar': 'assets/nasi_uduk.webp',
    'kesulitan' : 'mudah',
    'foodType' : 'kering' ,
    'bahan': '''
- 500 gr beras
- 500 ml santan kental
- 2 lembar daun salam
- 3 lembar daun pandan
- 2 batang serai, memarkan
- 3 cm lengkuas, memarkan
- 1 sdt garam
- Pelengkap: ayam goreng, telur dadar, tempe orek, bawang goreng
''',
    'cara': '''
1. Cuci bersih beras hingga air cucian jernih.
2. Masak santan dengan daun salam, daun pandan, serai, lengkuas dan garam hingga mendidih.
3. Tuangkan santan ke dalam beras, aduk rata.
4. Kukus hingga matang selama 30-40 menit.
5. Sajikan dengan pelengkap.
''',
  },
  {
    'nama': 'Sayur Asem',
    'gambar': 'assets/sayur_asem.webp',
    'kesulitan' : 'sulit',
    'foodType' : 'Berkuah' ,
    'bahan': '''
- 100 gr kacang tanah
- 100 gr jagung manis, potong-potong
- 100 gr nangka muda, potong dadu
- 100 gr kacang panjang, potong-potong
- 50 gr melinjo
- 5 buah belimbing wuluh
- 5 cm asam jawa
- 5 siung bawang merah
- 3 siung bawang putih
- 3 buah cabai merah
- 1 sdt terasi bakar
- 1 sdm gula merah
- Garam secukupnya
- 1,5 liter air
''',
    'cara': '''
1. Rebus air, masukkan kacang tanah, jagung, dan nangka muda hingga setengah matang.
2. Haluskan bawang merah, bawang putih, cabai, dan terasi.
3. Masukkan bumbu halus, kacang panjang, melinjo, dan belimbing wuluh ke dalam rebusan.
4. Tambahkan air asam jawa, gula merah, dan garam. Masak hingga semua sayuran matang.
''',
  },
  {
    'nama': 'Martabak Telur',
    'gambar': 'assets/martabak_telur.webp',
    'kesulitan' : 'Menengah',
    'foodType' : 'kering' ,
    'bahan': '''
- 10 lembar kulit lumpia
- 5 butir telur
- 200 gr daging sapi cincang
- 5 butir bawang merah, cincang
- 3 siung bawang putih, cincang
- 1 batang daun bawang, iris tipis
- 1 sdt garam
- 1/2 sdt merica
- Minyak untuk menggoreng
''',
    'cara': '''
1. Tumis bawang merah dan bawang putih hingga harum.
2. Masukkan daging cincang, masak hingga berubah warna.
3. Kocok telur, campurkan dengan tumisan daging, daun bawang, garam, dan merica.
4. Letakkan selembar kulit lumpia, isi dengan adonan telur.
5. Lipat kulit dan goreng hingga kecokelatan.
''',
  },
  {
    'nama': 'Es Cendol',
    'gambar': 'assets/es_cendol.webp',
    'kesulitan' : 'Menengah',
    'foodType' : 'soup' ,
    'bahan': '''
- 150 gr tepung hunkwe
- 1 sdm tepung beras
- 100 ml air daun pandan
- 1/2 sdt garam
- Pewarna hijau secukupnya
- 200 ml santan kental
- 200 gr gula merah, disisir
- 3 lembar daun pandan
- Es batu secukupnya
''',
    'cara': '''
1. Campur tepung hunkwe, tepung beras, air daun pandan, garam, dan pewarna hijau.
2. Masak hingga mengental, lalu cetak dengan cetakan cendol.
3. Rebus gula merah dengan sedikit air dan daun pandan hingga larut, saring.
4. Masak santan dengan daun pandan dan garam hingga mendidih.
5. Sajikan cendol dengan sirup gula merah, santan, dan es batu.
''',
},
];

