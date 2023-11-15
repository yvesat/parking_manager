import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:parking_manager/src/model/vehicle_model.dart';

import '../model/services/isar_service.dart';
import '../view/widgets/alert.dart';

class VehicleController extends StateNotifier<AsyncValue<void>> {
  VehicleController() : super(const AsyncValue.data(null));

  final Alert alert = Alert();
  final IsarService isarService = IsarService();

  Future<void> createVehicle(BuildContext context, WidgetRef ref, String brand, String model, String licensePlate) async {
    try {
      state = const AsyncValue.loading();

      final vehicleState = ref.read(vehicleProvider.notifier);
      final newVehicle = vehicleState.createVehicle(brand, model, licensePlate);
      await isarService.saveVehicleDB(newVehicle);

      if (context.mounted) alert.snack(context, "Veículo ${newVehicle.brand} ${newVehicle.model} criado!");
    } catch (e) {
      if (context.mounted) alert.snack(context, e.toString());
    } finally {
      state = const AsyncValue.data(null);
    }
  }

  VehicleModel? getVehicle(WidgetRef ref, int? vehicleId) {
    try {
      if (vehicleId == null) return null;
      return ref.watch(vehicleProvider.notifier).getVehicle(vehicleId);
    } catch (e) {
      return null;
    }
  }

  List<VehicleModel> getVehicleState(WidgetRef ref) {
    return ref.watch(vehicleProvider);
  }

  VehicleModel? searchVehicleByLP(WidgetRef ref, String licensePlate) {
    return ref.watch(vehicleProvider.notifier).searchVehicleByLP(licensePlate);
  }

  Future<void> removeVehicle(BuildContext context, WidgetRef ref, VehicleModel vehicle) async {
    try {
      state = const AsyncValue.loading();
      final vehicleState = ref.read(vehicleProvider.notifier);

      vehicleState.removeVehicle(vehicle);

      await isarService.removeVehicleDB(vehicle);

      if (context.mounted) alert.snack(context, "Veículo excluído!");
    } catch (e) {
      if (context.mounted) alert.snack(context, e.toString());
    } finally {
      state = const AsyncValue.data(null);
    }
  }
}

final vehicleControllerProvider = StateNotifierProvider<VehicleController, AsyncValue<void>>((ref) => VehicleController());
