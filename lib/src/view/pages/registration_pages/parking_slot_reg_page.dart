import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:parking_manager/src/view/widgets/parking_slot_reg_tile.dart';

import '../../../controller/parking_slot_controller.dart';

class ParkingSlotRegPage extends ConsumerWidget {
  const ParkingSlotRegPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parkingController = ref.read(parkingSlotControllerProvider.notifier);
    final parkingState = parkingController.getParkingSlotState(ref);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cadastro de Vagas'),
        actions: [
          IconButton(
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
          itemBuilder: (context, index) => ParkingSlotRegTile(
            parkingSlotId: parkingState[index].parkingSlotNumber,
            onPressed: () => parkingController.removeParkingSlot(context, ref, parkingState[index]),
          ),
        ),
      ),
    );
  }
}
