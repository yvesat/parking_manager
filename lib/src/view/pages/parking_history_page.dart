import 'package:flutter/material.dart';

class ParkingHistoryPage extends StatelessWidget {
  const ParkingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Histórico de Vagas'),
      ),
    );
  }
}
