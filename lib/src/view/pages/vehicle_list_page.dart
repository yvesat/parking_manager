import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:parking_manager/src/controller/vehicle_controller.dart';

import '../widgets/vehicle_tile.dart';

class VehicleListPage extends ConsumerWidget {
  const VehicleListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleController = ref.read(vehicleControllerProvider.notifier);
    final vehicleState = vehicleController.getVehicleState(ref);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lista de Veículos'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.plus,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: vehicleState.length,
          itemBuilder: (context, index) => VehicleRegTile(vehicleId: vehicleState[index].vehicleId, onPressed: () {}),
        ),
      ),
    );
  }
}
