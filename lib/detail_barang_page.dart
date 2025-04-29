import 'package:flutter/material.dart';

class DetailBarangPage extends StatelessWidget {
  final String tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final String jumlahBarang;
  final String hargaSatuan;
  final String totalHarga;

  const DetailBarangPage({
    super.key,
    required this.tanggal,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlahBarang,
    required this.hargaSatuan,
    required this.totalHarga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFDFF5DD),
                  border: Border.all(
                    color: Color.fromARGB(255, 76, 27, 140),
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Icon(
                  Icons.check_circle_rounded,
                  color: Color.fromARGB(255, 76, 27, 140),
                  size: 70,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Data Berhasil Disimpan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
