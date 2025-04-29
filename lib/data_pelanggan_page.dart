import 'package:flutter/material.dart';

class DataPelangganPage extends StatefulWidget {
  const DataPelangganPage({super.key});

  @override
  State<DataPelangganPage> createState() => _DataPelangganPageState();
}

class _DataPelangganPageState extends State<DataPelangganPage> {
  final TextEditingController namaCustController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHPController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data Pelanggan',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nama Cust',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: namaCustController,
                    decoration: const InputDecoration(
                      hintText: 'Nama Cust',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama cust tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 9, top: 9),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Email',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 9,
                                      top: 9,
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'No HP',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    controller: noHPController,
                                    decoration: const InputDecoration(
                                      hintText: 'No HP',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'No HP tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
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
