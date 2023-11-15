import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/vehicle_controller.dart';

class VehicleRegTile extends HookConsumerWidget {
  final int vehicleId;
  final void Function()? onTap;
  const VehicleRegTile({required this.vehicleId, required this.onTap, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleController = ref.watch(vehicleControllerProvider.notifier);
    final vehicleState = vehicleController.getVehicle(ref, vehicleId);

    return Card(
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          title: Text(
            "Veículo: ${vehicleState!.brand} - ${vehicleState.model}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text("Placa: ${vehicleState.licensePlate}"),
        ),
      ),
    );
  }
}
