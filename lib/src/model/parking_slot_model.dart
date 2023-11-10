import 'package:isar/isar.dart';

part 'parking_slot_model.g.dart';

@collection
class ParkingSlotModel {
  Id id = Isar.autoIncrement;
  final int parkingSlotId;
  final bool isOccupied;
  int? occupingVehicleId;

  ParkingSlotModel({required this.parkingSlotId, required this.isOccupied});
}
