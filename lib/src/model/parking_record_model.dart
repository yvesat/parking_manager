import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

part 'parking_record_model.g.dart';

@collection
class ParkingRecordModel {
  Id id = Isar.autoIncrement;
  final int parkingRecordId;
  final int vehicleId;
  final String vehicleBrand;
  final String vehicleModel;
  final String vehicleLicensePlate;
  final int parkingSlotNumber;
  final DateTime entryDate;
  final DateTime? exitDate;

  ParkingRecordModel({
    required this.parkingRecordId,
    required this.vehicleId,
    required this.vehicleBrand,
    required this.vehicleModel,
    required this.vehicleLicensePlate,
    required this.parkingSlotNumber,
    required this.entryDate,
    this.exitDate,
  });

  ParkingRecordModel copyWith({
    int? parkingRecordId,
    int? vehicleId,
    String? vehicleBrand,
    String? vehicleModel,
    String? vehicleLicensePlate,
    int? parkingSlotNumber,
    DateTime? entryTime,
    DateTime? exitTime,
  }) {
    return ParkingRecordModel(
      parkingRecordId: parkingRecordId ?? this.parkingRecordId,
      vehicleId: vehicleId ?? this.vehicleId,
      vehicleBrand: vehicleBrand ?? this.vehicleBrand,
      vehicleModel: vehicleModel ?? this.vehicleModel,
      vehicleLicensePlate: vehicleLicensePlate ?? this.vehicleLicensePlate,
      parkingSlotNumber: parkingSlotNumber ?? this.parkingSlotNumber,
      entryDate: entryTime ?? this.entryDate,
      exitDate: exitTime ?? this.exitDate,
    );
  }
}

class ParkingRecordModelNotifier extends StateNotifier<List<ParkingRecordModel>> {
  ParkingRecordModelNotifier() : super([]);

  ParkingRecordModel createParkingRecord(
    int vehicleId,
    String vehicleBrand,
    String vehicleModel,
    String vehicleLicensePlate,
    int parkingSlotNumber,
    DateTime entryDate,
  ) {
    int newParkingRecordId = 1;

    if (state.isNotEmpty) {
      state.sort((a, b) => a.vehicleId.compareTo(b.vehicleId));
      newParkingRecordId = state.last.parkingRecordId + 1;
    }

    final newParkingRecord = ParkingRecordModel(
      parkingRecordId: newParkingRecordId,
      vehicleId: vehicleId,
      vehicleBrand: vehicleBrand,
      vehicleModel: vehicleModel,
      vehicleLicensePlate: vehicleLicensePlate,
      parkingSlotNumber: parkingSlotNumber,
      entryDate: entryDate,
    );

    state = [...state, newParkingRecord];
    return newParkingRecord;
  }

  void loadParkingRecord(ParkingRecordModel parkingRecordModel) {
    state = [...state, parkingRecordModel];
  }

  ParkingRecordModel? getParkingRecordByParkSLNUM(int parkingSlotNumber) {
    return state.firstWhereOrNull((e) => e.parkingSlotNumber == parkingSlotNumber);
  }
}

final parkingRecordProvider = StateNotifierProvider<ParkingRecordModelNotifier, List<ParkingRecordModel>>((ref) => ParkingRecordModelNotifier());
