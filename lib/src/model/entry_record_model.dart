import 'parking_slot_model.dart';
import 'vehicle_model.dart';

class EntryExitRecordModel {
  VehicleModel vehicle;
  ParkingSlotModel parkingSpace;
  DateTime entryTime;
  DateTime? exitTime;

  EntryExitRecordModel({
    required this.vehicle,
    required this.parkingSpace,
    required this.entryTime,
    this.exitTime,
  });
}
