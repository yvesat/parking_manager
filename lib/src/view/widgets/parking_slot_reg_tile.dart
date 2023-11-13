import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/parking_slot_controller.dart';

class ParkingSlotRegTile extends HookConsumerWidget {
  final int parkingSlotId;
  final void Function()? onPressed;
  const ParkingSlotRegTile({required this.parkingSlotId, required this.onPressed, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parkingSlot = ref.read(parkingSlotControllerProvider.notifier).getParkingSlot(ref, context, parkingSlotId);

    return Card(
      child: ListTile(
        leading: FaIcon(
          FontAwesomeIcons.carSide,
          color: parkingSlot!.available ? Colors.green : Colors.red,
        ),
        title: Text("Vaga $parkingSlotId - ${parkingSlot.available ? '(Disponível)' : '(Ocupada)'}"),
        trailing: IconButton(
          onPressed: onPressed,
          icon: const FaIcon(FontAwesomeIcons.trash),
        ),
      ),
    );
  }
}
