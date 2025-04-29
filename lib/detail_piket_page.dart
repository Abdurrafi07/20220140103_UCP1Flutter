import 'package:flutter/material.dart';

class DetailPiketPage extends StatelessWidget {
  final Map<String, dynamic> listTugas;

  const DetailPiketPage({super.key, required this.listTugas});

  String formatTanggal(DateTime date) {
    return "${_hari(date.weekday)}, ${date.day} ${_bulan(date.month)} ${date.year}";
  }

  String _hari(int index) {
    const hari = [
      "Senin",
      "Selasa",
      "Rabu",
      "Kamis",
      "Jumat",
      "Sabtu",
      "Minggu",
    ];
    return hari[index - 1];
  }

  String _bulan(int index) {
    const bulan = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember",
    ];
    return bulan[index - 1];
  }

  @override
  Widget build(BuildContext context) {
    final DateTime tanggal = listTugas['date'];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Piket',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 76, 27, 140),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
