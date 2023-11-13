import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parking_manager/src/controller/vehicle_controller.dart';

class VehicleDetailCard extends ConsumerWidget {
  final int? vehicleId;
  const VehicleDetailCard({super.key, required this.vehicleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicle = ref.watch(vehicleControllerProvider.notifier).getVehicle(ref, vehicleId);

    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Veículo Selecionado:",
                style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
              ),
            ),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.industry,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 32),
                  Text(
                    vehicle == null ? "Marca" : vehicle.brand,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1, color: Theme.of(context).colorScheme.secondary),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.car,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 32),
                  Text(
                    vehicle == null ? "Modelo" : vehicle.model,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1, color: Theme.of(context).colorScheme.secondary),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleInfo,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 32),
                  Text(
                    vehicle == null ? "Placa" : vehicle.licensePlate,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
