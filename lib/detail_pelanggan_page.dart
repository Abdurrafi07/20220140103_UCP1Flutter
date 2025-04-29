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
  final _formKey = GlobalKey<FormState>();

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail ${widget.namaCust}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/RzM.png', width: 100, height: 100),
                  Padding(padding: const EdgeInsets.only(top: 5, bottom: 10)),
                  Text(
                    widget.namaCust,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
