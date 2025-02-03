import 'dart:io';
import 'package:cli_assignment/repositories/parkingspace.dart';

void handleParkingSpaceMenu(ParkingSpaceRepository parkingSpaceRepository) {
  while (true) {
    print('Parking Space Menu');
    print('1. View Parking Spaces');
    print('2. Add Parking Space');
    print('3. Remove Parking Space');
    print('4. Exit');

    stdout.write('Please select an option: ');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        viewParkingSpaces();
        break;
      case '2':
        addParkingSpace();
        break;
      case '3':
        removeParkingSpace();
        break;
      case '4':
        return;
      default:
        print('Invalid option, please try again.');
    }
  }
}

void viewParkingSpaces() {
  // Implement the logic to view parking spaces
  print('Viewing parking spaces...');
}

void addParkingSpace() {
  // Implement the logic to add a parking space
  print('Adding a parking space...');
}

void removeParkingSpace() {
  // Implement the logic to remove a parking space
  print('Removing a parking space...');
}