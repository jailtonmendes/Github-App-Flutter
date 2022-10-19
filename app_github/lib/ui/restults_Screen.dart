import 'package:flutter/material.dart';

class RestultsScreen extends StatelessWidget {
  const RestultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text('Olá'),
      ),
    );
  }
}
