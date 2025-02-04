import 'dart:io';
import 'package:cli_assignment/repositories/parkingspace.dart';
import 'package:cli_assignment/models/models.dart';

void handleParkingSpaceMenu(ParkingSpaceRepository parkingSpaceRepository) {
  while (true) {
    print('Parking Space Menu');
    print('1. View Parking Spaces');
    print('2. Add Parking Space');
    print('3. Update Parking Space');
    print('4. Remove Parking Space');
    print('5. Back to Main Menu');

    stdout.write('Please select an option: ');
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        viewParkingSpaces(parkingSpaceRepository);
        break;
      case '2':
        addParkingSpace(parkingSpaceRepository);
        break;
      case '3':
        updateParkingSpace(parkingSpaceRepository);
        break;
      case '4':
        removeParkingSpace(parkingSpaceRepository);
        break;
      case '5':
        return;
      default:
        print('Invalid option, please try again.');
    }
  }
}

void viewParkingSpaces(ParkingSpaceRepository parkingSpaceRepository) {
  var parkingSpaces = parkingSpaceRepository.getAll();
  if (parkingSpaces.isEmpty) {
    print('No parking spaces available.');
  } else {
    for (var parkingSpace in parkingSpaces) {
      print('ID: ${parkingSpace.id}, Address: ${parkingSpace.address}, Price per Hour: ${parkingSpace.pricePerHour}');
    }
  }
}

void addParkingSpace(ParkingSpaceRepository parkingSpaceRepository) {
  stdout.write('Enter ID of the parking space: ');
  var id = stdin.readLineSync();
  stdout.write('Enter address: ');
  var address = stdin.readLineSync();
  stdout.write('Enter hourly rate: ');
  var priceInput = stdin.readLineSync();

  if (id != null && address != null && priceInput != null) {
    try {
      var pricePerHour = double.parse(priceInput);
      var parkingSpace = ParkingSpace(id: id, address: address, pricePerHour: pricePerHour);
      parkingSpaceRepository.add(parkingSpace);
      print('Parking space added successfully.');
    } catch (e) {
      print('Invalid input. Please enter valid numbers for ID and hourly rate.');
    }
  } else {
    print('Invalid input. Please try again.');
  }
}

void updateParkingSpace(ParkingSpaceRepository parkingSpaceRepository) {
  stdout.write('Enter the ID of the parking space to update: ');
  var id = stdin.readLineSync();
  var parkingSpace = parkingSpaceRepository.getById(id!);

  if (parkingSpace != null) {
    stdout.write('Enter new address: ');
    var newAddress = stdin.readLineSync();
    stdout.write('Enter new hourly rate: ');
    var newPriceInput = stdin.readLineSync();

    if (newAddress != null && newPriceInput != null) {
      try {
        var newPricePerHour = double.parse(newPriceInput);
        var updatedParkingSpace = ParkingSpace(id: parkingSpace.id, address: newAddress, pricePerHour: newPricePerHour);
        parkingSpaceRepository.update(parkingSpace.id, updatedParkingSpace);
        print('Parking space updated successfully.');
      } catch (e) {
        print('Invalid input. Please enter a valid number for the hourly rate.');
      }
    } else {
      print('Invalid input. Please try again.');
    }
  } else {
    print('Parking space not found.');
  }
}

void removeParkingSpace(ParkingSpaceRepository parkingSpaceRepository) {
  stdout.write('Enter the ID of the parking space to remove: ');
  var id = stdin.readLineSync();
  parkingSpaceRepository.delete(id!);
  print('Parking space removed successfully.');
}