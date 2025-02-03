import 'dart:io';
import 'package:cli_assignment/models/models.dart';
import 'package:cli_assignment/repositories/vehicle.dart';

void handleVehicleMenu(VehicleRepository vehicleRepository) {
  while (true) {
    print('1. Add Vehicle');
    print('2. View Vehicles');
    print('3. Update Vehicle');
    print('4. Delete Vehicle');
    print('5. Back to Main Menu');
    stdout.write('Choose an option: ');
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addVehicle(vehicleRepository);
        break;
      case '2':
        viewVehicles(vehicleRepository);
        break;
      case '3':
        updateVehicle(vehicleRepository);
        break;
      case '4':
        deleteVehicle(vehicleRepository);
        break;
      case '5':
        return;
      default:
        print('Invalid option. Please try again.');
    }
  }
}

void addVehicle(VehicleRepository vehicleRepository) {
  stdout.write('Enter registration number: ');
  var registrationNumber = stdin.readLineSync();
  stdout.write('Enter type: ');
  var type = stdin.readLineSync();
  stdout.write('Enter owner name: ');
  var ownerName = stdin.readLineSync();
  var owner = Person(name: ownerName ?? '', personalNumber: '');

  if (registrationNumber != null && type != null && ownerName != null) {
    var vehicle = Vehicle(
      registrationNumber: registrationNumber,
      type: type,
      owner: owner,
    );
    vehicleRepository.add(vehicle);
    print('Vehicle added successfully.');
  } else {
    print('Invalid input. Please try again.');
  }
}

void viewVehicles(VehicleRepository vehicleRepository) {
  var vehicles = vehicleRepository.getAll();
  if (vehicles.isEmpty) {
    print('No vehicles available.');
  } else {
    for (var vehicle in vehicles) {
      print('Registration Number: ${vehicle.registrationNumber}, Type: ${vehicle.type}, Owner: ${vehicle.owner.name}');
    }
  }
}

void updateVehicle(VehicleRepository vehicleRepository) {
  stdout.write('Enter the registration number of the vehicle to update: ');
  var registrationNumber = stdin.readLineSync();
  var vehicle = vehicleRepository.getByRegNr(registrationNumber!);

  if (vehicle != null) {
    stdout.write('Enter new type: ');
    var newType = stdin.readLineSync();
    stdout.write('Enter new owner name: ');
    var newOwnerName = stdin.readLineSync();
    var newOwner = Person(name: newOwnerName ?? '', personalNumber: '');

    if (newType != null && newOwnerName != null) {
      vehicle.type = newType;
      vehicle.owner = newOwner;
      vehicleRepository.update(registrationNumber, vehicle);
      print('Vehicle updated successfully.');
    } else {
      print('Invalid input. Please try again.');
    }
  } else {
    print('Vehicle not found.');
  }
}

void deleteVehicle(VehicleRepository vehicleRepository) {
  stdout.write('Enter the registration number of the vehicle to delete: ');
  var registrationNumber = stdin.readLineSync();
  vehicleRepository.delete(registrationNumber!);
  print('Vehicle deleted successfully.');
}
