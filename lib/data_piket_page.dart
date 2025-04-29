import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1flutter/detail_piket_page.dart';

class DataPiketPage extends StatefulWidget {
  final String email;

  const DataPiketPage({super.key, required this.email});

  @override
  State<DataPiketPage> createState() => _DataPiketPageState();
}

class _DataPiketPageState extends State<DataPiketPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController tugasController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  bool _isDateInvalid = false;

  List<Map<String, dynamic>> listTugas = [];

  @override
  void initState() {
    super.initState();
    namaController.text = widget.email;
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

  void _addTask() {
    if (tugasController.text.trim().isNotEmpty) {
      setState(() {
        listTugas.add({
          'task': tugasController.text.trim(),
          'date':
              _selectedDate != null
                  ? DateFormat('dd-MM-yyyy').format(_selectedDate!)
                  : '',
          'name': namaController.text,
        });
        tugasController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Piket Gudang',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 76, 27, 140),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nama Anggota',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 7),
                TextFormField(
                  controller: namaController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama anggota tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Pilih Tanggal',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        color: _isDateInvalid ? Colors.red : Colors.black,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 18,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _selectedDate == null
                              ? 'Pilih Tanggal'
                              : DateFormat(
                                'EEEE, dd-MM-yyyy',
                              ).format(_selectedDate!),
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
                  ),
                ),
                if (_isDateInvalid)
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 16),
                    child: Text(
                      'Tanggal tidak boleh kosong',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                const SizedBox(height: 16),
                const Text(
                  'Tugas Piket',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: tugasController,
                        decoration: InputDecoration(
                          hintText: 'Tugas Piket',
                          filled: true,
                          fillColor: Colors.white,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tugas piket tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isDateInvalid = _selectedDate == null;
                        });
                        if (_formKey.currentState!.validate() &&
                            !_isDateInvalid) {
                          _addTask();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 76, 27, 140),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Tambah'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Center(
                  child: const Text(
                    'Daftar Tugas Piket',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                listTugas.isEmpty
                    ? Center(
                      child: Column(
                        children: const [
                          Text(
                            'Belum ada Data',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                    : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listTugas.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 76, 27, 140),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              title: Text(
                                listTugas[index]['task'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 16,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => DetailPiketPage(
                                          listTugas: listTugas[index],
                                        ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
