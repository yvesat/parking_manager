import 'package:flutter/material.dart';

class ParkingRecordPage extends StatelessWidget {
  const ParkingRecordPage({super.key});

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
