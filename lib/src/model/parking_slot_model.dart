import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

part 'parking_slot_model.g.dart';

@collection
class ParkingSlotModel {
  Id id = Isar.autoIncrement;
  final int parkingSlotId;
  int? occupyingVehicleId;

  ParkingSlotModel({required this.parkingSlotId, this.occupyingVehicleId});

  ParkingSlotModel copyWith({
    int? parkingSlotId,
    int? occupingVehicleId,
  }) {
    return ParkingSlotModel(
      parkingSlotId: parkingSlotId ?? this.parkingSlotId,
      occupyingVehicleId: occupingVehicleId ?? occupyingVehicleId,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is ParkingSlotModel && runtimeType == other.runtimeType && parkingSlotId == other.parkingSlotId && occupyingVehicleId == other.occupyingVehicleId;

  @override
  int get hashCode => parkingSlotId.hashCode ^ occupyingVehicleId.hashCode;
}

class ParkingSlotModelNotifier extends StateNotifier<List<ParkingSlotModel>> {
  ParkingSlotModelNotifier() : super([]);

  ParkingSlotModel createParkingSlot() {
    final lastParkingSlot = state.lastOrNull;

    final newParkingSlotID = lastParkingSlot != null ? lastParkingSlot.id + 1 : 1;

    final newParkingSlot = ParkingSlotModel(parkingSlotId: newParkingSlotID);

    state = [...state, newParkingSlot];

    return newParkingSlot;
  }

  void editOccupyingvehicle(ParkingSlotModel parkingSlot, int? occupyingVehicleId) {
    state = [
      for (final parkingSlotState in state)
        if (parkingSlotState.id == parkingSlot.id) parkingSlotState.copyWith(occupingVehicleId: occupyingVehicleId) else parkingSlotState,
    ];
  }

  void removeParkingSlot(ParkingSlotModel parkingSlot) {
    state = state.where((e) => e != parkingSlot).toList();
  }
}

final parkingSlotProvider = StateNotifierProvider<ParkingSlotModelNotifier, List<ParkingSlotModel>>((ref) => ParkingSlotModelNotifier());
