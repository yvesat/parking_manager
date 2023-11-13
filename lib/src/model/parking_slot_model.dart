import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

part 'parking_slot_model.g.dart';

@collection
class ParkingSlotModel {
  Id id = Isar.autoIncrement;
  final int parkingSlotNumber;
  final int? occupyingVehicleId;
  final bool available;

  ParkingSlotModel({required this.parkingSlotNumber, this.occupyingVehicleId, this.available = true});

  ParkingSlotModel copyWith({
    int? parkingSlotNumber,
    int? occupyingVehicleId,
    bool? available,
  }) {
    return ParkingSlotModel(
      parkingSlotNumber: parkingSlotNumber ?? this.parkingSlotNumber,
      occupyingVehicleId: occupyingVehicleId ?? this.occupyingVehicleId,
      available: available ?? this.available,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is ParkingSlotModel && runtimeType == other.runtimeType && parkingSlotNumber == other.parkingSlotNumber && occupyingVehicleId == other.occupyingVehicleId;

  @override
  int get hashCode => parkingSlotNumber.hashCode ^ occupyingVehicleId.hashCode;
}

class ParkingSlotModelNotifier extends StateNotifier<List<ParkingSlotModel>> {
  ParkingSlotModelNotifier() : super([]);

  ParkingSlotModel createParkingSlot() {
    int newParkingSlotNumber = 1;

    if (state.isNotEmpty) {
      state.sort((a, b) => a.parkingSlotNumber.compareTo(b.parkingSlotNumber));
      newParkingSlotNumber = state.last.parkingSlotNumber + 1;
    }

    final newParkingSlot = ParkingSlotModel(parkingSlotNumber: newParkingSlotNumber);

    state = [...state, newParkingSlot];

    return newParkingSlot;
  }

  void loadParkingSlotData(ParkingSlotModel parkingSlot) {
    state = [...state, parkingSlot];
  }

  ParkingSlotModel? getParkingSlot(int parkingSlotNumber) {
    return state.firstWhereOrNull((e) => e.parkingSlotNumber == parkingSlotNumber);
  }

  ParkingSlotModel? editOccupyingvehicle(int parkingSlotNumber, int? occupyingVehicleId) {
    state = [
      for (final parkingSlotState in state)
        if (parkingSlotState.parkingSlotNumber == parkingSlotNumber)
          parkingSlotState.copyWith(
            occupyingVehicleId: occupyingVehicleId,
            available: occupyingVehicleId != null ? false : true,
          )
        else
          parkingSlotState,
    ];

    return state.firstWhereOrNull((element) => element.parkingSlotNumber == parkingSlotNumber);
  }

  void removeParkingSlot(ParkingSlotModel parkingSlot) {
    state = state.where((e) => e.parkingSlotNumber != parkingSlot.parkingSlotNumber).toList();
  }
}

final parkingSlotProvider = StateNotifierProvider<ParkingSlotModelNotifier, List<ParkingSlotModel>>((ref) => ParkingSlotModelNotifier());
