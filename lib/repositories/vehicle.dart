import '/models/models.dart';

class VehicleRepository {
  final List<Vehicle> _vehicles = [];

  Future<void> add(Vehicle vehicle) async {
    _vehicles.add(vehicle);
  }

  Future<List<Vehicle>> getAll() async {
    return _vehicles;
  }

  Future<Vehicle?> getByRegNr(String regNr) async {
    try {
      return _vehicles.firstWhere(
        (vehicle) => vehicle.registrationNumber == regNr,
      );
    } catch (e) {
      return null;
    }
  }

  Future<List<Vehicle>> getByOwner(String ownerName) async {
    return _vehicles.where((vehicle) => vehicle.owner.name == ownerName).toList();
  }

  Future<void> update(String registrationNumber, Vehicle updatedVehicle) async {
    var index =
        _vehicles.indexWhere((vehicle) => vehicle.registrationNumber == registrationNumber);
    if (index != -1) {
      _vehicles[index] = updatedVehicle;
    } else {
      throw Exception('Vehicle with registration number $registrationNumber not found');
    }
  }

  Future<void> delete(String registrationNumber) async {
    var index =
        _vehicles.indexWhere((vehicle) => vehicle.registrationNumber == registrationNumber);
    if (index != -1) {
      _vehicles.removeAt(index);
    } else {
      throw Exception('Vehicle with registration number $registrationNumber not found');
    }
  }
}
