import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String _title = 'Flutter Demo Home Page';
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter != 0) {
        _counter--;
      }
    });
  }

  bool isLiked = false; // Status like

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked; // Toggle status like
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ), // Tambahkan margin kiri & kanan
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround, // Justify-between
              children: [
                Text(_title), // Teks di kiri
                Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                  ), // Hanya padding kanan
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/user_profile.png'),
                    radius: 20,
                    child: const Text('Profil'),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover, // Menyesuaikan gambar dengan seluruh layar
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/flutter_logo.png',
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                  semanticLabel: 'Logo Flutter',
                ),
                const Text(
                  'You have pushed the button this many times:',
                  style: TextStyle(
                    fontFamily: 'Pacifio',
                    fontSize: 30,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(width: 10), // Spasi antara tombol
                IconButton(
                  onPressed: _toggleLike,
                  icon: Image.asset(
                    isLiked ? 'icons/like_filled.png' : 'icons/like.png',
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    },
                  ),
                  iconSize: 40,
                  tooltip: 'Ikon Kustom',
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end, // Posisikan ke kanan
          children: [
            FloatingActionButton(
              onPressed: _decrementCounter, // Fungsi untuk mengurangi nilai
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 10), // Spasi antara tombol
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
