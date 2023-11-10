import 'package:isar/isar.dart';

class ParkingSlotModel {
  Id id = Isar.autoIncrement;
  final int slotId;
  final bool isOccupied;

  ParkingSlotModel({required this.slotId, required this.isOccupied});
}
