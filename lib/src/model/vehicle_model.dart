import 'package:isar/isar.dart';

part 'vehicle_model.g.dart';

@collection
class VehicleModel {
  Id id = Isar.autoIncrement;
  final int vehicleId;
  final String brand;
  final String model;
  final String licensePlate;

  VehicleModel({
    required this.vehicleId,
    required this.brand,
    required this.model,
    required this.licensePlate,
  });
}
