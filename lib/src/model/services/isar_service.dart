import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../parking_record_model.dart';
import '../parking_slot_model.dart';
import '../vehicle_model.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  //Vehicle database opertaions
  Future<void> saveVehicleDB(VehicleModel vehicle) async {
    final isar = await db;

    await removeVehicleDB(vehicle); //Garantindo que o objeto a ser inserido será único
    await isar.writeTxn(() async => await isar.vehicleModels.put(vehicle));
  }

  Future<VehicleModel?> getVehicleByIdDB(int vehicleId) async {
    final isar = await db;
    VehicleModel? vehicle = await isar.vehicleModels.filter().vehicleIdEqualTo(vehicleId).findFirst();
    return vehicle;
  }

  Future<List<VehicleModel>> getVehicleListDB() async {
    final isar = await db;
    return isar.vehicleModels.where().findAll();
  }

  Future<void> removeVehicleDB(VehicleModel vehicle) async {
    final isar = await db;

    final vehicleToDelete = await isar.vehicleModels.filter().vehicleIdEqualTo(vehicle.vehicleId).findFirst();
    if (vehicleToDelete != null) await isar.writeTxn(() async => await isar.vehicleModels.delete(vehicleToDelete.id));
  }

  //Parking Slot database opertaions
  Future<void> saveParkingslotDB(ParkingSlotModel parkingslot) async {
    final isar = await db;

    await removeParkingslotDB(parkingslot); //Garantindo que o objeto a ser inserido será único
    await isar.writeTxn(() async => await isar.parkingSlotModels.put(parkingslot));
  }

  Future<ParkingSlotModel?> getPakingsSlotByIdDB(int parkingSlotId) async {
    final isar = await db;
    ParkingSlotModel? parkingSlot = await isar.parkingSlotModels.filter().parkingSlotIdEqualTo(parkingSlotId).findFirst();
    return parkingSlot;
  }

  Future<List<ParkingSlotModel>> getParkingSlotListDB() async {
    final isar = await db;
    return isar.parkingSlotModels.where().findAll();
  }

  Future<void> removeParkingslotDB(ParkingSlotModel parkingslot) async {
    final isar = await db;

    final parkingSlotToDelete = await isar.parkingSlotModels.filter().parkingSlotIdEqualTo(parkingslot.parkingSlotId).findFirst();
    if (parkingSlotToDelete != null) await isar.writeTxn(() async => await isar.parkingSlotModels.delete(parkingSlotToDelete.id));
  }

  Future<void> saveVehicle(VehicleModel vehicle) async {
    final isar = await db;

    await removeVehicleDB(vehicle); //Garantindo que o objeto a ser inserido será único
    await isar.writeTxn(() async => await isar.vehicleModels.put(vehicle));
  }

  //Parking Record database opertaions
  Future<ParkingRecordModel?> getParkingRecordByIdDB(int parkingRecordId) async {
    final isar = await db;
    ParkingRecordModel? parkingRecord = await isar.parkingRecordModels.filter().parkingRecordIdEqualTo(parkingRecordId).findFirst();
    return parkingRecord;
  }

  Future<List<ParkingRecordModel>> getParkingRecordDB() async {
    final isar = await db;
    return isar.parkingRecordModels.where().findAll();
  }

  Future<void> removeParkingRecordDB(ParkingRecordModel parkingRecord) async {
    final isar = await db;

    final parkingRecordToDelete = await isar.parkingRecordModels.filter().parkingRecordIdEqualTo(parkingRecord.parkingRecordId).findFirst();
    if (parkingRecordToDelete != null) await isar.writeTxn(() async => await isar.parkingRecordModels.delete(parkingRecordToDelete.id));
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        directory: dir.path,
        [VehicleModelSchema, ParkingSlotModelSchema, ParkingRecordModelSchema],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
