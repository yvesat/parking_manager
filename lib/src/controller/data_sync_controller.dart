// ignore_for_file: use_build_context_synchronously
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/parking_record_model.dart';
import '../model/parking_slot_model.dart';
import '../model/services/isar_service.dart';
import '../model/vehicle_model.dart';
import '../view/widgets/alert.dart';

class DataSyncController extends StateNotifier<AsyncValue<void>> {
  DataSyncController() : super(const AsyncValue.data(null));

  final IsarService isarService = IsarService();
  final Alert alert = Alert();

  Future<void> loadData(WidgetRef ref) async {
    try {
      state = const AsyncValue.loading();

      final vehicleListFromDB = await isarService.getVehicleListDB();

      for (final vehicle in vehicleListFromDB) {
        ref.read(vehicleProvider.notifier).loadVehicleData(vehicle);
      }

      final parkingSlotListFromDB = await isarService.getParkingSlotListDB();

      for (final parkingSlot in parkingSlotListFromDB) {
        ref.read(parkingSlotProvider.notifier).loadParkingSlotData(parkingSlot);
      }

      final parkingRecordListFromDB = await isarService.getParkingRecordDB();

      for (final parkingRecord in parkingRecordListFromDB) {
        ref.read(parkingRecordProvider.notifier).loadParkingRecord(parkingRecord);
      }
    } catch (e) {
    } finally {
      state = const AsyncValue.data(null);
    }
  }
}

final dataSyncController = StateNotifierProvider<DataSyncController, AsyncValue<void>>((ref) => DataSyncController());
