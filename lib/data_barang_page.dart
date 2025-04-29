import 'package:flutter/material.dart';

class DataBarangPage extends StatefulWidget {
  const DataBarangPage({super.key});

  @override
  State<DataBarangPage> createState() => _DataBarangPageState();
}

class _DataBarangPageState extends State<DataBarangPage> {
  final TextEditingController tanggalTransaksiController =
      TextEditingController();
  final TextEditingController jenisTransaksiController =
      TextEditingController();
  final TextEditingController jenisBarangController = TextEditingController();
  final TextEditingController jumlahBarangController = TextEditingController();
  final TextEditingController hargaSatuanController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int totalHarga = 0;

  List<String> jenisTransaksiList = ['Barang Masuk', 'Barang Keluar'];
  String? selectedJenisTransaksi;

  List<String> jenisBarangList = [
    'Pot Bonsai',
    'Alat Pangkas',
    'Kawat Bonsai',
    'Tanah Akadama',
  ];
  String? selectedJenisBarang;

  DateTime? _selectedDate;
  bool _isInvalidDate = false;
  

  Map<String, int> hargaBarang = {
    'Pot Bonsai': 30000,
    'Alat Pangkas': 50000,
    'Kawat Bonsai': 15000,
    'Tanah Akadama': 20000,
  };

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
