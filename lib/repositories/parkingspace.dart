import '/models/models.dart';

class ParkingSpaceRepository {
  final List<ParkingSpace> _parkingSpaces = [];

  Future<void> add(ParkingSpace parkingSpace) async {
    _parkingSpaces.add(parkingSpace);
  }

  Future<List<ParkingSpace>> getAll() async {
    return _parkingSpaces;
  }

  Future<ParkingSpace?> getById(String id) async{
    try {
      return _parkingSpaces.firstWhere(
        (parkingSpace) => parkingSpace.id == id,
      );
    } catch (e) {
      return null;
    }
  }

  Future<void> update(String id, ParkingSpace updatedParkingSpace) async {
    var index = _parkingSpaces.indexWhere((parkingSpace) => parkingSpace.id == id);
    if (index != -1) {
      _parkingSpaces[index] = updatedParkingSpace;
    } else {
      throw Exception('Parking space with ID $id not found');
    }
  }

  Future<void> delete(String id) async {
    var index = _parkingSpaces.indexWhere((parkingSpace) => parkingSpace.id == id);
    if (index != -1) {
      _parkingSpaces.removeAt(index);
    } else {
      throw Exception('Parking space with address $id not found');
    }
  }
}