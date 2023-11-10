// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:parking_manager/src/model/parking_slot_model.dart';

import '../model/services/isar_service.dart';
import '../view/widgets/alert.dart';

class CartController extends StateNotifier<AsyncValue<void>> {
  CartController() : super(const AsyncValue.data(null));

  final Alert alert = Alert();
  final IsarService isarService = IsarService();

  Future<void> createParkingSlot(BuildContext context, WidgetRef ref) async {
    try {
      state = const AsyncValue.loading();

      final parkingSlotState = ref.read(parkingSlotProvider.notifier);

      final newParkingSlot = parkingSlotState.createParkingSlot();

      await isarService.saveParkingslotDB(newParkingSlot);

      alert.snack(context, "Vaga ${newParkingSlot.parkingSlotId} criada!");
    } catch (e) {
      alert.snack(context, e.toString());
    } finally {
      state = const AsyncValue.data(null);
    }
  }

  Future<void> removeParkingSlot(BuildContext context, WidgetRef ref, ParkingSlotModel parkingSlot) async {
    try {
      state = const AsyncValue.loading();
      final idRemovedParkingSlot = parkingSlot.parkingSlotId;
      final parkingSlotState = ref.read(parkingSlotProvider.notifier);

      parkingSlotState.removeParkingSlot(parkingSlot);

      await isarService.removeParkingslotDB(parkingSlot);

      alert.snack(context, "Vaga $idRemovedParkingSlot removida!");
    } catch (e) {
      alert.snack(context, e.toString());
    } finally {
      state = const AsyncValue.data(null);
    }
  }
}

final cartControllerProvider = StateNotifierProvider<CartController, AsyncValue<void>>((ref) => CartController());
