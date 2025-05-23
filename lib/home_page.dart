import 'package:flutter/material.dart';
import 'package:ucp1flutter/data_barang_page.dart';
import 'package:ucp1flutter/data_pelanggan_page.dart';
import 'package:ucp1flutter/data_piket_page.dart';
import 'package:ucp1flutter/login_page.dart';

class HomePage extends StatefulWidget {
  final String email;

  const HomePage({super.key, required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 76, 27, 140),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 16),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/RzM.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat Datang',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            widget.email,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        },
                        icon: Icon(Icons.logout),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
                left: 25,
                right: 25,
                bottom: 30,
              ),
              child: Image.asset(
                'assets/images/Home.png',
                width:
                    MediaQuery.of(
                      context,
                    ).size.width, // Menyesuaikan dengan lebar layar
                height:
                    MediaQuery.of(context).size.height *
                    0.3, // Menyesuaikan tinggi gambar sesuai proporsi
                fit: BoxFit.cover, // Menjaga aspek rasio gambar
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: GestureDetector(
                    child: Container(
                      width: 170,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 76, 27, 140),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.add_chart, color: Colors.white, size: 50),
                          const SizedBox(height: 10),
                          const Text(
                            'Data Piket',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DataPiketPage(email: widget.email),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: GestureDetector(
                    child: Container(
                      width: 170,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 76, 27, 140),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.people_alt_rounded,
                            color: Colors.white,
                            size: 50,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Data Pelanggan',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DataPelangganPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            GestureDetector(
              child: Container(
                width: 370,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 76, 27, 140),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.receipt_long_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Barang Masuk/Keluar',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataBarangPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
