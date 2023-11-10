import 'package:isar/isar.dart';

part 'entry_exit_record_model.g.dart';

@collection
class EntryExitRecordModel {
  Id id = Isar.autoIncrement;

  final int vehicleId;
  final String vehicleBrandModel;
  final String vehicleLicenePlate;
  final int parkingSlotId;
  final DateTime entryTime;
  final DateTime? exitTime;

  EntryExitRecordModel({
    required this.vehicleId,
    required this.vehicleBrandModel,
    required this.vehicleLicenePlate,
    required this.parkingSlotId,
    required this.entryTime,
    this.exitTime,
  });
}
