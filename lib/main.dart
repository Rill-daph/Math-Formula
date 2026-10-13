import 'package:flutter/material.dart';

void main() {
  runApp(Aplikasi());
}

class Aplikasi extends StatefulWidget {
  @override
  State<Aplikasi> createState() => AplikasiState();
}

class AplikasiState extends State<Aplikasi> {
  // Controller untuk mengambil teks dari TextField
  final TextEditingController panjangController = TextEditingController();
  final TextEditingController lebarController = TextEditingController();

  // Variabel untuk menyimpan hasil perhitungan
  int hasilLuas = 0;

  void hitungLuas() {
    int panjang = int.tryParse(panjangController.text) ?? 0;
    int lebar = int.tryParse(lebarController.text) ?? 0;

    setState(() {
      hasilLuas = panjang * lebar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF1E293B), // Dark Slate/Navy Kontras
        appBar: AppBar(
          backgroundColor: const Color(0xFF0F172A), // Darker Navy
          elevation: 2,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipOval(
                  child: Image.asset(
                    'assets/533-SMKN_5_MALANG.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            "Persegi Panjang",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Foto dengan Border Radius & Shadow
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/Pengertian-Balok-1024x576.png',
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 24),

              // Card Wadah Form Input
              Card(
                color: const Color(0xFF334155), // Kontras elemen dalam
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "Kalkulator Luas",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),

                      // Input Panjang
                      TextField(
                        controller: panjangController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black87),
                        decoration: InputDecoration(
                          labelText: "Panjang",
                          hintText: "Masukkan panjang",
                          prefixIcon:
                              Icon(Icons.straighten, color: Colors.amber[800]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                      ),

                      SizedBox(height: 16),

                      // Input Lebar
                      TextField(
                        controller: lebarController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black87),
                        decoration: InputDecoration(
                          labelText: "Lebar",
                          hintText: "Masukkan lebar",
                          prefixIcon:
                              Icon(Icons.square_foot, color: Colors.amber[800]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                      ),

                      SizedBox(height: 24),

                      // Tombol Hitung
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: hitungLuas,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber[700],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 3,
                          ),
                          child: Text(
                            "HITUNG LUAS",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Kotak Display Hasil
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.amber[800],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hasil Luas:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "$hasilLuas",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
