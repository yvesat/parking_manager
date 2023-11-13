import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/parking_slot_controller.dart';
import '../../controller/vehicle_controller.dart';
import '../../model/vehicle_model.dart';
import '../widgets/alert.dart';
import '../widgets/vehicle_detail_card.dart';

class ParkingSlotControlPage extends ConsumerStatefulWidget {
  final int parkingSlotNumber;
  const ParkingSlotControlPage(this.parkingSlotNumber, {Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParkingSlotControlPageState();
}

class _ParkingSlotControlPageState extends ConsumerState<ParkingSlotControlPage> {
  String _displayStringForOption(VehicleModel option) => "${option.brand} ${option.model} - ${option.licensePlate}";
  int? _selectedVehicleId;

  @override
  Widget build(BuildContext context) {
    final Alert alert = Alert();

    final parkingSlotController = ref.read(parkingSlotControllerProvider.notifier);
    final parkingSlotState = parkingSlotController.getParkingSlot(ref, context, widget.parkingSlotNumber);
    final vehicleController = ref.watch(vehicleControllerProvider.notifier);
    final vehicleState = vehicleController.getVehicleState(ref);
    final vehicle = vehicleController.getVehicle(ref, parkingSlotState!.occupyingVehicleId);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              "Vaga ${parkingSlotState.available ? "Disponível" : "Ocupada"}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: parkingSlotState.available ? Colors.green : Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Registrar ${parkingSlotState.available ? "entrada" : "saída"} do veículo?",
              ),
            ),
            if (parkingSlotState.available)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Autocomplete<VehicleModel>(
                      displayStringForOption: _displayStringForOption,
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<VehicleModel>.empty();
                        }
                        return vehicleState.where((VehicleModel option) {
                          return option.licensePlate.contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      onSelected: (VehicleModel selection) async {
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        setState(() {
                          _selectedVehicleId = selection.vehicleId;
                        });
                      },
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.magnifyingGlass, size: 16),
                        SizedBox(width: 8),
                        Text("Pesquisa por placa"),
                      ],
                    ),
                  ],
                ),
              ),
            VehicleDetailCard(vehicleId: _selectedVehicleId ?? vehicle?.vehicleId),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedVehicleId != null || vehicle != null
                  ? () async {
                      if (parkingSlotState.available) {
                        await parkingSlotController.setVehicleEntry(ref, context, _selectedVehicleId, parkingSlotState.parkingSlotNumber);
                        if (context.mounted) {
                          alert.snack(context, "Veículo alocado a vaga ${widget.parkingSlotNumber}.");
                          context.pop();
                        }
                      } else {
                        await parkingSlotController.setVehicleExit(ref, context, parkingSlotState.parkingSlotNumber);
                        if (context.mounted) {
                          alert.snack(context, "Veículo retirado da vaga ${widget.parkingSlotNumber}.");
                          context.pop();
                        }
                      }
                    }
                  : null,
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
