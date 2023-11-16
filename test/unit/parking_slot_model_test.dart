import 'package:flutter_test/flutter_test.dart';
import 'package:parking_manager/src/model/parking_slot_model.dart';

void main() {
  test('createParkingSlot adds a new parking slot', () {
    final parkingSlotNotifier = ParkingSlotModelNotifier();

    final newParkingSlot = parkingSlotNotifier.createParkingSlot();

    expect(newParkingSlot, isNotNull);
    expect(newParkingSlot.parkingSlotNumber, equals(1));
    expect(parkingSlotNotifier.state, contains(newParkingSlot));
  });

  test('checkParkedVehicle returns parked vehicle', () {
    final parkingSlotNotifier = ParkingSlotModelNotifier();
    const parkedVehicleId = 1;
    final existingParkingSlot = ParkingSlotModel(
      parkingSlotNumber: 1,
      occupyingVehicleId: parkedVehicleId,
    );
    parkingSlotNotifier.loadParkingSlotData(existingParkingSlot);

    final parkedVehicle = parkingSlotNotifier.checkParkedVehicle(parkedVehicleId);

    expect(parkedVehicle, isNotNull);
    expect(parkedVehicle!.occupyingVehicleId, equals(parkedVehicleId));
  });

  test('getParkingSlot returns the correct parking slot', () {
    final parkingSlotNotifier = ParkingSlotModelNotifier();
    const targetParkingSlotNumber = 1;
    final existingParkingSlot = ParkingSlotModel(parkingSlotNumber: targetParkingSlotNumber);
    parkingSlotNotifier.loadParkingSlotData(existingParkingSlot);

    final retrievedParkingSlot = parkingSlotNotifier.getParkingSlot(targetParkingSlotNumber);

    expect(retrievedParkingSlot, isNotNull);
    expect(retrievedParkingSlot!.parkingSlotNumber, equals(targetParkingSlotNumber));
  });

  test('editParkingSlot modifies parking slot properties', () {
    final parkingSlotNotifier = ParkingSlotModelNotifier();
    final initialParkingSlot = ParkingSlotModel(parkingSlotNumber: 1, available: true);
    parkingSlotNotifier.loadParkingSlotData(initialParkingSlot);

    final updatedParkingSlot = parkingSlotNotifier.editParkingSlot(1, 2, 3, false);

    expect(updatedParkingSlot, isNotNull);
    expect(updatedParkingSlot!.occupyingVehicleId, equals(2));
    expect(updatedParkingSlot.currentParkingRecordId, equals(3));
    expect(updatedParkingSlot.available, isFalse);
  });

  test('removeParkingSlot removes the parking slot', () {
    final parkingSlotNotifier = ParkingSlotModelNotifier();
    const targetParkingSlotNumber = 1;
    final existingParkingSlot = ParkingSlotModel(parkingSlotNumber: targetParkingSlotNumber);
    parkingSlotNotifier.loadParkingSlotData(existingParkingSlot);

    parkingSlotNotifier.removeParkingSlot(existingParkingSlot);

    expect(parkingSlotNotifier.state, isNot(contains(existingParkingSlot)));
  });
}
