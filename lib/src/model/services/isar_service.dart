import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../entry_exit_record_model.dart';
import '../parking_slot_model.dart';
import '../vehicle_model.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<void> clearDB() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        directory: dir.path,
        [VehicleModelSchema, ParkingSlotModelSchema, EntryExitRecordModelSchema],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
