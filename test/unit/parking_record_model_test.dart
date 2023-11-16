import 'package:flutter_test/flutter_test.dart';
import 'package:parking_manager/src/model/parking_record_model.dart';

void main() {
  test('startParkingRecord adds a new parking record', () {
    final parkingRecordNotifier = ParkingRecordModelNotifier();

    final newParkingRecord = parkingRecordNotifier.startParkingRecord(
      1,
      'Brand',
      'Model',
      'ABC123',
      1,
      DateTime.now(),
    );

    expect(newParkingRecord, isNotNull);
    expect(newParkingRecord.parkingRecordId, equals(1));
    expect(parkingRecordNotifier.state, contains(newParkingRecord));
  });

  test('loadParkingRecord adds an existing parking record', () {
    final parkingRecordNotifier = ParkingRecordModelNotifier();
    final existingParkingRecord = ParkingRecordModel(
      parkingRecordId: 1,
      vehicleId: 1,
      vehicleBrand: 'Brand',
      vehicleModel: 'Model',
      vehicleLicensePlate: 'ABC123',
      parkingSlotNumber: 1,
      entryDate: DateTime.now(),
    );

    parkingRecordNotifier.loadParkingRecord(existingParkingRecord);

    expect(parkingRecordNotifier.state, contains(existingParkingRecord));
  });

  test('editParkingRecordDate modifies entryDate and exitDate', () {
    final parkingRecordNotifier = ParkingRecordModelNotifier();
    final initialParkingRecord = ParkingRecordModel(
      parkingRecordId: 1,
      vehicleId: 1,
      vehicleBrand: 'Brand',
      vehicleModel: 'Model',
      vehicleLicensePlate: 'ABC123',
      parkingSlotNumber: 1,
      entryDate: DateTime.now().subtract(const Duration(days: 1)),
    );
    parkingRecordNotifier.loadParkingRecord(initialParkingRecord);

    final updatedParkingRecord = parkingRecordNotifier.editParkingRecordDate(
      1,
      DateTime.now(),
      DateTime.now().add(const Duration(days: 1)),
    );

    expect(updatedParkingRecord, isNotNull);
    expect(updatedParkingRecord!.entryDate, isNot(equals(initialParkingRecord.entryDate)));
    expect(updatedParkingRecord.exitDate, isNot(equals(initialParkingRecord.exitDate)));
  });
}
