import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:parking_manager/src/controller/parking_slot_controller.dart';

import 'parking_slot_gridtile.dart';

class ParkingSlotGrid extends HookConsumerWidget {
  const ParkingSlotGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parkingSlotState = ref.watch(parkingSlotControllerProvider.notifier).getParkingSlotState(ref);

    return GridView.builder(
      shrinkWrap: true,
      itemCount: parkingSlotState.length,
      itemBuilder: (ctx, index) => ParkingSlotGridTile(
        parkingslotNumber: parkingSlotState[index].parkingSlotNumber,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
    );
  }
}
