import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:parking_manager/src/view/widgets/parking_slot_grid.dart';

class ParkingSlotsGridPage extends ConsumerStatefulWidget {
  const ParkingSlotsGridPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParkingSlotsGridPageState();
}

class _ParkingSlotsGridPageState extends ConsumerState<ParkingSlotsGridPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Controle de Vagas'),
          ),
          body: const Padding(
            padding: EdgeInsets.all(12),
            child: ParkingSlotGrid(),
          ),
        )
      ],
    );
  }
}
