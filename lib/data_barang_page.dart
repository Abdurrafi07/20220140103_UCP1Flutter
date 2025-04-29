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

  void _updateHargaSatuan(String? selectedBarang) {
    if (selectedBarang != null && hargaBarang.containsKey(selectedBarang)) {
      setState(() {
        hargaSatuanController.text = 'Rp. ${hargaBarang[selectedBarang]}';
      });
    }
  }

  void calculateTotalHarga() {
    int jumlahBarang = int.tryParse(jumlahBarangController.text) ?? 0;
    int hargaSatuan =
        int.tryParse(
          hargaSatuanController.text.replaceAll('Rp. ', '').replaceAll('.', ''),
        ) ??
        0;

    setState(() {
      totalHarga = jumlahBarang * hargaSatuan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pendataan Barang',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 76, 27, 140),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Tanggal Transaksi',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color:
                              _isDateInvalid
                                  ? Colors.red
                                  : const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 18,
                                color: Colors.grey.shade600,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _selectedDate == null
                                    ? 'Tanggal Transaksi'
                                    : formatTanggal(_selectedDate!),
                                style: TextStyle(
                                  color:
                                      _selectedDate == null
                                          ? Colors.grey.shade600
                                          : Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_isDateInvalid)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, left: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Tanggal tidak boleh kosong',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 21),
                    child: DropdownButtonFormField<String>(
                      value: selectedJenisTransaksi,
                      decoration: const InputDecoration(
                        hintText: 'Jenis Transaksi',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      items:
                          jenisTransaksiList.map((String jenisTransaksi) {
                            return DropdownMenuItem<String>(
                              value: jenisTransaksi,
                              child: Text(jenisTransaksi),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedJenisTransaksi = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Pilih jenis transaksi';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 11),
                    child: DropdownButtonFormField<String>(
                      value: selectedJenisBarang,
                      decoration: const InputDecoration(
                        hintText: 'Jenis Barang',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      items:
                          jenisBarangList.map((String jensiBarang) {
                            return DropdownMenuItem<String>(
                              value: jensiBarang,
                              child: Text(jensiBarang),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedJenisBarang = value!;
                          _updateHargaSatuan(value);
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Pilih jenis barang';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 9, top: 9),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Jumlah Barang',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: jumlahBarangController,
                              decoration: const InputDecoration(
                                hintText: 'Jumlah Barang',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Jumlah barang tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
