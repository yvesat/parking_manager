import 'package:flutter_test/flutter_test.dart';
import 'package:parking_manager/src/model/vehicle_model.dart';

void main() {
  test('createVehicle adds a new vehicle', () {
    final vehicleNotifier = VehicleModelNotifier();

    final newVehicle = vehicleNotifier.createVehicle('Brand', 'Model', 'ABC123');

    expect(newVehicle, isNotNull);
    expect(newVehicle.vehicleId, equals(1));
    expect(vehicleNotifier.state, contains(newVehicle));
  });

  test('getLicensePlateList returns a list of license plates', () {
    final vehicleNotifier = VehicleModelNotifier();
    final existingVehicle = VehicleModel(vehicleId: 1, brand: 'Brand', model: 'Model', licensePlate: 'ABC123');
    vehicleNotifier.loadVehicleData(existingVehicle);

    final licensePlateList = vehicleNotifier.getLicensePlateList();

    expect(licensePlateList, contains(existingVehicle.licensePlate));
  });

  test('getVehicleById returns the correct vehicle', () {
    final vehicleNotifier = VehicleModelNotifier();
    const targetVehicleId = 1;
    final existingVehicle = VehicleModel(vehicleId: targetVehicleId, brand: 'Brand', model: 'Model', licensePlate: 'ABC123');
    vehicleNotifier.loadVehicleData(existingVehicle);

    final retrievedVehicle = vehicleNotifier.getVehicleById(targetVehicleId);

    expect(retrievedVehicle, isNotNull);
    expect(retrievedVehicle!.vehicleId, equals(targetVehicleId));
  });

  test('searchVehicleByLP returns the correct vehicle', () {
    final vehicleNotifier = VehicleModelNotifier();
    const targetLicensePlate = 'ABC123';
    final existingVehicle = VehicleModel(vehicleId: 1, brand: 'Brand', model: 'Model', licensePlate: targetLicensePlate);
    vehicleNotifier.loadVehicleData(existingVehicle);

    final searchedVehicle = vehicleNotifier.searchVehicleByLP(targetLicensePlate);

    expect(searchedVehicle, isNotNull);
    expect(searchedVehicle!.licensePlate, equals(targetLicensePlate));
  });

  test('editVehicle modifies vehicle properties', () {
    final vehicleNotifier = VehicleModelNotifier();
    final initialVehicle = VehicleModel(vehicleId: 1, brand: 'Brand', model: 'Model', licensePlate: 'ABC123');
    vehicleNotifier.loadVehicleData(initialVehicle);

    final updatedVehicle = vehicleNotifier.editVehicle(initialVehicle, 'NewBrand', 'NewModel', 'XYZ789');

    expect(updatedVehicle, isNotNull);
    expect(updatedVehicle.brand, equals('NewBrand'));
    expect(updatedVehicle.model, equals('NewModel'));
    expect(updatedVehicle.licensePlate, equals('XYZ789'));
  });

  test('removeVehicle removes the vehicle', () {
    final vehicleNotifier = VehicleModelNotifier();
    const targetVehicleId = 1;
    final existingVehicle = VehicleModel(vehicleId: targetVehicleId, brand: 'Brand', model: 'Model', licensePlate: 'ABC123');
    vehicleNotifier.loadVehicleData(existingVehicle);

    vehicleNotifier.removeVehicle(existingVehicle);

    expect(vehicleNotifier.state, isNot(contains(existingVehicle)));
  });
}
