import '/models/models.dart';

class ParkingSpaceRepository {
  final List<ParkingSpace> _parkingSpaces = [];

  void add(ParkingSpace parkingSpace) {
    _parkingSpaces.add(parkingSpace);
  }

  List<ParkingSpace> getAll() {
    return _parkingSpaces;
  }

  ParkingSpace? getById(int id) {
    try {
      return _parkingSpaces.firstWhere(
        (parkingSpace) => parkingSpace.id == id,
      );
    } catch (e) {
      return null;
    }
  }

  void update(int id, ParkingSpace updatedParkingSpace) {
    var index = _parkingSpaces.indexWhere((parkingSpace) => parkingSpace.id == id);
    if (index != -1) {
      _parkingSpaces[index] = updatedParkingSpace;
    } else {
      throw Exception('Parking space with ID $id not found');
    }
  }

  void delete(String address) {
    var index = _parkingSpaces.indexWhere((parkingSpace) => parkingSpace.address == address);
    if (index != -1) {
      _parkingSpaces.removeAt(index);
    } else {
      throw Exception('Parking space with address $address not found');
    }
  }
}