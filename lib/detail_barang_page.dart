import 'package:flutter/material.dart';
import 'package:ucp1flutter/home_page.dart';

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

  Widget _detailTransaksi(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16, color: Colors.black87)),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

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
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    _detailTransaksi('Tanggal', tanggal),
                    Divider(
                      color: const Color.fromARGB(127, 158, 158, 158),
                      thickness: 1,
                    ),
                    _detailTransaksi('Jenis Transaksi', jenisTransaksi),
                    Divider(
                      color: const Color.fromARGB(127, 158, 158, 158),
                      thickness: 1,
                    ),
                    _detailTransaksi('Jenis Barang', jenisBarang),
                    Divider(
                      color: const Color.fromARGB(127, 158, 158, 158),
                      thickness: 1,
                    ),
                    _detailTransaksi('Jumlah Barang', jumlahBarang),
                    Divider(
                      color: const Color.fromARGB(127, 158, 158, 158),
                      thickness: 1,
                    ),
                    _detailTransaksi('Jenis Harga Satuan', hargaSatuan),
                    Divider(
                      color: const Color.fromARGB(127, 158, 158, 158),
                      thickness: 1,
                    ),
                    _detailTransaksi('Total Harga', 'Rp. $totalHarga'),
                    Divider(
                      color: const Color.fromARGB(127, 158, 158, 158),
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 76, 27, 140),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.popUntil(
                        context,
                        (route) =>
                            route is MaterialPageRoute &&
                            route.builder(context) is HomePage,
                      );
                    },

                    child: const Text(
                      'Selesai',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
