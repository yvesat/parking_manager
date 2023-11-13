// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:parking_manager/src/model/parking_slot_model.dart';
import 'package:parking_manager/src/model/vehicle_model.dart';

import '../model/services/isar_service.dart';
import '../view/widgets/alert.dart';

class DataSyncController extends StateNotifier<AsyncValue<void>> {
  DataSyncController() : super(const AsyncValue.data(null));

  final IsarService isarService = IsarService();
  final Alert alert = Alert();

  Future<void> loadData(WidgetRef ref) async {
    try {
      state = const AsyncValue.loading();

      final parkingSlotListFromDB = await isarService.getParkingSlotListDB();

      for (final parkingSlot in parkingSlotListFromDB) {
        ref.read(parkingSlotProvider.notifier).loadParkingSlotData(parkingSlot);
      }
      final vehicleListFromDB = await isarService.getVehicleListDB();

      for (final vehicle in vehicleListFromDB) {
        ref.read(vehicleProvider.notifier).loadVehicleData(vehicle);
      }
    } catch (e) {
    } finally {
      state = const AsyncValue.data(null);
    }
  }
}

final dataSyncController = StateNotifierProvider<DataSyncController, AsyncValue<void>>((ref) => DataSyncController());
