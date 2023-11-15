import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:parking_manager/src/view/pages/registration_pages/vehicle_reg_page.dart';

import '../../controller/vehicle_controller.dart';

enum VehicleOption { edit, remove }

class VehicleRegTile extends HookConsumerWidget {
  final int vehicleId;
  final void Function()? onPressed;
  const VehicleRegTile({required this.vehicleId, required this.onPressed, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleController = ref.watch(vehicleControllerProvider.notifier);
    final vehicleState = vehicleController.getVehicle(ref, vehicleId);

    return Card(
      child: ListTile(
        title: Text(
          "Veículo: ${vehicleState!.brand} - ${vehicleState.model}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text("Placa: ${vehicleState.licensePlate}"),
        trailing: PopupMenuButton<VehicleOption>(
          onSelected: (VehicleOption item) async {
            if (item == VehicleOption.edit) {
              if (context.mounted) Navigator.push(context, MaterialPageRoute(builder: (context) => VehicleRegPage(vehicleId: vehicleState.vehicleId)));
            }

            if (item == VehicleOption.remove) {
              await vehicleController.removeVehicle(context, ref, vehicleState);
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<VehicleOption>>[
            PopupMenuItem<VehicleOption>(
              value: VehicleOption.edit,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.pen, size: 14, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 12),
                  const Text('Editar'),
                ],
              ),
            ),
            PopupMenuItem<VehicleOption>(
              value: VehicleOption.remove,
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.trash, size: 14, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 12),
                  const Text('Excluir'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
