import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return const Placeholder();
  }
}
