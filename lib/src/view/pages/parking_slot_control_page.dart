import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/parking_slot_controller.dart';
import '../../controller/vehicle_controller.dart';
import '../../model/vehicle_model.dart';

class ParkingSlotControlPage extends ConsumerStatefulWidget {
  final int parkingSlotNumber;
  const ParkingSlotControlPage(this.parkingSlotNumber, {Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParkingSlotControlPageState();
}

class _ParkingSlotControlPageState extends ConsumerState<ParkingSlotControlPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController brandController = TextEditingController();
    final TextEditingController modelController = TextEditingController();
    final TextEditingController licensePlateController = TextEditingController();
    String displayStringForOption(VehicleModel option) => "${option.brand} ${option.model} - ${option.licensePlate}";

    final parkingSlotcontroller = ref.read(parkingSlotControllerProvider.notifier);
    final parkingSlotState = parkingSlotcontroller.getParkingSlot(ref, widget.parkingSlotNumber);
    final vehicleState = ref.read(vehicleControllerProvider.notifier).getVehicleState(ref);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Controle da Vaga ${widget.parkingSlotNumber.toString()}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Vaga ${parkingSlotState!.available ? "Disponível" : "Ocupada"}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: parkingSlotState.available ? Colors.green : Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                "Registrar ${parkingSlotState.available ? "entrada" : "saída"} do veículo?",
              ),
            ),
            if (parkingSlotState.available)
              Autocomplete<VehicleModel>(
                displayStringForOption: displayStringForOption,
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<VehicleModel>.empty();
                  }
                  return vehicleState.where((VehicleModel option) {
                    return option.toString().contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (VehicleModel selection) {
                  setState(() {
                    brandController.text = selection.brand;
                    modelController.text = selection.model;
                    licensePlateController.text = selection.licensePlate;
                  });
                },
              ),
            TextFormField(
              enabled: false,
              controller: brandController,
              decoration: InputDecoration(
                icon: FaIcon(
                  FontAwesomeIcons.industry,
                  color: Theme.of(context).colorScheme.primary,
                ),
                labelText: 'Marca',
              ),
            ),
            TextFormField(
              enabled: false,
              controller: modelController,
              decoration: InputDecoration(
                icon: FaIcon(
                  FontAwesomeIcons.car,
                  color: Theme.of(context).colorScheme.primary,
                ),
                labelText: 'Modelo',
              ),
            ),
            TextFormField(
              enabled: false,
              controller: licensePlateController,
              decoration: InputDecoration(
                icon: FaIcon(
                  FontAwesomeIcons.circleInfo,
                  color: Theme.of(context).colorScheme.primary,
                ),
                labelText: 'Placa',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(parkingSlotState.available ? 'Registrar Entrada' : 'Registrar Saída'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
