import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:parking_manager/src/model/enum/alert_type.dart';

import '../model/parking_record_model.dart';
import '../model/parking_slot_model.dart';
import '../model/services/isar_service.dart';
import '../model/vehicle_model.dart';
import '../view/widgets/alert.dart';

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

  ParkingRecordModel? getParkingRecordByParkSLNUM(WidgetRef ref, int parkingSlotNumber) {
    return ref.read(parkingRecordProvider.notifier).getParkingRecordByParkSLNUM(parkingSlotNumber);
  }

  Future<DateTime?> setDate(BuildContext context, DateTime currentDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != currentDate) {
      return pickedDate;
    } else {
      return null;
    }
  }

  Future<DateTime?> setTime(BuildContext context, DateTime currentDate) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(currentDate),
    );

    if (selectedTime != null) {
      return DateTime(currentDate.year, currentDate.day, selectedTime.hour, selectedTime.minute);
    } else {
      return null;
    }
  }

  Future<void> setVehicleEntry(WidgetRef ref, BuildContext context, int vehicleId, int parkingSlotNumber, DateTime entryDate) async {
    try {
      await _setVehicleEntryExit(ref, context, vehicleId, parkingSlotNumber);
      final vehicle = ref.read(vehicleProvider.notifier).getVehicleById(vehicleId);

      if (vehicle == null) throw Exception("Veículo não encontrado no estado da aplicação");

      final newParkingRecord = ref.read(parkingRecordProvider.notifier).startParkingRecord(vehicle.vehicleId, vehicle.brand, vehicle.model, vehicle.licensePlate, parkingSlotNumber, entryDate);
      await isarService.saveParkingRecordDB(newParkingRecord);
    } catch (e) {
      if (context.mounted) alert.snack(context, e.toString());
    } finally {
      state = const AsyncValue.data(null);
    }
  }

  Future<void> setVehicleExit(WidgetRef ref, BuildContext context, int vehicleId, int parkingSlotNumber, DateTime exitDate) async {
    await _setVehicleEntryExit(ref, context, null, parkingSlotNumber);
    final vehicle = ref.read(vehicleProvider.notifier).getVehicleById(vehicleId);

    if (vehicle == null) throw Exception("Veículo não encontrado no estado da aplicação");

    final newParkingRecord = ref.read(parkingRecordProvider.notifier).endParkingRecord(parkingSlotNumber, exitDate);
    if (newParkingRecord == null) throw Exception("Falha ao editar data de saída do veículo.");
    await isarService.saveParkingRecordDB(newParkingRecord);
  }

  Future<void> _setVehicleEntryExit(WidgetRef ref, BuildContext context, int? vehicleId, int parkingSlotNumber) async {
    try {
      final alteredParkingSlot = ref.read(parkingSlotProvider.notifier).editOccupyingvehicle(parkingSlotNumber, vehicleId);
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
