import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../controller/parking_record_controllder.dart';

class ParkingRecordTile extends HookConsumerWidget {
  final int parkingRecordId;
  final void Function()? onTap;
  const ParkingRecordTile({required this.parkingRecordId, required this.onTap, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parkingRecord = ref.watch(parkingRecordControllerProvider.notifier).getParkingRecordById(ref, parkingRecordId);

    return Card(
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          // dense: true,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Vaga ${parkingRecord!.parkingSlotNumber} - Placa: ${parkingRecord.vehicleLicensePlate}",
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Entrada: ${DateFormat('dd/MM/yyyy').format(parkingRecord.entryDate)}",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "Saída: ${parkingRecord.exitDate != null ? DateFormat('dd/MM/yyyy').format(parkingRecord.exitDate!) : "Aberto"}",
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
