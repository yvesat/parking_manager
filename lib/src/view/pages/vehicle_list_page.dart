import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/vehicle_controller.dart';
import '../widgets/vehicle_tile.dart';
import 'registration_pages/vehicle_reg_page.dart';

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
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const VehicleRegPage())),
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
