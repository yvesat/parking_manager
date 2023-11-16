import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/parking_record_model.dart';
import '../model/services/isar_service.dart';
import '../model/vehicle_model.dart';
import '../view/widgets/alert.dart';

class ParkingRecordController extends StateNotifier<AsyncValue<void>> {
  ParkingRecordController() : super(const AsyncValue.data(null));

  final Alert alert = Alert();
  final IsarService isarService = IsarService();

  Future<int> startParkingRecord(WidgetRef ref, VehicleModel vehicle, int parkingSlotNumber, DateTime entryDate) async {
    final newParkingRecord = ref.read(parkingRecordProvider.notifier).startParkingRecord(vehicle.vehicleId, vehicle.brand, vehicle.model, vehicle.licensePlate, parkingSlotNumber, entryDate);
    await isarService.saveParkingRecordDB(newParkingRecord);

    return newParkingRecord.parkingRecordId;
  }

  List<ParkingRecordModel> getParkingRecordsBetweenDays(WidgetRef ref, DateTime entryDate, DateTime exitDate) {
    return ref.watch(parkingRecordProvider).where((record) {
      int recordDay = record.entryDate.day;
      return recordDay >= entryDate.day && recordDay <= exitDate.day;
    }).toList();
  }

  ParkingRecordModel? getParkingRecordById(WidgetRef ref, int? currentParkingRecordId) {
    return ref.watch(parkingRecordProvider).firstWhereOrNull((e) => e.parkingRecordId == currentParkingRecordId);
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
      return DateTime(currentDate.year, currentDate.month, currentDate.day, selectedTime.hour, selectedTime.minute);
    } else {
      return null;
    }
  }

  bool timeDateValidation(DateTime entryDate, DateTime? exitDate) {
    if (exitDate == null) return false;

    final entryDateCheck = DateTime(entryDate.year, entryDate.month, entryDate.day, entryDate.hour, entryDate.minute);
    final exitDateCheck = DateTime(exitDate.year, exitDate.month, exitDate.day, exitDate.hour, exitDate.minute);

    return entryDateCheck.isBefore(exitDateCheck);
  }

  Future<void> editParkingRecordDate(WidgetRef ref, BuildContext context, int parkingRecordId, DateTime? entryDate, DateTime? exitDate) async {
    final editedParkingRecord = ref.read(parkingRecordProvider.notifier).editParkingRecordDate(parkingRecordId, entryDate, exitDate);
    if (editedParkingRecord == null) throw Exception("Falha ao editar data de registro do veículo.");
    await isarService.saveParkingRecordDB(editedParkingRecord);
  }
}

final parkingRecordControllerProvider = StateNotifierProvider<ParkingRecordController, AsyncValue<void>>((ref) => ParkingRecordController());
