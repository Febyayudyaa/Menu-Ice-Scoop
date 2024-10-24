import 'package:flutter/material.dart';

// Fungsi utama yang menjadi titik masuk aplikasi
void main() {
  runApp(MyApp());
}

// Kelas MyApp yang merupakan widget stateless
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yummy App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 235, 228, 252),
          foregroundColor: Colors.black,
        ),
      ),
      home: MyHomePage(title: 'Menu Ice Scoop'),
    );
  }
}

// Kelas MyHomePage yang merupakan widget stateful
class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// Kelas state untuk MyHomePage
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('asset/image/yummy.jpg'), // Ganti dengan path gambar Anda
              ),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('asset/image/settings.jpg'), // Ganti dengan path gambar Anda
              ),
              title: Text('Settings'),
              onTap: () {
                // Tambahkan logika untuk mengalihkan ke halaman pengaturan
                Navigator.pop(context); // Menutup drawer
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('asset/image/about.jpg'), // Ganti dengan path gambar Anda
              ),
              title: Text('About'),
              onTap: () {
                // Tambahkan logika untuk mengalihkan ke halaman tentang
                Navigator.pop(context); // Menutup drawer
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildRecipeCard(
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
                  SizedBox(width: 16.0),
                  Expanded(
                    child: _buildRecipeCard(
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
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildRecipeCard(
                      title: 'Sweet Blueberry Ice Cream',
                      rating: 4.9,
                      time: '15 mnt',
                      price: '22 rb',
                      sellerName: 'Yummy Official',
                      sellerImage: 'asset/image/yummy.jpg',
                      isVerified: true,
                      imageUrl: 'asset/image/blueberry.jpg',
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: _buildRecipeCard(
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
      color: Color.fromARGB(255, 235, 228, 252),
      elevation: 5,
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(sellerImage),
                      radius: 20.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      sellerName,
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    if (isVerified)
                      Icon(Icons.check_circle, color: Colors.blue, size: 16.0),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  imageUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 40.0),
                        Text('$rating'),
                        SizedBox(width: 10.0),
                        Icon(Icons.access_time_filled_rounded, color: Colors.grey, size: 28.0),
                        Text(time),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.remove_red_eye, color: Colors.grey, size: 28.0),
                            SizedBox(width: 4.0),
                            Text(price),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 8.0,
            right: 8.0,
            child: IconButton(
              icon: Icon(Icons.bookmark_border, color: Colors.black, size: 26.0),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$title bookmarked!'),
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
