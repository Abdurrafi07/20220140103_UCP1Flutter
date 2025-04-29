import 'package:flutter/material.dart';

class DetailPelangganPage extends StatefulWidget {
  final String namaCust;
  final String email;
  final String noHP;
  final String alamat;
  final String provinsi;
  final String kodePos;

  const DetailPelangganPage({
    super.key,
    required this.namaCust,
    required this.email,
    required this.noHP,
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
  });

  @override
  State<DetailPelangganPage> createState() => _DetailPelangganPageState();
}

class _DetailPelangganPageState extends State<DetailPelangganPage> {
  final TextEditingController namaCusController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHPController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    namaCusController.text = widget.namaCust;
    emailController.text = widget.email;
    noHPController.text = widget.noHP;
    alamatController.text = widget.alamat;
    provinsiController.text = widget.provinsi;
    kodePosController.text = widget.kodePos;
  }
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
