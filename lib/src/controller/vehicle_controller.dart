import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/enum/alert_type.dart';
import '../model/parking_slot_model.dart';
import '../model/services/isar_service.dart';
import '../model/vehicle_model.dart';
import '../view/widgets/alert.dart';

class VehicleController extends StateNotifier<AsyncValue<void>> {
  VehicleController() : super(const AsyncValue.data(null));

  final Alert alert = Alert();
  final IsarService isarService = IsarService();

  Future<void> createVehicle(BuildContext context, WidgetRef ref, String brand, String model, String licensePlate) async {
    try {
      state = const AsyncValue.loading();

      final vehicleState = ref.read(vehicleProvider.notifier);

      final normalizedSearch = licensePlate.toUpperCase();

      final vehicleExists = ref.read(vehicleProvider.notifier).searchVehicleByLP(normalizedSearch);

      if (vehicleExists != null) throw Exception("Placa do veículo já tem cadastro!");

      final newVehicle = vehicleState.createVehicle(brand, model, normalizedSearch);
      await isarService.saveVehicleDB(newVehicle);

      if (context.mounted) alert.snack(context, "Veículo ${newVehicle.brand} ${newVehicle.model} criado!");
    } catch (e) {
      rethrow;
    } finally {
      state = const AsyncValue.data(null);
    }
  }

  VehicleModel? getVehicle(WidgetRef ref, int? vehicleId) {
    return ref.watch(vehicleProvider).firstWhereOrNull((e) => e.vehicleId == vehicleId);
  }

  List<VehicleModel> getVehicleState(WidgetRef ref) {
    return ref.watch(vehicleProvider);
  }

  Future<void> editVehicle(BuildContext context, WidgetRef ref, VehicleModel vehicle, String? brand, String? model, String? licensePlate) async {
    String? normalizedLicensePlate;
    if (licensePlate != null) normalizedLicensePlate = licensePlate.toUpperCase();
    final editedVehicle = ref.read(vehicleProvider.notifier).editVehicle(vehicle, brand, model, normalizedLicensePlate);
    await isarService.saveVehicleDB(editedVehicle);
  }

  Future<void> removeVehicle(BuildContext context, WidgetRef ref, VehicleModel vehicle) async {
    try {
      final vehicleState = ref.read(vehicleProvider.notifier);

      alert.dialog(
        context,
        AlertType.warning,
        "Confirmar exclusão do veículo de placa ${vehicle.licensePlate}?",
        onPress: () async {
          state = const AsyncValue.loading();

          final vehicleIsParked = ref.read(parkingSlotProvider).firstWhereOrNull((e) => e.occupyingVehicleId == vehicle.vehicleId);
          if (vehicleIsParked != null) throw Exception("Veículo está estacionado. Registre saída antes de excluir.");

          final removedVehicleLicensePlate = vehicle.licensePlate;

          vehicleState.removeVehicle(vehicle);
          await isarService.removeVehicleDB(vehicle);

          if (context.mounted) alert.snack(context, "Veículo de placa $removedVehicleLicensePlate removido!");
        },
      );
    } catch (e) {
      alert.dialog(context, AlertType.error, e.toString());
    } finally {
      state = const AsyncValue.data(null);
      if (context.mounted) context.pop();
    }
  }
}

final vehicleControllerProvider = StateNotifierProvider<VehicleController, AsyncValue<void>>((ref) => VehicleController());
