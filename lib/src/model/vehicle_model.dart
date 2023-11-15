import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

  VehicleModel copyWith({
    int? vehicleId,
    String? brand,
    String? model,
    String? licensePlate,
  }) {
    return VehicleModel(
      vehicleId: vehicleId ?? this.vehicleId,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      licensePlate: licensePlate ?? this.licensePlate,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is VehicleModel && runtimeType == other.runtimeType && vehicleId == other.vehicleId && brand == other.brand && model == other.model && licensePlate == other.licensePlate;

  @override
  int get hashCode => vehicleId.hashCode ^ brand.hashCode ^ model.hashCode ^ licensePlate.hashCode;
}

class VehicleModelNotifier extends StateNotifier<List<VehicleModel>> {
  VehicleModelNotifier() : super([]);

  VehicleModel createVehicle(String brand, String model, String licensePlate) {
    int newVehicleId = 1;

    if (state.isNotEmpty) {
      state.sort((a, b) => a.vehicleId.compareTo(b.vehicleId));
      newVehicleId = state.last.vehicleId + 1;
    }

    final newVehicle = VehicleModel(
      vehicleId: newVehicleId,
      brand: brand,
      model: model,
      licensePlate: licensePlate,
    );

    state = [...state, newVehicle];

    return newVehicle;
  }

  void loadVehicleData(VehicleModel vehicle) {
    state = [...state, vehicle];
  }

  List<String> getLicensePlateList() {
    List<String> licensePlateList = [];

    for (final vehicle in state) {
      licensePlateList.add(vehicle.licensePlate);
    }

    return licensePlateList;
  }

  VehicleModel? searchVehicleByLP(String licensePlate) {
    return state.firstWhereOrNull((e) => e.licensePlate == licensePlate);
  }

  List<VehicleModel> getVehicleState() {
    return state;
  }

  VehicleModel editVehicle(VehicleModel vehicle, String? brand, String? model, String? licensePlate) {
    state = [
      for (final vehicleState in state)
        if (vehicleState.vehicleId == vehicle.vehicleId) vehicleState.copyWith(brand: brand, model: model, licensePlate: licensePlate) else vehicleState,
    ];

    return state.firstWhere((e) => e.vehicleId == vehicle.vehicleId);
  }

  void removeVehicle(VehicleModel vehicle) {
    state = state.where((e) => e.vehicleId != vehicle.vehicleId).toList();
  }
}

final vehicleProvider = StateNotifierProvider<VehicleModelNotifier, List<VehicleModel>>((ref) => VehicleModelNotifier());
