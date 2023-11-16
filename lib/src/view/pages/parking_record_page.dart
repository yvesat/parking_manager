import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/parking_record_controllder.dart';
import '../widgets/parking_record_tile.dart';
import 'registration_pages/vehicle_reg_page.dart';

class ParkingRecordPage extends ConsumerWidget {
  const ParkingRecordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parkingRecordState = ref.watch(parkingRecordControllerProvider.notifier).getParkingRecordState(ref);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Histórico'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: parkingRecordState.length,
                itemBuilder: (context, index) => ParkingRecordTile(
                  parkingRecordId: parkingRecordState[index].parkingRecordId,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => VehicleRegPage(vehicleId: parkingRecordState[index].vehicleId))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
