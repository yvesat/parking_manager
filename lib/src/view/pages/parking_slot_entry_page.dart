import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../controller/parking_record_controllder.dart';
import '../../controller/parking_slot_controller.dart';
import '../../controller/vehicle_controller.dart';
import '../../model/vehicle_model.dart';
import '../widgets/alert.dart';
import '../widgets/vehicle_detail_card.dart';

class ParkingSlotEntryPage extends ConsumerStatefulWidget {
  final int parkingSlotNumber;
  const ParkingSlotEntryPage(this.parkingSlotNumber, {Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParkingSlotEntryPageState();
}

class _ParkingSlotEntryPageState extends ConsumerState<ParkingSlotEntryPage> {
  DateTime _entryDate = DateTime.now();
  String _displayStringForOption(VehicleModel option) => "${option.brand} ${option.model} - ${option.licensePlate}";
  int? _selectedVehicleId;

  @override
  Widget build(BuildContext context) {
    final Alert alert = Alert();

    final parkingSlotController = ref.read(parkingSlotControllerProvider.notifier);
    final parkingSlotState = parkingSlotController.getParkingSlot(ref, context, widget.parkingSlotNumber);

    final vehicleController = ref.watch(vehicleControllerProvider.notifier);
    final vehicleState = vehicleController.getVehicleState(ref);
    final parkingRecordController = ref.read(parkingRecordControllerProvider.notifier);

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
            const Text(
              "Vaga Disponível",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Registrar entrada do veículo?",
              ),
            ),
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
                        return option.licensePlate.contains(textEditingValue.text.toUpperCase());
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
            VehicleDetailCard(vehicleId: _selectedVehicleId),
            InkWell(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Data da Entrada: ",
                              style: TextStyle(fontSize: 12),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              DateFormat('dd/MM/yyyy').format(_entryDate),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.calendar_today, color: Theme.of(context).colorScheme.primary),
                    ],
                  ),
                ),
              ),
              onTap: () async {
                final newDate = await parkingRecordController.setDate(context, _entryDate);
                if (newDate != null) {
                  setState(() {
                    _entryDate = newDate;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedVehicleId != null
                  ? () async {
                      final vehicleParkedAtSlot = parkingSlotController.isVehiceParked(ref, _selectedVehicleId!);
                      if (vehicleParkedAtSlot == null) {
                        await parkingSlotController.setVehicleEntry(ref, context, _selectedVehicleId!, parkingSlotState!.parkingSlotNumber, _entryDate);
                        if (context.mounted) {
                          alert.snack(context, "Veículo alocado a vaga ${widget.parkingSlotNumber}.");
                          context.pop();
                        }
                      } else {
                        if (context.mounted) alert.snack(context, "Veículo já está estacionado na vaga ${vehicleParkedAtSlot.parkingSlotNumber}.");
                      }
                    }
                  : null,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text('Registrar Entrada'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
