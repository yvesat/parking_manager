import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:parking_manager/src/view/widgets/parking_slot_grid.dart';

class ParkingSlotsPage extends ConsumerStatefulWidget {
  const ParkingSlotsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<ParkingSlotsPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Vagas'),
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
