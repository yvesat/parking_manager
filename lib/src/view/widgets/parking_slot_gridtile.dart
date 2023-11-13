import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:parking_manager/src/controller/parking_slot_controller.dart';
import 'package:parking_manager/src/controller/vehicle_controller.dart';

import '../pages/parking_slot_control_page.dart';

class ParkingSlotGridTile extends ConsumerWidget {
  final int parkingslotNumber;
  const ParkingSlotGridTile({required this.parkingslotNumber, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parkingSlotController = ref.read(parkingSlotControllerProvider.notifier);
    final parkingSlotState = parkingSlotController.getParkingSlot(ref, parkingslotNumber);

    final vehicleController = ref.read(vehicleControllerProvider.notifier);
    final vehicleState = vehicleController.getVehicle(ref, parkingSlotState!.occupyingVehicleId);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ParkingSlotControlPage(parkingslotNumber)),
          // onTap: () => context.go(
          //   Uri(
          //     path: 'parkingSlotControl',
          //     queryParameters: {'parkingslotNumber': parkingslotNumber.toString()},
          //   ).toString(),
        ),
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
                        children: [
                          const SizedBox(height: 8),
                          Text("${vehicleState!.brand} ${vehicleState.model}"),
                          const SizedBox(height: 4),
                          Text(vehicleState.licensePlate),
                        ],
                      ),
                    ),
                  if (parkingSlotState.available)
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        "Vaga disponível!",
                        style: TextStyle(fontWeight: FontWeight.bold),
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
