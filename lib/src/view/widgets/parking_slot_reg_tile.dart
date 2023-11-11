import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/parking_slot_controller.dart';

class ParkingSlotRegTile extends HookConsumerWidget {
  final int parkingSlotId;
  const ParkingSlotRegTile({required this.parkingSlotId, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parkingController = ref.read(parkingSlotController.notifier);
    final parkingSlot = parkingController.getParkingSlot(ref, context, parkingSlotId);
    final parkingSlotAvailable = parkingSlot!.occupyingVehicleId != null ? false : true;

    return Card(
      child: ListTile(
        leading: FaIcon(
          FontAwesomeIcons.carSide,
          color: parkingSlotAvailable ? Colors.green : Colors.red,
        ),
        title: Text("Vaga $parkingSlotId - ${parkingSlotAvailable ? '(Disponível)' : '(Ocupada)'}"),
        trailing: IconButton(
          onPressed: parkingSlotAvailable ? () => parkingController.removeParkingSlot(context, ref, parkingSlot) : null,
          icon: const FaIcon(FontAwesomeIcons.trash),
        ),
      ),
    );
  }
}
