import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/parking_slot_controller.dart';
import '../../controller/vehicle_controller.dart';
import '../pages/parking_slot_exit_page.dart';
import '../pages/parking_slot_entry_page.dart';

class ParkingSlotGridTile extends ConsumerWidget {
  final int parkingslotNumber;
  const ParkingSlotGridTile({required this.parkingslotNumber, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parkingSlotController = ref.read(parkingSlotControllerProvider.notifier);
    final parkingSlotState = parkingSlotController.getParkingSlot(ref, context, parkingslotNumber);

    final vehicleState = ref.watch(vehicleControllerProvider.notifier).getVehicle(ref, parkingSlotState!.occupyingVehicleId);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => parkingSlotState.available ? ParkingSlotEntryPage(parkingslotNumber) : ParkingSlotExitPage(parkingslotNumber),
            )),
        child: Card(
          elevation: 1.5,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FaIcon(FontAwesomeIcons.carSide, size: 30, color: parkingSlotState.available ? Colors.green : Colors.red),
                      const SizedBox(width: 12),
                      Text(
                        "Vaga ${parkingSlotState.parkingSlotNumber}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  if (!parkingSlotState.available)
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            "${vehicleState!.brand} ${vehicleState.model}",
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            vehicleState.licensePlate,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  if (parkingSlotState.available)
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        "Vaga disponível",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
