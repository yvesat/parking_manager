// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:parking_manager/src/model/parking_slot_model.dart';

import '../model/services/isar_service.dart';
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
      await isarService.saveParkingslotDB(newParkingSlot);

      alert.snack(context, "Vaga ${newParkingSlot.parkingSlotNumber} criada!");
    } catch (e) {
      alert.snack(context, e.toString());
    } finally {
      state = const AsyncValue.data(null);
    }
  }

  ParkingSlotModel? getParkingSlot(WidgetRef ref, int id) {
    try {
      return ref.watch(parkingSlotProvider.notifier).getParkingSlot(id);
    } catch (e) {
      return null;
    }
  }

  List<ParkingSlotModel> getParkingSlotState(WidgetRef ref) {
    return ref.watch(parkingSlotProvider);
  }

  Future<void> removeParkingSlot(BuildContext context, WidgetRef ref, ParkingSlotModel parkingSlot) async {
    try {
      state = const AsyncValue.loading();
      final removedParkingSlotNumber = parkingSlot.parkingSlotNumber;
      final parkingSlotState = ref.read(parkingSlotProvider.notifier);

      parkingSlotState.removeParkingSlot(parkingSlot);

      await isarService.removeParkingSlotDB(parkingSlot);

      alert.snack(context, "Vaga $removedParkingSlotNumber removida!"); //TODO: Corrigir
    } catch (e) {
      alert.snack(context, e.toString());
    } finally {
      state = const AsyncValue.data(null);
    }
  }
}

final parkingSlotControllerProvider = StateNotifierProvider<ParkingSlotController, AsyncValue<void>>((ref) => ParkingSlotController());
