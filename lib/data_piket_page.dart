import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    namaController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}