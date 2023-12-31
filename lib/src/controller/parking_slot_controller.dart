import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/enum/alert_type.dart';
import '../model/parking_slot_model.dart';
import '../model/services/isar_service.dart';
import '../model/vehicle_model.dart';
import '../view/widgets/alert.dart';
import 'parking_record_controllder.dart';

class ParkingSlotController extends StateNotifier<AsyncValue<void>> {
  ParkingSlotController() : super(const AsyncValue.data(null));

  final Alert alert = Alert();
  final IsarService isarService = IsarService();

  Future<void> createParkingSlot(BuildContext context, WidgetRef ref) async {
    try {
      state = const AsyncValue.loading();

      final parkingSlotState = ref.read(parkingSlotProvider.notifier);
      final newParkingSlot = parkingSlotState.createParkingSlot();
      await isarService.saveParkingSlotDB(newParkingSlot);

      if (context.mounted) alert.snack(context, "Vaga ${newParkingSlot.parkingSlotNumber} criada!");
    } catch (e) {
      if (context.mounted) alert.snack(context, e.toString());
    } finally {
      state = const AsyncValue.data(null);
    }
  }

  ParkingSlotModel? getParkingSlot(WidgetRef ref, BuildContext context, int id) {
    try {
      return ref.watch(parkingSlotProvider.notifier).getParkingSlot(id);
    } catch (e) {
      alert.snack(context, e.toString());
      return null;
    }
  }

  List<ParkingSlotModel> getParkingSlotState(WidgetRef ref) {
    return ref.watch(parkingSlotProvider);
  }

  ParkingSlotModel? isVehiceParked(WidgetRef ref, int vehicleId) {
    return ref.read(parkingSlotProvider.notifier).checkParkedVehicle(vehicleId);
  }

  Future<void> setVehicleEntry(WidgetRef ref, BuildContext context, int vehicleId, int parkingSlotNumber, DateTime entryDate) async {
    try {
      final vehicle = ref.read(vehicleProvider.notifier).getVehicleById(vehicleId);
      if (vehicle == null) throw Exception("Veículo não encontrado no estado da aplicação");

      final newParkingRecordId = await ref.read(parkingRecordControllerProvider.notifier).startParkingRecord(ref, vehicle, parkingSlotNumber, entryDate);

      if (context.mounted) await _setVehicleEntryExit(ref, context, vehicleId, parkingSlotNumber, newParkingRecordId, false);
    } catch (e) {
      if (context.mounted) alert.snack(context, e.toString());
    } finally {
      state = const AsyncValue.data(null);
    }
  }

  Future<void> setVehicleExit(WidgetRef ref, BuildContext context, int vehicleId, int parkingSlotNumber, DateTime exitDate) async {
    final vehicle = ref.read(vehicleProvider.notifier).getVehicleById(vehicleId);

    if (vehicle == null) throw Exception("Veículo não encontrado no estado da aplicação");
    if (context.mounted) ref.read(parkingRecordControllerProvider.notifier).editParkingRecordDate(ref, context, parkingSlotNumber, null, exitDate);

    await _setVehicleEntryExit(ref, context, null, parkingSlotNumber, null, true);
  }

  Future<void> _setVehicleEntryExit(WidgetRef ref, BuildContext context, int? vehicleId, int parkingSlotNumber, int? currentParkingRecordId, bool available) async {
    try {
      final alteredParkingSlot = ref.read(parkingSlotProvider.notifier).editParkingSlot(parkingSlotNumber, vehicleId, currentParkingRecordId, available);
      if (alteredParkingSlot == null) throw Exception("Vaga não encontrada no estado da aplicação");
      await isarService.saveParkingSlotDB(alteredParkingSlot);
    } catch (e) {
      if (context.mounted) alert.snack(context, e.toString());
    } finally {
      state = const AsyncValue.data(null);
    }
  }

  Future<void> removeParkingSlot(BuildContext context, WidgetRef ref, ParkingSlotModel parkingSlot) async {
    try {
      if (!parkingSlot.available) {
        await alert.snack(context, "A vaga está ocupada. Dê saída no veículo antes de fazer a exclusão");
        return;
      }
      if (context.mounted) {
        await alert.dialog(
          context,
          AlertType.warning,
          "Confirmar exclusão da vaga ${parkingSlot.parkingSlotNumber}",
          onPress: () async {
            final removedParkingSlotNumber = parkingSlot.parkingSlotNumber;
            final parkingSlotState = ref.read(parkingSlotProvider.notifier);

            parkingSlotState.removeParkingSlot(parkingSlot);

            state = const AsyncValue.loading();
            await isarService.removeParkingSlotDB(parkingSlot);

            if (context.mounted) alert.snack(context, "Vaga $removedParkingSlotNumber removida!");
            if (context.mounted) context.pop();
          },
        );
      }
    } catch (e) {
      if (context.mounted) alert.snack(context, e.toString());
    } finally {
      state = const AsyncValue.data(null);
    }
  }
}

final parkingSlotControllerProvider = StateNotifierProvider<ParkingSlotController, AsyncValue<void>>((ref) => ParkingSlotController());
