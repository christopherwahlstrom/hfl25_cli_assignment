import '/models/models.dart';

class ParkingRepository {
  final List<Parking> _parkings = [];

  void add(Parking parking) {
    _parkings.add(parking);
  }

  List<Parking> getAll() {
    return _parkings;
  }

  ParkingSpace? getByVehicleRegNr(String regNr) {
    try {
      return _parkings
          .firstWhere(
            (parking) => parking.vehicle.registrationNumber == regNr,
          )
          .parkingSpace;
    } catch (e) {
      return null;
    }
  }

  void update(String regNr, Parking updatedParking) {
    var index = _parkings
        .indexWhere((parking) => parking.vehicle.registrationNumber == regNr);
        if (index != -1) {
          _parkings[index] = updatedParking;
        } else {
          throw Exception('Parking with vehicle registration number $regNr not found');
        }
  }

  void delete(String regNr) {
    var index = _parkings.indexWhere((parking) => parking.vehicle.registrationNumber == regNr);
    if(index != -1) {
      _parkings.removeAt(index);
    } else {
      throw Exception('Parking with vehicle registration number $regNr not found');
    }
  }
}
