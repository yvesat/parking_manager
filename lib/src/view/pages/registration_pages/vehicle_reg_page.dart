import 'package:flutter/material.dart';

class VehicleRegScreen extends StatelessWidget {
  const VehicleRegScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cadastro de Veículos'),
      ),
    );
  }
}
