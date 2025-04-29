import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String email;

  const HomePage({super.key, required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 76, 27, 140),
              ),
            ),
          ],
        ),
      ),
    );
  }
}