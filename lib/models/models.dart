class Person {
  String name;
  String personalNumber;

  Person({required this.name, required this.personalNumber});
}

class Vehicle {
  String registrationNumber;
  String type;
  Person owner;

  Vehicle({required this.registrationNumber, required this.type, required this.owner});
}

class ParkingSpace {
  int id;
  String address;
  double pricePerHour;

  ParkingSpace({required this.id, required this.address, required this.pricePerHour});
}

class Parking {
  Vehicle vehicle;
  ParkingSpace parkingSpace;
  DateTime startTime;
  DateTime endTime;

  Parking({required this.vehicle, required this.parkingSpace, required this.startTime, required this.endTime});
}