class Person {
  String name;
  String personalNumber;
  Person({required this.name, required this.personalNumber});

  bool isValid() {
    final RegExp personalNumberExp = RegExp(r'^\d{12}$');
    return name.isNotEmpty && personalNumberExp.hasMatch(personalNumber);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'personalNumber': personalNumber,
    };
  }

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      personalNumber: json['personalNumber'],
    );
  }
}

class Vehicle {
  String registrationNumber;
  String type;
  Person owner;

  Vehicle(
      {required this.registrationNumber,
      required this.type,
      required this.owner});

  bool isValid() {
    return registrationNumber.isNotEmpty && type.isNotEmpty && owner.isValid();
  }

  Map<String, dynamic> toJson() {
    return {
      'registrationNumber': registrationNumber,
      'type': type,
      'owner': owner.toJson(),
    };
  }

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      registrationNumber: json['registrationNumber'],
      type: json['type'],
      owner: Person.fromJson(json['owner']),
    );
  }
}

class Parking {
  Vehicle vehicle;
  ParkingSpace parkingSpace;
  DateTime startTime;
  DateTime endTime;

  Parking(
      {required this.vehicle,
      required this.parkingSpace,
      required this.startTime,
      required this.endTime});

  double calculateCost() {
    final duration = endTime.difference(startTime).inHours;
    return duration * parkingSpace.pricePerHour;
  }
}

class ParkingSpace {
  String id;
  String address;
  double pricePerHour;

  ParkingSpace(
      {required this.id, required this.address, required this.pricePerHour});
}
