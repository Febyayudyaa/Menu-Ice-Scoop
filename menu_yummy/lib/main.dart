import 'package:flutter/material.dart';

// Fungsi utama yang menjadi titik masuk aplikasi
void main() {
  runApp(MyApp()); // Menjalankan aplikasi dengan MyApp sebagai widget root
}

// Kelas MyApp yang merupakan widget statele
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yummy App', // Judul aplikasi
      debugShowCheckedModeBanner: false, // Menonaktifkan banner debug
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white, // Warna background scaffold
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 235, 228, 252), // Warna background AppBar
          foregroundColor: Colors.black, // Warna teks di AppBar
        ),
      ),
      home: MyHomePage(title: 'Menu Ice Scoop'), // Halaman utama aplikasi
    );
  }
}

// Kelas MyHomePage yang merupakan widget stateful
class MyHomePage extends StatefulWidget {
  final String title; // Judul yang diteruskan ke widget ini

  MyHomePage({Key? key, required this.title}) : super(key: key); // Konstruktor dengan key

  @override
  _MyHomePageState createState() => _MyHomePageState(); // Mengembalikan instance state
}

// Kelas state untuk MyHomePage
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left), // Ikon tombol kembali
          onPressed: () {
            Navigator.of(context).pop();// Handle back button press (belum diimplementasikan)
          },
        ),
        title: Text(widget.title), // Menampilkan judul halaman
        centerTitle: true, // Mengatur judul agar berada di tengah
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Baris pertama kartu resep
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding horizontal
              child: Row(
                children: [
                  Expanded(
                    child: _buildRecipeCard( // Membuat kartu resep pertama
                      title: 'Strawberry Delight Ice Cream',
                      rating: 5,
                      time: '10 mnt',
                      price: '18 rb',
                      sellerName: 'Yummy Official',
                      sellerImage: 'asset/image/yummy.jpg', 
                      isVerified: true,
                      imageUrl: 'asset/image/ice strawberry.jpg', 
                    ),
                  ),
                  SizedBox(width: 16.0), // Ruang antara kartu
                  Expanded(
                    child: _buildRecipeCard( // Membuat kartu resep kedua
                      title: 'Creammy Chocolate Ice Cream',
                      rating: 4.9,
                      time: '15 mnt',
                      price: '15 rb',
                      sellerName: 'Yummy Official',
                      sellerImage: 'asset/image/yummy.jpg',
                      isVerified: true,
                      imageUrl: 'asset/image/choco.jpg',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0), // Ruang vertikal

            // Baris kedua kartu resep
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildRecipeCard( // Kartu resep ketiga
                      title: 'Sweet Bluebbery Ice Cream',
                      rating: 4.9,
                      time: '15 mnt' ,
                      price: '22 rb',
                      sellerName: 'Yummy Official',
                      sellerImage: 'asset/image/yummy.jpg',
                      isVerified: true,
                      imageUrl: 'asset/image/blueberry.jpg',
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: _buildRecipeCard( // Kartu resep keempat
                      title: 'Sprinkle Birthday Ice Cream',
                      rating: 5,
                      time: '18 mnt',
                      price: '18 rb',
                      sellerName: 'Yummy Official',
                      sellerImage: 'asset/image/yummy.jpg',
                      isVerified: true,
                      imageUrl: 'asset/image/bcake.jpg',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun kartu resep
  Widget _buildRecipeCard({
    required String title,
    required double rating,
    required String time,
    required String price,
    required String sellerName,
    required String sellerImage,
    required bool isVerified,
    required String imageUrl,
  }) {
    return Card(
      color: Color.fromARGB(255, 235, 228, 252), // Warna kartu
      elevation: 5, // Bayangan untuk kartu
      child: Stack( // Menggunakan Stack untuk menempatkan elemen
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row( // Menampilkan nama penjual dan gambar
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(sellerImage), // Gambar penjual
                      radius: 20.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      sellerName, // Nama penjual
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Spacer(), // Membuat ruang antara elemen
                    if (isVerified) // Menampilkan ikon verifikasi jika penjual terverifikasi
                      Icon(Icons.check_circle, color: Colors.blue, size: 16.0),
                  ],
                ),
              ),
              // Gambar produk dengan sudut melengkung
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0), // Membulatkan sudut
                child: Image.asset(
                  imageUrl, // Menggunakan gambar untuk produk
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover, // Mengatur cara gambar ditampilkan
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title, // Judul resep
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0), // Ruang vertikal
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 40.0,), // Ikon bintang untuk rating
                        Text('$rating'), // Menampilkan rating
                        SizedBox(width: 10.0),
                        Icon(Icons.access_time_filled_rounded, color: Colors.grey, size: 28.0,), // Ikon timer untuk waktu
                        Text(time), // Menampilkan waktu
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.remove_red_eye, color: Colors.grey, size: 28.0), // Ikon mata untuk melihat
                            SizedBox(width: 4.0),
                            Text(price), // Menampilkan harga
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Tombol bookmark
          Positioned(
            bottom: 8.0,
            right: 8.0,
            child: IconButton(
              icon: Icon(Icons.bookmark_border, color: Colors.black, size: 26.0), // Ikon bookmark
              onPressed: () {
                // Menampilkan snackbar saat tombol bookmark ditekan
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$title bookmarked!'), // Pesan snackbar
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
