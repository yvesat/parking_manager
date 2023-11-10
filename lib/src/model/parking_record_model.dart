import 'package:isar/isar.dart';

part 'parking_record_model.g.dart';

@collection
class ParkingRecordModel {
  Id id = Isar.autoIncrement;
  final int parkingRecordId;
  final int vehicleId;
  final String vehicleBrandModel;
  final String vehicleLicenePlate;
  final int parkingSlotId;
  final DateTime entryTime;
  final DateTime? exitTime;

  ParkingRecordModel({
    required this.parkingRecordId,
    required this.vehicleId,
    required this.vehicleBrandModel,
    required this.vehicleLicenePlate,
    required this.parkingSlotId,
    required this.entryTime,
    this.exitTime,
  });
}
