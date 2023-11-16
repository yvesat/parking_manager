import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

part 'parking_slot_model.g.dart';

@collection
class ParkingSlotModel {
  Id id = Isar.autoIncrement;
  final int parkingSlotNumber;
  final int? occupyingVehicleId;
  final int? currentParkingRecordId;
  final bool available;

  ParkingSlotModel({required this.parkingSlotNumber, this.occupyingVehicleId, this.currentParkingRecordId, this.available = true});

  ParkingSlotModel copyWith({
    int? parkingSlotNumber,
    int? occupyingVehicleId,
    int? currentParkingRecordId,
    bool? available,
  }) {
    return ParkingSlotModel(
      parkingSlotNumber: parkingSlotNumber ?? this.parkingSlotNumber,
      occupyingVehicleId: occupyingVehicleId,
      currentParkingRecordId: currentParkingRecordId,
      available: available ?? this.available,
    );
  }
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
    _sortParkingSlotState();
    return newParkingSlot;
  }

  ParkingSlotModel? checkParkedVehicle(int vehicleId) {
    return state.firstWhereOrNull((e) => e.occupyingVehicleId == vehicleId);
  }

  void loadParkingSlotData(ParkingSlotModel parkingSlot) {
    state = [...state, parkingSlot];
    _sortParkingSlotState();
  }

  ParkingSlotModel? getParkingSlot(int parkingSlotNumber) {
    return state.firstWhereOrNull((e) => e.parkingSlotNumber == parkingSlotNumber);
  }

  ParkingSlotModel? editParkingSlot(int parkingSlotNumber, int? occupyingVehicleId, int? currentParkingRecordId, bool? available) {
    state = [
      for (final parkingSlotState in state)
        if (parkingSlotState.parkingSlotNumber == parkingSlotNumber)
          parkingSlotState.copyWith(
            occupyingVehicleId: occupyingVehicleId,
            currentParkingRecordId: currentParkingRecordId,
            available: available,
          )
        else
          parkingSlotState,
    ];

    _sortParkingSlotState();

    return state.firstWhereOrNull((element) => element.parkingSlotNumber == parkingSlotNumber);
  }

  void removeParkingSlot(ParkingSlotModel parkingSlot) {
    state = state.where((e) => e.parkingSlotNumber != parkingSlot.parkingSlotNumber).toList();
    _sortParkingSlotState();
  }

  void _sortParkingSlotState() {
    state.sort((a, b) => a.parkingSlotNumber.compareTo(b.parkingSlotNumber));
  }
}

final parkingSlotProvider = StateNotifierProvider<ParkingSlotModelNotifier, List<ParkingSlotModel>>((ref) => ParkingSlotModelNotifier());
