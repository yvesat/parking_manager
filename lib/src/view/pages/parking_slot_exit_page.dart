import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:parking_manager/src/controller/parking_record_controllder.dart';

import '../../controller/parking_slot_controller.dart';
import '../../controller/vehicle_controller.dart';
import '../widgets/alert.dart';
import '../widgets/vehicle_detail_card.dart';

class ParkingSlotExitPage extends ConsumerStatefulWidget {
  final int parkingSlotNumber;
  const ParkingSlotExitPage(this.parkingSlotNumber, {Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParkingSlotExitPageState();
}

class _ParkingSlotExitPageState extends ConsumerState<ParkingSlotExitPage> {
  @override
  Widget build(BuildContext context) {
    final Alert alert = Alert();

    final parkingSlotController = ref.read(parkingSlotControllerProvider.notifier);
    final parkingSlotState = parkingSlotController.getParkingSlot(ref, context, widget.parkingSlotNumber);

    final vehicleController = ref.watch(vehicleControllerProvider.notifier);
    final vehicle = vehicleController.getVehicle(ref, parkingSlotState!.occupyingVehicleId);

    final parkingRecordController = ref.read(parkingRecordControllerProvider.notifier);
    final parkingRecord = ref.watch(parkingRecordControllerProvider.notifier).getParkingRecordById(ref, parkingSlotState.currentParkingRecordId);

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
              "Vaga Ocupada",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Registrar saída do veículo?",
              ),
            ),
            VehicleDetailCard(vehicleId: vehicle?.vehicleId),
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
                              DateFormat('dd/MM/yyyy').format(parkingRecord?.entryDate ?? DateTime.now()),
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
                final newDate = await parkingRecordController.setDate(context, parkingRecord!.entryDate);
                if (context.mounted) await parkingRecordController.editParkingRecordDate(ref, context, parkingRecord.parkingRecordId, newDate, null);
              },
            ),
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
                              "Data da Saída: ",
                              style: TextStyle(fontSize: 12),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              DateFormat('dd/MM/yyyy').format(parkingRecord?.exitDate ?? DateTime.now()),
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
                final newDate = await parkingRecordController.setDate(context, parkingRecord!.exitDate ?? DateTime.now());
                if (context.mounted) await parkingRecordController.editParkingRecordDate(ref, context, parkingRecord.parkingRecordId, null, newDate);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await parkingSlotController.setVehicleExit(ref, context, vehicle!.id, parkingSlotState.parkingSlotNumber, parkingRecord!.exitDate ?? DateTime.now());
                if (context.mounted) {
                  alert.snack(context, "Veículo retirado da vaga ${widget.parkingSlotNumber}.");
                  context.pop();
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text('Registrar Saída'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
