import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:parking_manager/src/view/widgets/parking_slot_reg_tile.dart';

import '../../../controller/parking_slot_controller.dart';

class ParkingSlotRegScreen extends ConsumerWidget {
  const ParkingSlotRegScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parkingController = ref.read(parkingSlotController.notifier);
    final parkingState = parkingController.getParkingSlotState(ref);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cadastro de Vagas'),
        actions: [
          IconButton.filled(
            onPressed: () => parkingController.createParkingSlot(context, ref),
            icon: const FaIcon(
              FontAwesomeIcons.plus,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: parkingState.length,
          itemBuilder: (context, index) => ParkingSlotRegTile(parkingSlotId: parkingState[index].parkingSlotNumber),
        ),
      ),
    );
  }
}
