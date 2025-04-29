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
  bool _isDateInvalid = false; 

  Map<String, int> hargaBarang = {
    'Pot Bonsai': 30000,
    'Alat Pangkas': 50000,
    'Kawat Bonsai': 15000,
    'Tanah Akadama': 20000,
  };

  @override
  void initState() {
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2045),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _isDateInvalid = false;
      });
    }
  }

  String formatTanggal(DateTime date) {
    return "${_hari(date.weekday)}, ${date.day} ${_bulan(date.month)} ${date.year}";
  }

  String _hari(int index) {
    const hari = ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"];
    return hari[index - 1];
  }

  String _bulan(int index) {
    const bulan = [
      "Januari", "Februari", "Maret", "April", "Mei", "Juni",
      "Juli", "Agustus", "September", "Oktober", "November", "Desember"
    ];
    return bulan[index - 1];
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
